import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:drift/drift.dart' as driff;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/format.dart';
import '../../../../application/utils/logic.dart';
import '../../../../data/local/driff/db/db_app.dart';
import '../../../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../../../data/model/make_quiz.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../../data/remote/model/pre_quiz_game_req.dart';
import '../../../../data/remote/model/pre_quiz_game_response.dart';
import '../../../../data/remote/model/quiz_game_req.dart';
import '../../../../domain/bloc/game/game_cubit.dart';
import '../../../../domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/portrait_mode_game.dart';
import '../../../widget/show_end_dialog.dart';

class FindMissingNumberGameScreen extends StatefulWidget {
  const FindMissingNumberGameScreen({Key? key}) : super(key: key);
  @override
  State<FindMissingNumberGameScreen> createState() =>
      _FindMissingNumberGameScreenState();
}

class _FindMissingNumberGameScreenState
    extends State<FindMissingNumberGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  late PreQuizGame _preQuiz;
  int _preIdNow = 0;
  String _preIdServerNow = "";
  int userChoose = 1;
  int falseChoose = 0;
  int _totalNumberOfQuizzes = 0;
  bool userAnswer = false;
  final CountDownController _controller = CountDownController();
  bool playAgain = false;

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreQuizGame();
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
                  _controller.start();
                  _startGame(_preQuiz);
                },
                child: const Text('GO', style: kDialogButtonsTS),
              ),
              TextButton(
                onPressed: () {
                  deletePreGame();
                },
                child: const Text('BACK', style: kDialogButtonsTS),
              ),
            ],
          ),
        );
      },
    );
  }

  void deletePreGame() {
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().deletePreGameNow(_preIdServerNow.toString());
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
  }

  void _startGame(PreQuizGame _preQuiz) async {
    setState(() {
      _quizBrain.makeQuizFindMissing(_preQuiz);
    });
    _score = 0;
    _totalNumberOfQuizzes = 1;
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _highScore = _preferences.getInt('highscore') ?? 0;
  }

  void _makeNewQuiz() async {
    _quizBrain.makeQuizFindMissing(_preQuiz);
  }

  Future<void> addNewDataPlayAgain() async {
    if (instance.get<UserGlobal>().onLogin == true) {
      PreQuizGameAPIModel? newData =
          await instance.get<UserAPIRepo>().createPreQuizGame(PreQuizGameAPIReq(
              numQ: 0,
              status: "GOING",
              sign: _preQuiz.sign,
              score: 0,
              optionGame: _preQuiz.option,
              userID: instance.get<UserGlobal>().id,
              dateSave: formatDateInput.format(
                DateTime.now(),
              )));
      _preIdServerNow = newData!.key!;
    } else {
      instance.get<PreQuizGameRepo>().insertPreQuizGame(
          PreQuizGameEntityCompanion(
              numQ: driff.Value(0),
              sign: driff.Value(_preQuiz.sign!),
              option: driff.Value(_preQuiz.option!),
              dateSave: driff.Value(formatDateInput.format(DateTime.now()))));
      final data = await instance.get<PreQuizGameRepo>().getLatestPreQuizGame();
      // cap nhap lai id
      _preIdNow = data.id;
    }
  }

  void _startGameAgain() {
    setState(() {
      falseChoose = 0;
      _score = 0;
      _totalNumberOfQuizzes = 0;
    });
    addNewDataPlayAgain();
    // them tren server
    playAgain = true;
    _controller.reset();
    _controller.start();
    _quizBrain.makeQuizFindMissing(_preQuiz);
    _score = 0;
    _totalNumberOfQuizzes = 1;
    playAgain = false;
  }

  void _resetScreen() {
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
    } else {
      context.read<GameCubit>().addQuizGameToLocal(QuizGameEntityCompanion(
          preId: driff.Value(_preIdNow),
          num1:
              driff.Value(_quizBrain.quiz.toString().split(" ")[0].toString()),
          sign: driff.Value(_preQuiz.sign!),
          quiz: driff.Value(_quizBrain.quiz),
          infoQuiz: driff.Value(userAnswer),
          num2:
              driff.Value(_quizBrain.quiz.toString().split(" ")[2].toString()),
          answer: driff.Value(_quizBrain.quizAnswer.toString()),
          answerSelect: driff.Value(userChoose.toString())));
    }
  }

  updateScore() {
    if (instance.get<UserGlobal>().onLogin == true) {
      instance.get<UserAPIRepo>().updatePreQuizGameByID(
          PreQuizGameAPIReq(
              score: _score, status: "DONE", numQ: _totalNumberOfQuizzes),
          _preIdServerNow);
    } else {
      PreQuizCubit(
              preQuizLocalRepo: instance.get<PreQuizGameRepo>(),
              userAPIRepo: instance.get<UserAPIRepo>())
          .updateScoreQuizGame(_score, _preIdNow, _totalNumberOfQuizzes);
    }
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    if (userChoice.toString().isNotEmpty) {
      if (userChoice == _quizBrain.getQuizMissing) {
        userAnswer = true;
        _saveData(context);
        playSound('correct-choice.wav');
        _score++;
        _resetScreen();
      } else {
        userAnswer = false;
        _saveData(context);
        playSound('wrong-choice.wav');
        falseChoose++;
        _resetScreen();
      }
    } else {
      userAnswer = false;
      _saveData(context);
      falseChoose++;
      _resetScreen();
    }
  }

  Future<void> showFinishDiaLog() {
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
                updateScore();
                if (instance.get<UserGlobal>().onLogin == true) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeUser);
                } else {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeGuest);
                }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMainBlue,
      body: Column(
        children: [
          AppBarWidget(
            onBack: () {
              _controller.pause();
              showOutDialog();
            },
          ),
          BlocBuilder<GameCubit, GameState>(builder: (context, state) {
            return PortraitModeGame(
              highscore: _highScore,
              score: _score,
              quizBrainObject: _quizBrain,
              onTap: (int value) {
                userChoose = value;
                _checkAnswer(value, context);
                context.read<GameCubit>().changeDataAfterDoneQ(
                    _score, falseChoose, _score, _totalNumberOfQuizzes);
              },
              trueQ: state.trueQ,
              falseQ: falseChoose,
              onFinished: () {
                if (playAgain == false) {
                  updateScore();
                  showFinishDiaLog();
                }
              },
              controller: _controller,
              quizNow: _totalNumberOfQuizzes,
            );
          }),
        ],
      ),
    );
  }
}
