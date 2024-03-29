import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:drift/drift.dart' as driff;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/text_style.dart';
import '../../../../application/enum/game_status.dart';
import '../../../../application/utils/format.dart';
import '../../../../data/local/driff/db/db_app.dart';
import '../../../../data/model/app_global.dart';
import '../../../../data/model/make_quiz.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/model/pre_pra_res.dart';
import '../../../../data/remote/model/pre_pra_req.dart';
import '../../../../data/remote/model/quiz_pra_req.dart';
import '../../../../domain/bloc/game/game_cubit.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/dialog.dart';
import '../../../widget/portrait_mode_game.dart';

class FindMissingNumberGameScreen extends StatefulWidget {
  const FindMissingNumberGameScreen({Key? key}) : super(key: key);
  @override
  State<FindMissingNumberGameScreen> createState() =>
      _FindMissingNumberGameScreenState();
}

class _FindMissingNumberGameScreenState
    extends State<FindMissingNumberGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  late PreQuizGame _preQuiz;
  int _preIdNow = 0;
  String _preIdServerNow = "";
  int userChoose = 1;
  int falseChoose = 0;
  int _totalNumberOfQuizzes = 0;
  bool userAnswer = false;
  final CountDownController _controller = CountDownController();
  bool playAgain = false;
  final _player = AudioPlayer();
  final _playerCheck = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreQuizGame();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preQuiz = ModalRoute.of(context)!.settings.arguments as PreQuizGame;
      _preIdNow = _preQuiz.id!;
      _preIdServerNow = _preQuiz.idServer!;
      showReadyGameDialog();
    });
  }

  @override
  void dispose() {
    super.dispose();
    soundDispose();
  }

  void playSound() {
    _player.play(AssetSource("sound_local/Teru.mp3"),
        volume: instance.get<AppGlobal>().volumeApp);
  }

  Future<void> soundDispose() async {
    await _player.stop();
    await _playerCheck.stop();
    _player.dispose();
    _playerCheck.dispose();
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
        deletePreGame();
        soundDispose();
      },
      btnOkOnPress: () {
        _controller.start();
        _startGame(_preQuiz);
        playSound();
      },
    ).show();
  }

  void deletePreGame() {
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().deletePreGameNow(_preIdServerNow.toString());
    } else {
      context.read<GameCubit>().deletePreGameLocalNow(_preIdNow);
    }
    Navigator.pushNamed(context, Routers.takeMediumQuiz);
  }

  void _startGame(PreQuizGame _preQuiz) async {
    setState(() {
      _quizBrain.makeQuizFindMissing(_preQuiz);
    });
    _score = 0;
    _totalNumberOfQuizzes = 1;
  }

  void _makeNewQuiz() async {
    _quizBrain.makeQuizFindMissing(_preQuiz);
  }

  addNewDataPlayAgain() async {
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().createPrePraServer(PrePraAPIReq(
          numQ: 0,
          status: "GOING",
          sign: _preQuiz.sign,
          score: 0,
          optionGame: _preQuiz.option,
          userId: instance.get<UserGlobal>().id,
          dateSave: formatDateInput.format(
            DateTime.now(),
          )));
      PrePraAPIModel? dataServer =
          await context.read<GameCubit>().getPrePraServerOnDoing();
      if (dataServer != null) {
        _preIdServerNow = dataServer.key!;
      } else {
        showServerErrorDialog();
      }
    } else {
      context.read<GameCubit>().createPrePraLocal(PrePraLocalEntityCompanion(
          sumQ: const driff.Value(0),
          sign: driff.Value(_preQuiz.sign!),
          option: driff.Value(_preQuiz.option!),
          dateSave: driff.Value(formatDateInput.format(DateTime.now()))));
      final data = await context.read<GameCubit>().getLatestPreQuizGame();
      // cap nhap lai id
      _preIdNow = data!.id;
    }
  }

  _startGameAgain() {
    setState(() {
      falseChoose = 0;
      _score = 0;
      _totalNumberOfQuizzes = 0;
    });
    addNewDataPlayAgain();
    // them tren server
    playAgain = true;
    _controller.reset();
    _controller.start();
    _quizBrain.makeQuizFindMissing(_preQuiz);
    _totalNumberOfQuizzes = 1;
    playAgain = false;
  }

  void _resetScreen() {
    setState(() {
      _totalNumberOfQuizzes++;
    });
    _makeNewQuiz();
  }

  void _saveData(BuildContext context) {
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().addQuizToServer(QuizPraAPIReq(
          prePraId: _preIdServerNow,
          sign: _preQuiz.sign!,
          quiz: _quizBrain.quiz,
          infoQuiz: userAnswer,
          answer: _quizBrain.quizAnswer,
          answerSelect: userChoose));
    } else {
      context.read<GameCubit>().addQuizGameToLocal(QuizPraLocalEntityCompanion(
          prePraId: driff.Value(_preIdNow),
          num1:
              driff.Value(_quizBrain.quiz.toString().split(" ")[0].toString()),
          sign: driff.Value(_preQuiz.sign!),
          quiz: driff.Value(_quizBrain.quiz),
          infoQuiz: driff.Value(userAnswer),
          num2:
              driff.Value(_quizBrain.quiz.toString().split(" ")[2].toString()),
          answer: driff.Value(_quizBrain.quizAnswer.toString()),
          answerSelect: driff.Value(userChoose.toString())));
    }
  }

  updateScore() {
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().updatePrePraServer(
          _preIdServerNow,
          PrePraAPIReq(
              score: _score, status: "DONE", numQ: _totalNumberOfQuizzes));
    } else {
      context
          .read<GameCubit>()
          .updateScoreQuizGameLocal(_score, _preIdNow, _totalNumberOfQuizzes);
    }
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    if (userChoice.toString().isNotEmpty) {
      if (userChoice == _quizBrain.getQuizMissing) {
        userAnswer = true;
        _saveData(context);
        _playerCheck.play(AssetSource('correct-choice.wav'),
            volume: instance.get<AppGlobal>().volumeApp);
        _controller.pause();
        DialogCommon().showInfoQuiz("true".tr(), context, colorMainTealPri);
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pop(context);
        });
        _controller.resume();
        _score++;
        _resetScreen();
      } else {
        userAnswer = false;
        _saveData(context);
        _playerCheck.play(
            AssetSource(
              'wrong-choice.wav',
            ),
            volume: instance.get<AppGlobal>().volumeApp);
        _controller.pause();
        DialogCommon().showInfoQuiz("false".tr(), context, colorErrorPrimary);
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pop(context);
        });
        _controller.resume();
        falseChoose++;
        _resetScreen();
      }
    } else {
      userAnswer = false;
      _saveData(context);
      _controller.pause();
      DialogCommon().showInfoQuiz("false".tr(), context, colorErrorPrimary);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      _controller.resume();
      falseChoose++;
      _resetScreen();
    }
  }

  void deletePreGameNotDoing() {
    context.read<GameCubit>().deletePreGameNowError();
    Navigator.pushNamed(context, Routers.takeMediumQuiz);
  }

  Future<void> showServerErrorDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      desc: '${'error server'.tr()} ?',
      descTextStyle: s20GgBarColorMainTeal,
      btnOkOnPress: () {
        soundDispose();
        deletePreGameNotDoing();
      },
    ).show();
  }

  Future<void> showFinishDiaLog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBuild) {
        return AlertDialog(
          backgroundColor: colorSystemWhite,
          alignment: Alignment.center,
          title: GestureDetector(
            onTap: () {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  headerAnimationLoop: false,
                  animType: AnimType.topSlide,
                  dismissOnTouchOutside: false,
                  closeIcon: const Icon(Icons.close_fullscreen_outlined),
                  desc:
                  'score'.tr() + " : " + '$_score | $_totalNumberOfQuizzes',
                  descTextStyle: s20GgBarColorMainTeal,
                  btnOkText: "play again".tr(),
                  btnOkOnPress: () {
                    Navigator.pop(context);
                    _startGameAgain();
                    context.read<GameCubit>().changeDataPlayAgain();
                  },
                  btnCancelOnPress: () {
                    soundDispose();
                    Navigator.pushNamed(context, Routers.takeMediumQuiz);
                  }).show();
            },
            child: Text(
              'game over'.tr(),
              style: s18GgfaBeeColorErrorPri,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Future<void> showEndAfterChooseOutDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'game over'.tr(),
      desc: 'score'.tr() + " : " + '$_score | $_totalNumberOfQuizzes',
      descTextStyle: s20GgBarColorMainTeal,
      btnOkOnPress: () {
        Navigator.pushNamed(context, Routers.takeMediumQuiz);
      },
    ).show();
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
        showEndAfterChooseOutDialog();
      },
    ).show();
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
              userChoose = value;
              _checkAnswer(value, context);
              context.read<GameCubit>().changeDataAfterDoneQ(
                  _score, falseChoose, _score, _totalNumberOfQuizzes);
            },
            trueQ: state.trueQ,
            falseQ: falseChoose,
            onFinished: () {
              if (playAgain == false) {
                updateScore();
                showFinishDiaLog();
              }
            },
            controller: _controller,
            quizNow: _totalNumberOfQuizzes,
          );
        }),
      ),
    );
  }
}
