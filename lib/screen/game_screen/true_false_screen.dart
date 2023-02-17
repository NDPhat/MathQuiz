import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/utils/format.dart';
import '../../cons/color.dart';
import '../../cons/constants.dart';
import '../../cons/text_style.dart';
import '../../data/local/driff/db/db_app.dart';
import '../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../data/model/make_quiz.dart';
import '../../domain/bloc/game/game_cubit.dart';
import '../../domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import '../../logic/quizBrain.dart';
import '../../main.dart';
import '../../widget/landscape_mode.dart';
import '../../widget/portrait_mode.dart';
import '../../widget/portrait_mode_tf.dart';
import '../../widget/show_alert_dialog.dart';

class TrueFalseScreen extends StatefulWidget {
  const TrueFalseScreen({Key? key}) : super(key: key);

  @override
  State<TrueFalseScreen> createState() => _TrueFalseScreenState();
}

class _TrueFalseScreenState extends State<TrueFalseScreen> {
  late Timer _timer;
  int _totalTime = 0;
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  late PreQuiz _preQuiz;
  int _preIdNow = 0;
  String userChoose = "True";
  double _value = 0;
  int falseChoose = 0;
  int _totalNumberOfQuizzes = 0;

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreQuiz();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz = ModalRoute.of(context)!.settings.arguments as PreQuiz;
      _preIdNow = _preQuiz.id!;
      _startGame(_preQuiz);
    });
  }

  void _startGame(PreQuiz _preQuiz) async {
    _quizBrain.makeQuizTrueFalse(_preQuiz);
    _startTimer();
    _value = 1;
    _score = 0;
    _totalNumberOfQuizzes = 1;
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _highScore = _preferences.getInt('highscore') ?? 0;
  }

  void _makeNewQuiz() async {
    _quizBrain.makeQuizTrueFalse(_preQuiz);
    _value = 0;
    _startTimer();
    _value = 1;
  }

  void _startGameAgain() async {
    setState(() {
      _value = 0;
      _totalTime = 0;
      _preIdNow++;
      falseChoose = 0;
      _score = 0;
      _totalNumberOfQuizzes = 0;
    });
    instance.get<PreQuizLocalRepo>().insertPreQuiz(PreQuizEntityCompanion(
        sNum: Value(_preQuiz.startNum!),
        eNum: Value(_preQuiz.endNum!),
        numQ: Value(_preQuiz.numQ!),
        sign: Value(_preQuiz.sign!),
        timePer: Value(_preQuiz.timePer!),
        dateSave: Value(formatDateInput.format(DateTime.now()))));
    _quizBrain.makeQuizTrueFalse(_preQuiz);
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
          _value > 1 / (_preQuiz.timePer! * 10)
              ? _value -= 1 / (_preQuiz.timePer! * 10)
              : _value = 0;
          _totalTime = (_value * (_preQuiz.timePer!) + 1).toInt();
        });
      } else {
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _endGame();
        } else {
          _saveData(context);
          _resetScreen();
        }
      }
    });
  }

  void _resetScreen() {
    _timer.cancel();
    _totalNumberOfQuizzes++;
    _makeNewQuiz();
  }

  void _saveData(BuildContext context) {
    context.read<GameCubit>().addDataToLocal(QuizPraEntityCompanion(
        preId: Value(_preIdNow),
        num1: Value(int.parse(_quizBrain.quiz.toString().split(" ")[0])),
        sign: Value(_preQuiz.sign!),
        num2: Value(int.parse(_quizBrain.quiz.toString().split(" ")[2])),
        answer: Value(_quizBrain.quizAnswer),
        answerSelect: Value(userChoose == "True" ? 1 : 0)));
  }

  _updateScore() {
    PreQuizCubit(preQuizLocalRepo: instance.get<PreQuizLocalRepo>())
        .updateScore(_score, _preIdNow);
  }

  void _endGame() {
    _timer.cancel();
    showMyDialog();
  }

  void _playSound(String soundName) {
    final _player = AudioCache();
    _player.play(soundName);
  }

  void _checkAnswer(String userChoice, BuildContext context) async {
    if (userChoice.isNotEmpty) {
      if (userChoice == _quizBrain.getQuizTrueFalse) {
        _playSound('correct-choice.wav');
        _score++;
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _saveData(context);
          _updateScore();
          _endGame();
        } else {
          _saveData(context);
          _resetScreen();
        }
      } else {
        _playSound('wrong-choice.wav');
        setState(() {
          falseChoose++;
        });
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _saveData(context);
          _updateScore();
          _endGame();
        } else {
          _saveData(context);
          _resetScreen();
        }
      }
    } else {
      if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
        _saveData(context);
        _endGame();
      } else {
        setState(() {
          falseChoose++;
        });
        _saveData(context);
        _resetScreen();
      }
    }
  }

  Future<void> showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBuild) {
        return BlocProvider.value(
            value: BlocProvider.of<GameCubit>(context),
            child: ShowAlertDialog(
              score: _score,
              preId: _preQuiz.id!,
              totalNumberOfQuizzes: _totalNumberOfQuizzes,
              startGame: _startGameAgain,
            ));
      },
    );
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: kGradientColors,
          ),
        ),
        child: data.width < data.height
            ? BlocBuilder<GameCubit, GameState>(builder: (context, state) {
                return PortraitModeTF(
                  highscore: _highScore,
                  score: _score,
                  quizBrainObject: _quizBrain,
                  percentValue: _value,
                  totalTime: _totalTime,
                  onTap: (String value) {
                    _checkAnswer(value, context);
                    context.read<GameCubit>().changeDataAfterDoneQ(
                        _score, falseChoose, _score, _totalNumberOfQuizzes);
                  },
                  trueQ: state.trueQ,
                  falseQ: state.falseQ,
                  totalQ: _preQuiz.numQ ?? 1,
                  quizNow: state.qNow,
                );
              })
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
