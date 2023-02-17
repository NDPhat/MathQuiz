import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/test/test_repo.dart';
import 'package:math/data/model/test_model.dart';
import 'package:math/domain/home_repo.dart';
import 'package:math/main.dart';
import 'package:math/widget/show_alert_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cons/constants.dart';
import '../../data/model/make_quiz.dart';
import '../../logic/quizBrain.dart';
import '../../widget/landscape_mode.dart';
import '../../widget/portrait_mode.dart';
import '../../widget/show_alert_dialog.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Timer _timer;
  int _totalTime = 0;
  late QuizBrain _quizBrain;
  late PreTest preTest;
  int _score = 0;
  int _highScore = 0;
  double _value = 0;
  int userChoose = 1;
  int _totalNumberOfQuizzes = 0;
  late HomeRepo homeRepo;
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    preTest = PreTest();
    homeRepo = HomeRepo(preTestLocalRepo: instance.get<PreTestLocalRepo>());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      preTest = await ModalRoute.of(context)!.settings.arguments as PreTest;
      _startGame();
    });
  }

  void _startGame() async {
    _quizBrain.makeQuizTest();
    _startTimer();
    _value = 1;
    _score = 0;
    _totalNumberOfQuizzes = 1;
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _highScore = _preferences.getInt('highscore') ?? 0;
  }

  void _startTimer() {
    const speed = Duration(milliseconds: 100);
    _timer = Timer.periodic(speed, (timer) {
      if (_value > 0) {
        setState(() {
          _value > 1 / 600 ? _value -= 1 / 600 : _value = 0;
          _totalTime = (_value * 60 + 1).toInt();
        });
      } else {
        setState(() {
          _totalTime = 0;
          _updateScoreAndNumQ();
          showMyDialog();
          _timer.cancel();
        });
      }
    });
  }

  void _addData() {
    instance.get<TestLocalRepo>().insertTest(QuizTestEntityCompanion(
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

  void _playSound(String soundName) {
    final _player = AudioCache();
    _player.play(soundName);
  }

  void _checkAnswer(int userChoice) async {
    _totalNumberOfQuizzes++;
    if (userChoice == _quizBrain.quizAnswer) {
      _playSound('correct-choice.wav');
      _score++;
    } else {
      _playSound('wrong-choice.wav');
    }
    _addData();
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
          preId: 1,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: kGradientColors,
          ),
        ),
        child: data.width < data.height
            ? PortraitMode(
                highscore: _highScore,
                score: _score,
                quizBrainObject: _quizBrain,
                percentValue: _value,
                totalTime: _totalTime,
                onTap: (int value) {
                  setState(() {
                    userChoose = value;
                  });
                  _checkAnswer(value);
                },
              )
            : LandscapeMode(
                highscore: _highScore,
                score: _score,
                quizBrainObject: _quizBrain,
                percentValue: _value,
                totalTime: _totalTime,
                onTap: (int value) {
                  _checkAnswer(value);
                },
              ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
