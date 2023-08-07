import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:drift/drift.dart' as drift;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/model/pre_test_model.dart';
import 'package:math/domain/bloc/game/game_cubit.dart';
import 'package:math/main.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/logic.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../data/local/driff/db/db_app.dart';
import '../../../../data/local/repo/pre_test/pre_test_repo.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../../data/remote/model/pre_test_req.dart';
import '../../../../data/remote/model/quiz_test_req.dart';
import '../../../routers/navigation.dart';
import '';
import '../../../widget/portrait_mode_game.dart';

class MixNumberGameScreen extends StatefulWidget {
  const MixNumberGameScreen({Key? key}) : super(key: key);

  @override
  State<MixNumberGameScreen> createState() => _MixNumberGameScreenState();
}

class _MixNumberGameScreenState extends State<MixNumberGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  int falseChoose = 0;
  late PreTest preTest;
  int _totalNumberOfQuizzes = 0;
  bool userAnswer = false;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      preTest = ModalRoute.of(context)!.settings.arguments as PreTest;
      showReadyDialog();
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
          title:  FittedBox(
            child: Text('${'do you want to quiz'.tr()} ?',
                textAlign: TextAlign.center, style: kScoreLabelTextStyle),
          ),
          actions: [
            TextButton(
              onPressed: () {
                updateScore();
              },
              child:  Center(child: Text('yes'.tr(), style: kDialogButtonsTS)),
            ),
            TextButton(
              onPressed: () {
                _controller.resume();
                Navigator.pop(context);
              },
              child:  Center(child: Text('no'.tr(), style: kDialogButtonsTS)),
            ),
          ],
        );
      },
    );
  }

  void addData(BuildContext context, int value) {
    if (instance.get<UserGlobal>().onLogin == true) {
      context.read<GameCubit>().addQuizTestToServer(QuizTestReq(
          quiz: _quizBrain.quiz.toString(),
          answerSelect: value,
          answer: _quizBrain.quizAnswer,
          infoQuiz: userAnswer,
          preTestID: preTest.keyServer));
    } else {
      context.read<GameCubit>().addQuizMixToLocal(QuizTestEntityCompanion(
          preId: drift.Value(preTest.id!),
          num1:
              drift.Value(_quizBrain.quiz.toString().split(" ")[0].toString()),
          quiz: drift.Value(_quizBrain.quiz),
          infoQuiz: drift.Value(userAnswer),
          num2:
              drift.Value(_quizBrain.quiz.toString().split(" ")[2].toString()),
          answer: drift.Value(_quizBrain.quizAnswer.toString()),
          answerSelect: drift.Value(value.toString())));
    }
  }

  void updateScore() async {
    if (instance.get<UserGlobal>().onLogin == true) {
      Navigator.pop(context);
      instance.get<UserAPIRepo>().updatePreQuizTestByID(
          PreTestReq(
              sumQ: _totalNumberOfQuizzes,
              trueQ: _score,
              falseQ: falseChoose,
              score: _score,
              dateSave: DateTime.now().toString(),
              userID: instance.get<UserGlobal>().id),
          preTest.keyServer.toString());
      Navigator.pushNamed(context, Routers.homeUser);
    } else {
      Navigator.pop(context);
      instance
          .get<PreTestLocalRepo>()
          .updatePreTest(_score, _totalNumberOfQuizzes, preTest.id!);
      Navigator.pushNamed(context, Routers.homeGuest);
    }
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
              onPressed: () {
                updateScore();
              },
              child: const Center(child: Text('EXIT', style: kDialogButtonsTS)),
            ),
          ],
        );
      },
    );
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
          title:  FittedBox(
            child: Text('${'are you ready'.tr()} ?',
                textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _controller.start();
                _startGame();
              },
              child:  Text('go'.tr(), style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                deletePreTest();
              },
              child:  Text('exit'.tr(), style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
  }

  void deletePreTest() {
    if (instance.get<UserGlobal>().onLogin == true) {
      instance
          .get<UserAPIRepo>()
          .deleteTestingNotDoByPreTestId(preTest.keyServer.toString());
      Navigator.pop(context);
      Navigator.pushNamed(context, Routers.homeUser);
    } else {
      instance.get<PreTestLocalRepo>().deletePreTest(preTest.id!);
      Navigator.pop(context);
      Navigator.pushNamed(context, Routers.homeGuest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMainBlue,
      body: MainPageHomePG(
        textNow: "",
        colorTextAndIcon: colorSystemYeloow,
        onBack: () {
          _controller.pause();
          showOutDialog();
        },
        child: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
          return PortraitModeGame(
            highscore: _highScore,
            score: _score,
            quizBrainObject: _quizBrain,
            onTap: (int value) {
              addData(context, value);
              _checkAnswer(value, context);
              _quizBrain.makeQuizTest();
              context.read<GameCubit>().changeDataAfterDoneQ(
                  _score, falseChoose, _score, _totalNumberOfQuizzes);
            },
            trueQ: _score,
            falseQ: falseChoose,
            controller: _controller,
            quizNow: _totalNumberOfQuizzes,
            onFinished: () {
              showFinishDialog();
            },
          );
        }),
      ),
    );
  }
}
