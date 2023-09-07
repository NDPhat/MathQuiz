import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/result_hw_repo.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import '../../../application/cons/text_style.dart';
import '../../../data/model/pre_join_homework.dart';
import '../../../data/remote/model/quiz_hw_req.dart';
import '../../../data/remote/model/result_hw_req.dart';
import '../../../domain/bloc/game/game_cubit.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/portrait_mode_hword_user.dart';

class AssignmentGameScreen extends StatefulWidget {
  const AssignmentGameScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentGameScreen> createState() => _GameHWScreenState();
}

class _GameHWScreenState extends State<AssignmentGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  late PreJoinQuizHW _preQuiz;
  int falseChoose = 0;
  bool userAnswer = false;
  int _totalNumberOfQuizzes = 0;
  final CountDownController _controller = CountDownController();
  final _player = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  Future<void> soundDispose() async {
    _player.dispose();
  }

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreJoinQuizHW();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz = ModalRoute.of(context)!.settings.arguments as PreJoinQuizHW;
      showReadyGameDialog();
    });
  }

  void _startGame(PreJoinQuizHW _preQuiz) async {
    setState(() {
      _quizBrain.makeQuizHomeWork(_preQuiz);
    });
    falseChoose = 0;
    _score = 0;
    _totalNumberOfQuizzes = 1;
  }

  void _makeNewQuiz() {
    _quizBrain.makeQuizHomeWork(_preQuiz);
  }

  void _resetScreen() {
    setState(() {
      _totalNumberOfQuizzes++;
    });
  }

  void _endGame() {
    showFinishGameDialog();
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
        deletePreHW();
      },
      btnOkOnPress: () {
        _controller.start();
        _startGame(_preQuiz);
      },
    ).show();
  }

  Future<void> showFinishGameDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      title: 'time up'.tr(),
      descTextStyle: s20GgBarColorMainTeal,
      btnOkOnPress: () {
        soundDispose();
        Navigator.pushNamed(context, Routers.assignmentMainScreen);
      },
    ).show();
  }

  _saveData(int value) {
    context.read<GameCubit>().addQuizHWToServer(QuizHWAPIReq(
        quiz: _quizBrain.quiz.toString(),
        answerSelect: value,
        answer: _quizBrain.quizAnswer,
        infoQuiz: userAnswer,
        resultHWID: _preQuiz.resultID));
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    if (userChoice.toString().isNotEmpty) {
      if (userChoice == _quizBrain.quizAnswer) {
        userAnswer = true;
        _player.play(AssetSource('hw_sound.mp3'));
        _score++;
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _endGame();
        } else {
          _resetScreen();
        }
      } else {
        userAnswer = false;
        falseChoose++;
        _player.play(AssetSource('hw_sound.mp3'));
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _endGame();
        } else {
          _resetScreen();
        }
      }
    } else {
      falseChoose++;
      if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
        _endGame();
      } else {
        _resetScreen();
      }
    }
  }

  void updatePreHW() {
    Navigator.pop(context);
    instance.get<ResultHWRepo>().updateInfoHomeWorkWeek(
        ResultHWAPIReq(
            week: _preQuiz.week,
            numQ: _preQuiz.numQ,
            trueQ: _score,
            lop: instance.get<UserGlobal>().lop.toString(),
            falseQ: falseChoose,
            name: instance.get<UserGlobal>().fullName,
            score: _score,
            userId: instance.get<UserGlobal>().id),
        _preQuiz.resultID.toString());
    Navigator.pushNamed(context, Routers.homeUser);
  }

  void deletePreHW() {
    instance
        .get<ResultHWRepo>()
        .deleteResultHWNotDo(_preQuiz.resultID.toString());
    Navigator.pushNamed(context, Routers.homeUser);
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
        updatePreHW();
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MainPageHomePG(
          onBack: () {
            _controller.pause();
            showOutPageDialog();
          },
          textNow: "home work".tr(),
          onPressHome: () {},
          colorTextAndIcon: Colors.black,
          child: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
            return PortraitModeHomeWork(
              highscore: _highScore,
              score: _score,
              quizBrainObject: _quizBrain,
              onTap: (int value) {
                _checkAnswer(value, context);
                _saveData(value);
                _makeNewQuiz();
                context.read<GameCubit>().changeDataAfterDoneQ(
                    _score, falseChoose, _score, _totalNumberOfQuizzes);
              },
              trueQ: state.trueQ,
              falseQ: state.falseQ,
              totalQ: _preQuiz.numQ ?? 1,
              quizNow: state.qNow,
              onFinished: () {
                showFinishGameDialog();
              },
              controller: _controller,
            );
          })),
    );
  }
}
