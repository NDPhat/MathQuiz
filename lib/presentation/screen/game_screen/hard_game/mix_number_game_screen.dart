import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:drift/drift.dart' as drift;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/pre_test_model.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/main.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import '../../../../application/utils/format.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../data/local/driff/db/db_app.dart';
import '../../../../data/local/repo/pre_test/pre_test__local_repo.dart';
import '../../../../data/model/app_global.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/model/quiz_test_req.dart';
import '../../../routers/navigation.dart';
import '';
import '../../../widget/dialog.dart';
import '../../../widget/portrait_mode_game.dart';

class MixNumberGameScreen extends StatefulWidget {
  const MixNumberGameScreen({Key? key}) : super(key: key);

  @override
  State<MixNumberGameScreen> createState() => _MixNumberGameScreenState();
}

class _MixNumberGameScreenState extends State<MixNumberGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int falseChoose = 0;
  late PreTest preTest;
  int _totalNumberOfQuizzes = 0;
  bool userAnswer = false;
  final CountDownController _controller = CountDownController();
  final _playerCheck = AudioPlayer();
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      preTest = ModalRoute.of(context)!.settings.arguments as PreTest;
      showReadyGameDialog();
    });
  }

  @override
  void dispose() {
    super.dispose();
    soundDispose();
  }

  Future<void> soundDispose() async {
    await _playerCheck.stop();
    _playerCheck.dispose();
  }

  void _startGame() async {
    setState(() {
      _quizBrain.makeQuizTest();
    });
    _score = 0;
    _totalNumberOfQuizzes = 1;
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    _totalNumberOfQuizzes++;
    if (userChoice == _quizBrain.quizAnswer) {
      userAnswer = true;
      _playerCheck.play(AssetSource('correct-choice.wav'),
          volume: instance.get<AppGlobal>().volumeApp);
      _controller.pause();
      DialogCommon().showInfoQuiz("true".tr(), context, colorMainTealPri);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      _controller.resume();
      _score++;
    } else {
      userAnswer = false;
      _controller.pause();
      DialogCommon().showInfoQuiz("false".tr(), context, colorErrorPrimary);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      _controller.resume();
      falseChoose++;
      _playerCheck.play(
          AssetSource(
            'wrong-choice.wav',
          ),
          volume: instance.get<AppGlobal>().volumeApp);
    }
  }

  Future<void> showOutPageDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      desc: '${'do you want to quit'.tr()} ?',
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelOnPress: () {
        _controller.resume();
      },
      btnOkOnPress: () {
        soundDispose();
        updateScore();
      },
    ).show();
  }

  void addData(BuildContext context, int value) {
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().addQuizTestToServer(QuizTestAPIReq(
          quiz: _quizBrain.quiz.toString(),
          answerSelect: value,
          answer: _quizBrain.quizAnswer,
          infoQuiz: userAnswer,
          preTestId: preTest.keyServer));
    } else {
      context.read<GameCubit>().addQuizMixToLocal(QuizTestLocalEntityCompanion(
          preTestId: drift.Value(preTest.id!),
          num1:
              drift.Value(_quizBrain.quiz.toString().split(" ")[0].toString()),
          quiz: drift.Value(_quizBrain.quiz),
          infoQuiz: drift.Value(userAnswer),
          num2:
              drift.Value(_quizBrain.quiz.toString().split(" ")[2].toString()),
          answer: drift.Value(_quizBrain.quizAnswer.toString()),
          answerSelect: drift.Value(value.toString())));
    }
  }

  void updateScore() async {
    if (instance.get<UserGlobal>().onLogin == true) {
      Navigator.pop(context);
      context.read<GameCubit>().updatePreTestServer(
          preTest.keyServer.toString(),
          PreTestAPIModel(
              numQ: _totalNumberOfQuizzes,
              trueQ: _score,
              falseQ: falseChoose,
              status: "DONE",
              score: _score,
              dateSave: formatTimeTestInput.format(DateTime.now()),
              userId: instance.get<UserGlobal>().id));
      Navigator.pushNamed(context, Routers.takeHardQuiz);
    } else {
      Navigator.pop(context);
      instance
          .get<PreTestLocalRepo>()
          .updatePreTest(_score, _totalNumberOfQuizzes, preTest.id!);
      Navigator.pushNamed(context, Routers.takeHardQuiz);
    }
  }

  Future<void> showFinishGameDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'game over'.tr(),
      desc: 'score'.tr() + " : " + '$_score | 5',
      descTextStyle: s20GgBarColorMainTeal,
      btnOkOnPress: () {
        soundDispose();
        updateScore();
      },
    ).show();
  }

  Future<void> showReadyGameDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      desc: '${'are you ready'.tr()} ?',
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelOnPress: () {
        soundDispose();
        deletePreTest();
      },
      btnOkOnPress: () {
        _controller.start();
        _startGame();
      },
    ).show();
  }

  void deletePreTest() {
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().deletePreTestNow(preTest.keyServer.toString());
      Navigator.pushNamed(context, Routers.takeHardQuiz);
    } else {
      instance.get<PreTestLocalRepo>().deletePreTest(preTest.id!);
      Navigator.pushNamed(context, Routers.homeGuest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPageHomePG(
        textNow: "",
        colorTextAndIcon: colorSystemYeloow,
        onBack: () {
          _controller.pause();

          showOutPageDialog();
        },
        child: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
          return PortraitModeGame(
            score: _score,
            quizBrainObject: _quizBrain,
            onTap: (int value) {
              addData(context, value);
              _checkAnswer(value, context);
              _quizBrain.makeQuizTest();
              context.read<GameCubit>().changeDataAfterDoneQ(
                  _score, falseChoose, _score, _totalNumberOfQuizzes);
            },
            trueQ: _score,
            falseQ: falseChoose,
            controller: _controller,
            quizNow: _totalNumberOfQuizzes,
            onFinished: () {
              showFinishGameDialog();
            },
          );
        }),
      ),
    );
  }
}
