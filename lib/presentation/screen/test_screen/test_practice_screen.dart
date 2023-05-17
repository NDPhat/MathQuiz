import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/model/test_model.dart';
import 'package:math/domain/bloc/test/test_cubit.dart';
import 'package:math/domain/home_repo.dart';
import 'package:math/main.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/utils/logic.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../domain/bloc/game/game_cubit.dart';
import '../../routers/navigation.dart';

import '../../widget/portrait_mode_game.dart';
import '../../widget/show_alert_dialog.dart';
import '../../widget/show_alert_test.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late QuizBrain _quizBrain;
  late PreTest preTest;
  int _score = 0;
  int _highScore = 0;
  int userChoose = 1;
  int falseChoose = 0;
  int _totalNumberOfQuizzes = 0;
  late HomeRepo homeRepo;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    preTest = PreTest();
    homeRepo = HomeRepo(
        preTestLocalRepo: instance.get<PreTestLocalRepo>(),
        userLocalAPIRepo: instance.get<UserLocalAPIRepo>());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      preTest = await ModalRoute.of(context)!.settings.arguments as PreTest;
      showReadyDialog();
    });
  }

  void _startGame() async {
    setState(() {
      _quizBrain.makeQuizTest();
    });
    _score = 0;
    _totalNumberOfQuizzes = 1;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _highScore = preferences.getInt('highscore') ?? 0;
  }

  void _addData(BuildContext context) {
    context.read<TestCubit>().addDataToLocal(QuizTestEntityCompanion(
        preId: Value(preTest.id!),
        num1: Value(int.parse(_quizBrain.quiz.toString().split(" ")[0])),
        sign: Value(_quizBrain.quiz.toString().split(" ")[1]),
        num2: Value(int.parse(_quizBrain.quiz.toString().split(" ")[2])),
        answer: Value(_quizBrain.quizAnswer),
        answerSelect: Value(userChoose ?? 0)));
  }

  _updateScoreAndNumQ() {
    homeRepo.updateScoreAndSumQ(_score, _totalNumberOfQuizzes, preTest.id!);
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    _totalNumberOfQuizzes++;
    if (userChoice == _quizBrain.quizAnswer) {
      playSound('correct-choice.wav');
      _score++;
    } else {
      setState(() {
        falseChoose++;
      });
      playSound('wrong-choice.wav');
    }
    _addData(context);
    _quizBrain.makeQuizTest();
  }

  Future<void> showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return ShowAlerTesttDialog(
          score: _score,
          totalNumberOfQuizzes: _totalNumberOfQuizzes,
          preId: preTest.id!,
        );
      },
    );
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
                Navigator.pushNamed(context, Routers.homeGuest);
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
                _startGame();
              },
              child: const Text('GO', style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routers.homeGuest);
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
    var data = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: kGradientColors,
            ),
          ),
          child: BlocBuilder<TestCubit, TestState>(builder: (context, state) {
            return PortraitModeGame(
              highscore: _highScore,
              score: _score,
              quizBrainObject: _quizBrain,
              onTap: (int value) {
                setState(() {
                  userChoose = value;
                });
                _checkAnswer(value, context);
              },
              trueQ: _score,
              falseQ: falseChoose,
              typeOfGame: "Test",
              controller: _controller,
              quizNow: _totalNumberOfQuizzes,
              onFinished: () {
                setState(() {
                  _updateScoreAndNumQ();
                  showMyDialog();
                });
              },
              size: data,
              onBack: () {
                _controller.pause();
                showOutDialog();
              },
            );
          })),
    );
  }
}