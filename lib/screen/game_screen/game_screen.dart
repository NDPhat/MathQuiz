import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../cons/constants.dart';
import '../../logic/quizBrain.dart';
import '../../widget/landscape_mode.dart';
import '../../widget/portrait_mode.dart';
import '../../widget/show_alert_dialog.dart';


class GameScreen extends StatefulWidget {
  static final id = 'game_screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Timer _timer;
  int _totalTime = 0;
  QuizBrain _quizBrain = QuizBrain();
  int _score = 0;
  int _highScore = 0;
  double _value = 0;
  int _falseCounter = 0;
  int _totalNumberOfQuizzes = 0;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() async {
    _quizBrain.makeQuiz();
    _startTimer();
    _value = 1;
    _score = 0;
    _falseCounter = 0;
    _totalNumberOfQuizzes = 0;
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _highScore = _preferences.getInt('highscore') ?? 0;
  }

  void _startTimer() {
    const speed = Duration(milliseconds: 100);
    _timer = Timer.periodic(speed, (timer) {
      if (_value > 0) {
        setState(() {
          _value > 0.005 ? _value -= 0.005 : _value = 0;
          _totalTime = (_value * 20 + 1).toInt();
        });
      } else {
        setState(() {
          _totalTime = 0;
          showMyDialog();
          _timer.cancel();
        });
      }
    });
  }

  void _playSound(String soundName) {
    final _player = AudioCache();
    _player.play(soundName);
  }

  void _checkAnswer(String userChoice) async {
    _totalNumberOfQuizzes++;
    if (userChoice == _quizBrain.quizAnswer) {
      _playSound('correct-choice.wav');
      _score++;
      _value >= 0.89 ? _value = 1 : _value += 0.1;
      if (_highScore < _score) {
        _highScore = _score;
        SharedPreferences _preferences = await SharedPreferences.getInstance();
        _preferences.setInt('highscore', _highScore);
      }
    } else {
      _playSound('wrong-choice.wav');
      _falseCounter++;
      _value < 0.02 * _falseCounter
          ? _value = 0
          : _value -= 0.02 * _falseCounter;
    }
    _quizBrain.makeQuiz();
  }

  Future<void> showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return ShowAlertDialog(
          score: _score,
          totalNumberOfQuizzes: _totalNumberOfQuizzes,
          startGame: _startGame,
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
                onTap: _checkAnswer,
              )
            : LandscapeMode(
                highscore: _highScore,
                score: _score,
                quizBrainObject: _quizBrain,
                percentValue: _value,
                totalTime: _totalTime,
                onTap: _checkAnswer,
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
