import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/data/remote/model/quiz_test_req.dart';
import 'package:math/domain/bloc/test/test_cubit.dart';
import 'package:math/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/logic.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/remote/model/pre_test_req.dart';
import '../../../domain/bloc/game/game_cubit.dart';
import '../../routers/navigation.dart';
import '../../widget/portrait_mode_game.dart';

class TestTingUserGameScreen extends StatefulWidget {
  const TestTingUserGameScreen({Key? key}) : super(key: key);

  @override
  State<TestTingUserGameScreen> createState() => _TestTingUserGameScreenState();
}

class _TestTingUserGameScreenState extends State<TestTingUserGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  int userChoose = 1;
  int falseChoose = 0;
  int _totalNumberOfQuizzes = 0;
  bool userAnswer = false;
  PreTestAPIRes preTestNow = PreTestAPIRes();
  final CountDownController _controller = CountDownController();
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showReadyDialog(preTestNow);
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

  void _checkAnswer(int userChoice, BuildContext context) async {
    _totalNumberOfQuizzes++;
    if (userChoice == _quizBrain.quizAnswer) {
      userAnswer = true;
      playSound('correct-choice.wav');
      _score++;
    } else {
      userAnswer = false;
      falseChoose++;
      playSound('wrong-choice.wav');
    }
    _quizBrain.makeQuizTest();
  }

  Future<void> showMyDialog() {
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
                instance.get<UserAPIRepo>().updatePreQuizTestByID(
                    PreTestReq(
                        sumQ: _totalNumberOfQuizzes,
                        trueQ: _score,
                        falseQ: falseChoose,
                        score: _score,
                        dateSave: DateTime.now().toString(),
                        userID: instance.get<UserGlobal>().id),
                    preTestNow.key.toString());
                Navigator.pushNamed(context, Routers.homeUser);
              },
              child: const Center(child: Text('EXIT', style: kDialogButtonsTS)),
            ),
          ],
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

  Future<void> showReadyDialog(PreTestAPIRes preTestNow) {
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
              onPressed: () async {
                Navigator.pop(context);
                _controller.start();
                preTestNow = (await instance
                    .get<UserAPIRepo>()
                    .createPreQuizTest(PreTestReq(
                        sumQ: 0,
                        score: 0,
                        dateSave: DateTime.now().toString(),
                        trueQ: 0,
                        falseQ: 0,
                        userID: instance.get<UserGlobal>().id!)))!;
                print(preTestNow.key!);
                _startGame();
              },
              child: const Text('GO', style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routers.homeUser);
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
          child: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
            return PortraitModeGame(
              highscore: _highScore,
              score: _score,
              quizBrainObject: _quizBrain,
              onTap: (int value) {
                setState(() {
                  userChoose = value;
                });
                _checkAnswer(value, context);
                print(_quizBrain.quiz.toString());
                context.read<GameCubit>().addQuizTesttoServer(QuizTestReq(
                    quiz: _quizBrain.quiz.toString(),
                    answerSelect: userChoose,
                    answer: _quizBrain.quizAnswer,
                    infoQuiz: userAnswer,
                    preTestID: preTestNow.key!));
              },
              trueQ: _score,
              falseQ: falseChoose,
              typeOfGame: "Test",
              controller: _controller,
              quizNow: _totalNumberOfQuizzes,
              onFinished: () {
                showMyDialog();
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
