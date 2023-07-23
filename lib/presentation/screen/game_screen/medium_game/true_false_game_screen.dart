import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:drift/drift.dart' as driff;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/model/pre_quiz_game_req.dart';
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
import '../../../../data/remote/model/pre_quiz_game_response.dart';
import '../../../../data/remote/model/quiz_game_req.dart';
import '../../../../domain/bloc/game/game_cubit.dart';
import '../../../../domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/portrait_mode_tf.dart';
import '../../../widget/show_end_dialog.dart';

class TrueFalseGameScreen extends StatefulWidget {
  const TrueFalseGameScreen({Key? key}) : super(key: key);

  @override
  State<TrueFalseGameScreen> createState() => _TrueFalseGameScreenState();
}

class _TrueFalseGameScreenState extends State<TrueFalseGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  late PreQuizGame _preQuiz;
  int _preIdNow = 0;
  String userChoose = "TRUE";
  String _preIdServerNow = "";
  int falseChoose = 0;
  int _totalNumberOfQuizzes = 0;
  bool userAnswer = true;
  final CountDownController _controller = CountDownController();
  bool playAgain = false;
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

  void _startGame(PreQuizGame _preQuiz) async {
    setState(() {
      _quizBrain.makeQuizTrueFalse(_preQuiz);
    });
    _score = 0;
    _totalNumberOfQuizzes = 1;
    SharedPreferences _preferences = await SharedPreferences.getInstance();
  }

  void _makeNewQuiz() async {
    _quizBrain.makeQuizTrueFalse(_preQuiz);
  }

  void _startGameAgain() async {
    setState(() {
      _preIdNow++;
      falseChoose = 0;
      _score = 0;
      _totalNumberOfQuizzes = 0;
    });
    playAgain = true;
    _controller.reset();
    _controller.start();
    addNewDataPlayAgain();
    _quizBrain.makeQuizTrueFalse(_preQuiz);
    playAgain = false;
  }

  Future<void> addNewDataPlayAgain() async {
    if (instance.get<UserGlobal>().onLogin == true) {
      PreQuizGameAPIModel? newData =
          await instance.get<UserAPIRepo>().createPreQuizGame(PreQuizGameAPIReq(
              numQ: _preQuiz.numQ,
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
              numQ: driff.Value(_preQuiz.numQ!),
              sign: driff.Value(_preQuiz.sign!),
              option: driff.Value(_preQuiz.option!),
              dateSave: driff.Value(formatDateInput.format(DateTime.now()))));
      final data = await instance.get<PreQuizGameRepo>().getLatestPreQuizGame();

      // cap nhap lai id
      _preIdNow = data.id;
    }
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
          answer: _quizBrain.quizTrueFalse == "TRUE" ? 1 : 0,
          answerSelect: userChoose == _quizBrain.quizTrueFalse ? 1 : 0));
    } else {
      context.read<GameCubit>().addQuizGameToLocal(QuizGameEntityCompanion(
          preId: driff.Value(_preIdNow),
          num1:
              driff.Value(_quizBrain.quiz.toString().split(" ")[0].toString()),
          sign: driff.Value(_preQuiz.sign!),
          quiz: driff.Value(_quizBrain.quiz.toString()),
          infoQuiz: driff.Value(userAnswer),
          num2:
              driff.Value(_quizBrain.quiz.toString().split(" ")[2].toString()),
          answer: driff.Value(_quizBrain.quizTrueFalse),
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
    Navigator.pop(context);
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().deletePreGameNow(_preIdServerNow.toString());
      Navigator.pushNamed(context, Routers.homeUser);
    } else {
      PreQuizCubit(
              preQuizLocalRepo: instance.get<PreQuizGameRepo>(),
              userAPIRepo: instance.get<UserAPIRepo>())
          .deletePreQuizGame(_preIdNow);
      Navigator.pushNamed(context, Routers.homeGuest);
    }
  }

  void _checkAnswer(String userChoice, BuildContext context) async {
    if (userChoice.isNotEmpty) {
      if (userChoice == _quizBrain.getQuizTrueFalse) {
        // luu lai cau hoi va dap an chon dung
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
              child:
                  const Center(child: Text('YES', style: kScoreLabelTextStyle)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _controller.resume();
              },
              child: const Center(child: Text('NO', style: kTitleTS)),
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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBarWidget(
            onBack: () {
              _controller.pause();
              showOutDialog();
            },
          ),
          BlocBuilder<GameCubit, GameState>(builder: (context, state) {
            return PortraitModeTF(
              score: state.score,
              controller: _controller,
              onFinished: () {
                if (playAgain == false) {
                  updateScore();
                  showFinishDiaLog();
                }
              },
              quizBrainObject: _quizBrain,
              onTap: (String value) {
                _checkAnswer(value, context);
                context.read<GameCubit>().changeDataAfterDoneQ(
                    _score, falseChoose, _score, _totalNumberOfQuizzes);
              },
              trueQ: state.trueQ,
              falseQ: falseChoose,
              quizNow: _totalNumberOfQuizzes,
            );
          }),
        ],
      ),
    );
  }
}
