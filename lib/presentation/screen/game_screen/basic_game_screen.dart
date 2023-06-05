import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';
import 'package:math/data/model/make_quiz.dart';
import 'package:math/data/remote/model/quiz_game_req.dart';
import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/utils/format.dart';
import '../../../application/utils/logic.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import '../../../application/utils/make_quiz.dart';
import '../../routers/navigation.dart';
import '../../widget/portrait_mode_game.dart';
import '../../widget/show_end_dialog.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Timer _timer;
  int _totalTime = 0;
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  late PreQuizGame _preQuiz;
  int _preIdNow = 0;
  String _preIdServerNow = "";
  int userChoose = 1;
  double _value = 0;
  int falseChoose = 0;
  int _totalNumberOfQuizzes = 0;
  bool userAnswer = false;

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreQuizGame();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz = ModalRoute.of(context)!.settings.arguments as PreQuizGame;
      _preIdNow = _preQuiz.id!;
      _preIdServerNow = _preQuiz.idServer!;
      _startGame(_preQuiz);
    });
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
                if (instance.get<UserGlobal>().onLogin == true) {
                } else {}
                Navigator.pop(context);
                _startGame(_preQuiz);
              },
              child: const Text('GO', style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (instance.get<UserGlobal>().onLogin == true) {
                  Navigator.pushNamed(context, Routers.homeUser);
                } else {
                  Navigator.pushNamed(context, Routers.homeGuest);
                }
              },
              child: const Text('BACK', style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
  }

  void _startGame(PreQuizGame _preQuiz) async {
    _quizBrain.makeQuiz(_preQuiz);
    _startTimer();
    _value = 1;
    _score = 0;
    _totalNumberOfQuizzes = 1;
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _highScore = _preferences.getInt('highscore') ?? 0;
  }

  void _makeNewQuiz() async {
    _quizBrain.makeQuiz(_preQuiz);
    _value = 0;
    _startTimer();
    _value = 1;
  }

  void _startGameAgain() async {
    setState(() {
      _value = 0;
      _totalTime = 0;
      falseChoose = 0;
      _score = 0;
      _totalNumberOfQuizzes = 0;
    });
    // them 1 prequiz moi
    instance.get<PreQuizGameRepo>().insertPreQuizGame(
        PreQuizGameEntityCompanion(
            sNum: Value(_preQuiz.startNum!),
            eNum: Value(_preQuiz.endNum!),
            numQ: Value(_preQuiz.numQ!),
            sign: Value(_preQuiz.sign!),
            option: Value(_preQuiz.option!),
            timePer: Value(_preQuiz.timePer!),
            dateSave: Value(formatDateInput.format(DateTime.now()))));
    final data = await instance.get<PreQuizGameRepo>().getLatestPreQuizGame();
    // cap nhap lai id
    _preIdNow = data.id;
    _quizBrain.makeQuiz(_preQuiz);
    _startTimer();
    _value = 1;
    _score = 0;
    _totalNumberOfQuizzes = 1;
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
        // luu lai cau hoi va dap an da khong chon

        userAnswer = false;
        _saveData(context);
        setState(() {
          falseChoose++;
        });
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _updateScore();
          _endGame();
        } else {
          _resetScreen();
        }
      }
    });
  }

  void _resetScreen() {
    _timer.cancel();
    setState(() {
      _totalNumberOfQuizzes++;
    });
    _makeNewQuiz();
  }

  void _saveData(BuildContext context) {
    context.read<GameCubit>().addQuizToServer(QuizGameAPIReq(
        prequizGameID: _preIdServerNow,
        sign: _preQuiz.sign!,
        quiz: _quizBrain.quiz,
        infoQuiz: userAnswer,
        userId: instance.get<UserGlobal>().id!,
        answer: _quizBrain.quizAnswer,
        answerSelect: userChoose));
    context.read<GameCubit>().addQuizToLocal(QuizGameEntityCompanion(
        preId: Value(_preIdNow),
        num1: Value(_quizBrain.quiz.toString().split(" ")[0].toString()),
        sign: Value(_preQuiz.sign!),
        quiz: Value(_quizBrain.quiz),
        infoQuiz: Value(userAnswer),
        num2: Value(_quizBrain.quiz.toString().split(" ")[2].toString()),
        answer: Value(_quizBrain.quizAnswer.toString()),
        answerSelect: Value(userChoose.toString())));
  }

  _updateScore() {
    PreQuizCubit(
            preQuizLocalRepo: instance.get<PreQuizGameRepo>(),
            userAPIRepo: instance.get<UserAPIRepo>())
        .updateScoreQuizGame(_score, _preIdNow);
  }

  void _endGame() {
    _timer.cancel();
    showEndDialog();
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    if (userChoice.toString().isNotEmpty) {
      if (userChoice == _quizBrain.quizAnswer) {
        userAnswer = true;
        _saveData(context);
        playSound('correct-choice.wav');
        _score++;
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _updateScore();
          _endGame();
        } else {
          _resetScreen();
        }
      } else {
        userAnswer = false;
        _saveData(context);
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _updateScore();
          playSound('wrong-choice.wav');
          falseChoose++;
          _endGame();
        } else {
          playSound('wrong-choice.wav');
          falseChoose++;
          _resetScreen();
        }
      }
    } else {
      userAnswer = false;
      _saveData(context);
      if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
        _endGame();
      } else {
        falseChoose++;
        _resetScreen();
      }
    }
  }

  Future<void> showEndDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBuild) {
        return BlocProvider.value(
            value: BlocProvider.of<GameCubit>(context),
            child: ShowEndDialog(
              score: _score,
              preIdServer: _preQuiz.idServer!,
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
              typeOfGame: "Game",
              onTap: (int value) {
                setState(() {
                  userChoose = value;
                });
                _checkAnswer(value, context);
                context.read<GameCubit>().changeDataAfterDoneQ(
                    _score, falseChoose, _score, _totalNumberOfQuizzes);
              },
              trueQ: state.trueQ,
              falseQ: falseChoose,
              totalQ: _preQuiz.numQ ?? 1,
              quizNow: _totalNumberOfQuizzes,
              size: data,
              onBack: () {},
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
