import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/logic.dart';
import '../../../data/model/pre_join_homework.dart';
import '../../../data/remote/model/detail_quiz_hw_req.dart';
import '../../../data/remote/model/result_quiz_hw_req.dart';
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

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreJoinQuizHW();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz = ModalRoute.of(context)!.settings.arguments as PreJoinQuizHW;
      showReadyDialog();
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
    showMyDialog();
  }

  Future<void> showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBuild) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            25,
          )),
          backgroundColor: const Color(0xff1542bf),
          title: const FittedBox(
            child:
                Text('GAME OVER', textAlign: TextAlign.center, style: kTitleTS),
          ),
          content: Text('Score: $_score | $_totalNumberOfQuizzes',
              textAlign: TextAlign.center, style: kContentTS),
          actions: [
            TextButton(
              onPressed: () async {
                await instance.get<UserAPIRepo>().updateInfoHomeWorkWeek(
                    ResultQuizHWAPIReq(
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
              },
              child: const Center(child: Text('EXIT', style: kDialogButtonsTS)),
            ),
          ],
        );
      },
    );
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    if (userChoice.toString().isNotEmpty) {
      if (userChoice == _quizBrain.quizAnswer) {
        userAnswer = true;
        playSound('hw_sound.mp3');
        _score++;
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          // _saveData(context);
          _endGame();
        } else {
          // _saveData(context);
          _resetScreen();
        }
      } else {
        userAnswer = false;
        falseChoose++;
        playSound('hw_sound.mp3');
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          // _saveData(context);
          _endGame();
        } else {
          // _saveData(context);
          _resetScreen();
        }
      }
    } else {
      falseChoose++;
      if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
        //_saveData(context);
        _endGame();
      } else {
        //_saveData(context);
        _resetScreen();
      }
    }
  }

  Future<void> showOutDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            25,
          )),
          backgroundColor: const Color(0xff1542bf),
          title: const FittedBox(
            child: Text('DO YOU WANT TO QUIT ?',
                textAlign: TextAlign.center, style: kScoreLabelTextStyle),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                instance.get<UserAPIRepo>().updateInfoHomeWorkWeek(
                    ResultQuizHWAPIReq(
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
              },
              child: const Center(child: Text('YES', style: kDialogButtonsTS)),
            ),
            TextButton(
              onPressed: () {
                _controller.resume();
                Navigator.pop(context);
              },
              child: const Center(child: Text('NO', style: kDialogButtonsTS)),
            ),
          ],
        );
      },
    );
  }

  Future<void> showReadyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            25,
          )),
          backgroundColor: const Color(0xff1542bf),
          title: const FittedBox(
            child: Text('ARE YOU GUYS READY ?',
                textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _controller.start();
                _startGame(_preQuiz);
              },
              child: const Text('GO', style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                instance
                    .get<UserAPIRepo>()
                    .deleteResultHWNotDo(_preQuiz.resultID.toString());
                Navigator.pop(context);
                Navigator.pushNamed(context, Routers.homeUser);
              },
              child: const Text('BACK', style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: kGradientColors,
            ),
          ),
          child: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
            return PortraitModeHomeWork(
              highscore: _highScore,
              score: _score,
              quizBrainObject: _quizBrain,
              onTap: (int value) {
                _checkAnswer(value, context);
                context.read<GameCubit>().addQuizHWToServer(DetailQuizHWAPIReq(
                    quiz: _quizBrain.quiz.toString(),
                    answerSelect: value,
                    answer: _quizBrain.quizAnswer,
                    infoQuiz: userAnswer,
                    resultHWID: _preQuiz.resultID));
                  _makeNewQuiz();
                context.read<GameCubit>().changeDataAfterDoneQ(
                    _score, falseChoose, _score, _totalNumberOfQuizzes);
              },
              trueQ: state.trueQ,
              falseQ: state.falseQ,
              totalQ: _preQuiz.numQ ?? 1,
              quizNow: state.qNow,
              onFinished: () {
                showMyDialog();
              },
              controller: _controller,
              onBack: () {
                _controller.pause();
                showOutDialog();
              },
            );
          })),
    );
  }
}