import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/model/pre_quiz_game_sen_req.dart';
import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/logic.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/model/pre_quiz_game_req.dart';
import '../../../data/remote/model/pre_quiz_game_sen_res.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/remote/model/sentences_quiz_res.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/portrait_mode_game.dart';
import '../../widget/show_end_dialog.dart';

class SentencesGameScreen extends StatefulWidget {
  @override
  _SentencesGameScreenState createState() => _SentencesGameScreenState();
}

class _SentencesGameScreenState extends State<SentencesGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  late PreQuizGameSenModelRes _preQuiz;
  List<SentencesQuizRes>? listData = [];
  String _preIdServerNow = "";
  int userChoose = 1;
  int falseChoose = 0;
  int postNow = 9;
  int _totalNumberOfQuizzes = 0;
  bool userAnswer = false;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreQuizGameSenModelRes();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz =
          ModalRoute.of(context)!.settings.arguments as PreQuizGameSenModelRes;
      _preIdServerNow = _preQuiz.key!;
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
                  _controller.start();
                  _startGame();
                },
                child: const Text('GO', style: kDialogButtonsTS),
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<GameCubit>()
                      .deletePreGameSenNow(_preIdServerNow.toString());
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeUser);
                },
                child: const Text('BACK', style: kDialogButtonsTS),
              ),
            ],
          ),
        );
      },
    );
  }

  void _startGame() async {
    listData = await _quizBrain.getDataForFirstQuizSentences();

    setState(() {
      _quizBrain.makeFirstQuizSentences(listData);
    });
    _score = 0;
    _totalNumberOfQuizzes = 1;
  }

  void _makeNewQuiz() async {
    postNow--;
    _quizBrain.makeOtherQuizSentences(postNow, _quizBrain.quiz, listData);
  }

  void _startGameAgain() async {
    setState(() {
      falseChoose = 0;
      _score = 0;
      _totalNumberOfQuizzes = 0;
    });
    _score = 0;
    _totalNumberOfQuizzes = 1;
  }

  void _resetScreen() {
    setState(() {
      _totalNumberOfQuizzes++;
    });
    _makeNewQuiz();
  }

  void _saveData(BuildContext context) {}
  void _endGame() {
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
        if (_totalNumberOfQuizzes == 10) {
          _endGame();
        } else {
          _resetScreen();
        }
      } else {
        userAnswer = false;
        _saveData(context);
        if (_totalNumberOfQuizzes == 10) {
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
      if (_totalNumberOfQuizzes == 10) {
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

  Future<void> showFinishDialog() {
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
                await instance.get<UserAPIRepo>().updatePreQuizSenGameByID(
                    PreQuizGameSenReq(
                        score: _score,
                        dateSave: DateTime.now().toString(),
                        userID: instance.get<UserGlobal>().id),
                    _preQuiz.key.toString());
                Navigator.pushNamed(context, Routers.homeUser);
              },
              child: const Center(child: Text('EXIT', style: kDialogButtonsTS)),
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
      body: Column(
        children: [
          AppBarWidget(
            size: data,
            onBack: () {},
            textTitle: "Game",
          ),
          BlocBuilder<GameCubit, GameState>(builder: (context, state) {
            return PortraitModeGame(
              highscore: 0,
              score: _score,
              quizBrainObject: _quizBrain,
              onTap: (int value) {
                _checkAnswer(value, context);
                //add quiz to server
                context.read<GameCubit>().changeDataAfterDoneQ(
                    _score, falseChoose, _score, _totalNumberOfQuizzes);
              },
              trueQ: _score,
              falseQ: falseChoose,
              typeOfGame: "Test",
              controller: _controller,
              quizNow: _totalNumberOfQuizzes,
              onFinished: () {
                showFinishDialog();
              },
              size: data,
            );
          }),
        ],
      ),
    );
  }
}
