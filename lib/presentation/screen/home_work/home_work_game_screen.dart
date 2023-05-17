import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/model/pre_quiz_hw_response.dart';
import 'package:math/presentation/widget/portrait_mode_game.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';
import '../../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../../domain/bloc/game/game_cubit.dart';
import '../../../domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../main.dart';

import '../../widget/show_alert_dialog.dart';
import '../../widget/show_alert_test.dart';

class HomeWorkGameScreen extends StatefulWidget {
  const HomeWorkGameScreen({Key? key}) : super(key: key);

  @override
  State<HomeWorkGameScreen> createState() => _GameHWScreenState();
}

class _GameHWScreenState extends State<HomeWorkGameScreen> {
  late Timer _timer;
  int _totalTime = 0;
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  late PreQuizHWResponse _preQuiz;
  int _preIdNow = 0;
  int userChoose = 1;
  double _value = 0;
  int falseChoose = 0;
  int _totalNumberOfQuizzes = 0;

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreQuizHWResponse();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz =
          ModalRoute.of(context)!.settings.arguments as PreQuizHWResponse;
      _startGame(_preQuiz);
    });
  }

  void _startGame(PreQuizHWResponse _preQuiz) async {
    _quizBrain.makeQuizHomeWork(_preQuiz);
    _startTimer();
    _value = 1;
    falseChoose = 0;
    _score = 0;
    _totalNumberOfQuizzes = 1;
  }

  void _makeNewQuiz() async {
    _quizBrain.makeQuizHomeWork(_preQuiz);
    _value = 0;
    _startTimer();
    _value = 1;
  }

  void _startTimer() {
    const speed = Duration(milliseconds: 100);
    _timer = Timer.periodic(speed, (timer) {
      if (_value > 0) {
        setState(() {
          _value > 1 / (_preQuiz.timePerQuiz! * 10)
              ? _value -= 1 / (_preQuiz.timePerQuiz! * 10)
              : _value = 0;
          _totalTime = (_value * (_preQuiz.timePerQuiz!) + 1).toInt();
        });
      } else {
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _endGame();
        } else {
          // _saveData(context);
          _resetScreen();
        }
      }
    });
  }

  void _resetScreen() {
    setState(() {
      _timer.cancel();
      _totalNumberOfQuizzes++;
      falseChoose++;
    });
    _makeNewQuiz();
  }

  _updateScore() {
    PreQuizCubit(preQuizLocalRepo: instance.get<PreQuizGameRepo>())
        .updateScoreQuizGame(_score, _preIdNow);
  }

  void _endGame() {
    _timer.cancel();
    showMyDialog();
  }

  Future<void> showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBuild) {
        return BlocProvider.value(
            value: BlocProvider.of<GameCubit>(context),
            child: ShowAlerTesttDialog(
              score: _score,
              preId: 1,
              totalNumberOfQuizzes: _totalNumberOfQuizzes,
            ));
      },
    );
  }

  void _playSound(String soundName) {
    final _player = AudioPlayer();
    _player.play(AssetSource(soundName));
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    if (userChoice.toString().isNotEmpty) {
      if (userChoice == _quizBrain.quizAnswer) {
        _playSound('correct-choice.wav');
        _score++;
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          // _saveData(context);
          _updateScore();
          _endGame();
        } else {
          // _saveData(context);
          _resetScreen();
        }
      } else {
        _playSound('wrong-choice.wav');
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          // _saveData(context);
          _updateScore();
          _endGame();
        } else {
          // _saveData(context);
          _resetScreen();
        }
      }
    } else {
      if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
        //_saveData(context);
        _endGame();
      } else {
        //_saveData(context);
        _resetScreen();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.school),
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Practice', style: s30f500colorSysWhite),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: kGradientColors,
            ),
          ),
          child: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
            return PortraitModeGame(
              highscore: _highScore,
              score: _score,
              quizBrainObject: _quizBrain,
              percentValue: _value,
              timeNow: _totalTime,
              onTap: (int value) {
                setState(() {
                  userChoose = value;
                });
                _checkAnswer(value, context);
                context.read<GameCubit>().changeDataAfterDoneQ(
                    _score, falseChoose, _score, _totalNumberOfQuizzes);
              },
              trueQ: state.trueQ,
              falseQ: state.falseQ,
              totalQ: _preQuiz.numQ ?? 1,
              quizNow: state.qNow,
              size: data, onBack: () {  },
            );
          })),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
