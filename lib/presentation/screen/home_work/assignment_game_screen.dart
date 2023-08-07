import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/logic.dart';
import '../../../data/model/pre_join_homework.dart';
import '../../../data/remote/model/detail_quiz_hw_req.dart';
import '../../../data/remote/model/result_quiz_hw_req.dart';
import '../../../domain/bloc/game/game_cubit.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/portrait_mode_hword_user.dart';

class AssignmentGameScreen extends StatefulWidget {
  const AssignmentGameScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentGameScreen> createState() => _GameHWScreenState();
}

class _GameHWScreenState extends State<AssignmentGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  late PreJoinQuizHW _preQuiz;
  int falseChoose = 0;
  bool userAnswer = false;
  int _totalNumberOfQuizzes = 0;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreJoinQuizHW();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz = ModalRoute.of(context)!.settings.arguments as PreJoinQuizHW;
      showReadyDialog();
    });
  }

  void _startGame(PreJoinQuizHW _preQuiz) async {
    setState(() {
      _quizBrain.makeQuizHomeWork(_preQuiz);
    });
    falseChoose = 0;
    _score = 0;
    _totalNumberOfQuizzes = 1;
  }

  void _makeNewQuiz() {
    _quizBrain.makeQuizHomeWork(_preQuiz);
  }

  void _resetScreen() {
    setState(() {
      _totalNumberOfQuizzes++;
    });
  }

  void _endGame() {
    showMyDialog();
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
          title:  FittedBox(
            child:
                Text('game over'.tr(), textAlign: TextAlign.center, style: kTitleTS),
          ),
          content: Text('score'.tr() +":" +' $_score | $_totalNumberOfQuizzes',
              textAlign: TextAlign.center, style: kContentTS),
          actions: [
            TextButton(
              onPressed: () async {
                updatePreHW();
              },
              child:  Center(child: Text('exit'.tr(), style: kDialogButtonsTS)),
            ),
          ],
        );
      },
    );
  }

  _saveData(int value) {
    context.read<GameCubit>().addQuizHWToServer(DetailQuizHWAPIReq(
        quiz: _quizBrain.quiz.toString(),
        answerSelect: value,
        answer: _quizBrain.quizAnswer,
        infoQuiz: userAnswer,
        resultHWID: _preQuiz.resultID));
  }

  void _checkAnswer(int userChoice, BuildContext context) async {
    if (userChoice.toString().isNotEmpty) {
      if (userChoice == _quizBrain.quizAnswer) {
        userAnswer = true;
        playSound('hw_sound.mp3');
        _score++;
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _endGame();
        } else {
          _resetScreen();
        }
      } else {
        userAnswer = false;
        falseChoose++;
        playSound('hw_sound.mp3');
        if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
          _endGame();
        } else {
          _resetScreen();
        }
      }
    } else {
      falseChoose++;
      if (_totalNumberOfQuizzes == _preQuiz.numQ!) {
        _endGame();
      } else {
        _resetScreen();
      }
    }
  }

  void updatePreHW() {
    Navigator.pop(context);
    instance.get<UserAPIRepo>().updateInfoHomeWorkWeek(
        ResultQuizHWAPIReq(
            week: _preQuiz.week,
            numQ: _preQuiz.numQ,
            trueQ: _score,
            lop: instance.get<UserGlobal>().lop.toString(),
            falseQ: falseChoose,
            name: instance.get<UserGlobal>().fullName,
            score: _score,
            userId: instance.get<UserGlobal>().id),
        _preQuiz.resultID.toString());
    Navigator.pushNamed(context, Routers.homeUser);
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
            child: Text('${'do you want to quit'.tr()} ?',
                textAlign: TextAlign.center, style: kScoreLabelTextStyle),
          ),
          actions: [
            TextButton(
              onPressed: () {
                updatePreHW();
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

  void deletePreHW() {
    instance
        .get<UserAPIRepo>()
        .deleteResultHWNotDo(_preQuiz.resultID.toString());
    Navigator.pop(context);
    Navigator.pushNamed(context, Routers.homeUser);
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
                _startGame(_preQuiz);
              },
              child:  Text('go'.tr(), style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                deletePreHW();
              },
              child:  Text('exit'.tr(), style: kDialogButtonsTS),
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
      body: MainPageHomePG(
          onBack: () {
            _controller.pause();
            showOutDialog();
          },
          textNow: "home work".tr(),
          onPressHome: () {},
          colorTextAndIcon: Colors.black,
          child: BlocBuilder<GameCubit, GameState>(builder: (context, state) {
            return PortraitModeHomeWork(
              highscore: _highScore,
              score: _score,
              quizBrainObject: _quizBrain,
              onTap: (int value) {
                _checkAnswer(value, context);
                _saveData(value);
                _makeNewQuiz();
                context.read<GameCubit>().changeDataAfterDoneQ(
                    _score, falseChoose, _score, _totalNumberOfQuizzes);
              },
              trueQ: state.trueQ,
              falseQ: state.falseQ,
              totalQ: _preQuiz.numQ ?? 1,
              quizNow: state.qNow,
              onFinished: () {
                showMyDialog();
              },
              controller: _controller,
            );
          })),
    );
  }
}
