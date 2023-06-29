import 'dart:async';
import 'package:drift/drift.dart' as driff;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';
import 'package:math/data/model/make_quiz.dart';
import 'package:math/data/remote/model/quiz_game_req.dart';
import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/format.dart';
import '../../../application/utils/logic.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/model/pre_quiz_game_req.dart';
import '../../../data/remote/model/pre_quiz_game_response.dart';
import '../../../domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import '../../../application/utils/make_quiz.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
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
      showReadyDialog();
    });
  }

  Future<void> showReadyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBui) {
        return BlocProvider.value(
          value: BlocProvider.of<GameCubit>(context),
          child: AlertDialog(
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
                  _startGame(_preQuiz);
                },
                child: const Text('GO', style: kDialogButtonsTS),
              ),
              TextButton(
                onPressed: () {
                  if (instance.get<UserGlobal>().onLogin == true) {
                    context
                        .read<GameCubit>()
                        .deletePreGameNow(_preIdServerNow.toString());
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routers.homeUser);
                  } else {
                    PreQuizCubit(
                            preQuizLocalRepo: instance.get<PreQuizGameRepo>(),
                            userAPIRepo: instance.get<UserAPIRepo>())
                        .deletePreQuizGame(_preIdNow);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routers.homeGuest);
                  }
                },
                child: const Text('BACK', style: kDialogButtonsTS),
              ),
            ],
          ),
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
    // them tren server
    if (instance.get<UserGlobal>().onLogin == true) {
      PreQuizGameAPIModel? newData =
      await instance.get<UserAPIRepo>().createPreQuizGame(PreQuizGameAPIReq(
          sNum: _preQuiz.startNum,
          eNum: _preQuiz.endNum,
          numQ: _preQuiz.numQ,
          status: "GOING",
          sign: _preQuiz.sign,
          score: 0,
          optionGame: _preQuiz.option,
          timePerQuiz: _preQuiz.timePer,
          userID: instance
              .get<UserGlobal>()
              .id,
          dateSave: formatDateInput.format(
            DateTime.now(),
          )));
      _preIdServerNow = newData!.key!;

    }
    // them 1 prequiz moi
    instance.get<PreQuizGameRepo>().insertPreQuizGame(
        PreQuizGameEntityCompanion(
            sNum: driff.Value(_preQuiz.startNum!),
            eNum: driff.Value(_preQuiz.endNum!),
            numQ: driff.Value(_preQuiz.numQ!),
            sign: driff.Value(_preQuiz.sign!),
            option: driff.Value(_preQuiz.option!),
            timePer: driff.Value(_preQuiz.timePer!),
            dateSave: driff.Value(formatDateInput.format(DateTime.now()))));
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
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().addQuizToServer(QuizGameAPIReq(
          prequizGameID: _preIdServerNow,
          sign: _preQuiz.sign!,
          quiz: _quizBrain.quiz,
          infoQuiz: userAnswer,
          userId: instance.get<UserGlobal>().id!,
          answer: _quizBrain.quizAnswer,
          answerSelect: userChoose));
    }
    context.read<GameCubit>().addQuizToLocal(QuizGameEntityCompanion(
        preId: driff.Value(_preIdNow),
        num1: driff.Value(_quizBrain.quiz.toString().split(" ")[0].toString()),
        sign: driff.Value(_preQuiz.sign!),
        quiz: driff.Value(_quizBrain.quiz),
        infoQuiz: driff.Value(userAnswer),
        num2: driff.Value(_quizBrain.quiz.toString().split(" ")[2].toString()),
        answer: driff.Value(_quizBrain.quizAnswer.toString()),
        answerSelect: driff.Value(userChoose.toString())));
  }

  _updateScore() {
    PreQuizCubit(
            preQuizLocalRepo: instance.get<PreQuizGameRepo>(),
            userAPIRepo: instance.get<UserAPIRepo>())
        .updateScoreQuizGame(_score, _preIdNow);
  }

  void _endGame() {
    _timer.cancel();
    if (instance.get<UserGlobal>().onLogin == true) {
      instance.get<UserAPIRepo>().updatePreQuizGameByID(
          PreQuizGameAPIReq(score: _score, status: "DONE"), _preIdServerNow);
    }
    showEndDiaLog();
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

  Future<void> showEndDiaLog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBuild) {
        return BlocProvider.value(
            value: BlocProvider.of<GameCubit>(context),
            child: ShowEndDialog(
              score: _score,
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
      body: Column(
        children: [
          AppBarWidget(
            size: data,
            onBack: () {},
            textTitle: "Game",
          ),
          BlocBuilder<GameCubit, GameState>(builder: (context, state) {
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
            );
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
