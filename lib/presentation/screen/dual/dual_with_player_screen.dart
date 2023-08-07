import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/logic.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/divider_line.dart';
import '../../widget/line_info_player.dart';
import '../../widget/playey_dual_screen.dart';
import '../../widget/time_runner.dart';

class PlayerDual extends StatefulWidget {
  const PlayerDual({Key? key}) : super(key: key);
  @override
  State<PlayerDual> createState() => _HumanBattleScreenState();
}

class _HumanBattleScreenState extends State<PlayerDual> {
  late QuizBrain _quizBrain;
  int _score1 = 0;
  int _score2 = 0;
  int _falsePlayer1 = 3;
  int _falsePlayer2 = 3;
  bool startAgain = false;
  int userChoose = 1;
  CountDownController controller = CountDownController();
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showReadyDialog();
    });
  }

  void _startGame() async {
    setState(() {
      _quizBrain.makeQuizTest();
    });
  }

  void _startAgainGame() async {
    setState(() {
      _score1 = 0;
      _score2 = 0;
      _falsePlayer1 = 3;
      _falsePlayer2 = 3;
    });
    startAgain = true;
    controller.reset();
    controller.start();
    _quizBrain.makeQuizTest();
  }

  void _checkAnswerPlayer1(int userChoice) async {
    if (userChoice == _quizBrain.quizAnswer) {
      playSound('correct-choice.wav');
      setState(() {
        _score1++;
      });
      _quizBrain.makeQuizTest();
    } else {
      playSound('wrong-choice.wav');

      setState(() {
        _falsePlayer1--;
        if (_falsePlayer1 == 0) {
          controller.pause();
          showEndDialog("Player2 ${'winning'.tr()}");
        } else {
          _quizBrain.makeQuizTest();
        }
      });
    }
  }

  void _checkAnswerPlayer2(int userChoice) async {
    if (userChoice == _quizBrain.quizAnswer) {
      playSound('correct-choice.wav');
      setState(() {
        _score2++;
      });
      _quizBrain.makeQuizTest();
    } else {
      playSound('wrong-choice.wav');
      setState(() {
        _falsePlayer2--;
        if (_falsePlayer2 == 0) {
          controller.pause();
          showEndDialog("Player1 ${'winning'.tr()}");
        } else {
          _quizBrain.makeQuizTest();
        }
      });
    }
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
          title: FittedBox(
            child: Text('${'are you ready'.tr()}?',
                textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controller.start();
                _startGame();
              },
              child: Text('go'.tr(), style: kTitleTSReadyDL),
            ),
            TextButton(
              onPressed: () {
                if (instance.get<UserGlobal>().onLogin == true) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeUser);
                } else {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeGuest);
                }
              },
              child: Text('exit'.tr(), style: kTitleTSReadyDL),
            ),
          ],
        );
      },
    );
  }

  Future<void> showEndDialog(String player) {
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
          title: FittedBox(
            child: Text(player, textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (instance.get<UserGlobal>().onLogin == true) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeUser);
                } else {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeGuest);
                }
              },
              child: Text('exit'.tr(), style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controller.pause();
                _startAgainGame();
                startAgain = false;
              },
              child: Text('play again'.tr(), style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
  }

  void showEndGame() {
    if (_score2 > _score1) {
      showEndDialog("Player2 ${"winning".tr()}");
    } else if (_score2 < _score1) {
      showEndDialog("PLayer1 ${"winning".tr()}");
    } else {
      showEndDialog("draw".tr());
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
          title: FittedBox(
            child: Text('${'do you want to quiz'.tr()} ?',
                textAlign: TextAlign.center, style: kScoreLabelTextStyle),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (instance.get<UserGlobal>().onLogin == true) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeUser);
                } else {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeGuest);
                }
              },
              child:
                  Center(child: Text('yes'.tr(), style: kScoreLabelTextStyle)),
            ),
            TextButton(
              onPressed: () {
                controller.resume();
                Navigator.pop(context);
              },
              child: Center(child: Text('no'.tr(), style: kTitleTS)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
        textNow: "",
        colorTextAndIcon: colorSystemYeloow,
        onBack: () {
          controller.pause();
          showOutDialog();
        },
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 35.h,
                    child: Column(
                      children: [
                        RotatedBox(
                          quarterTurns: -2,
                          child: PlayerDualScreen(
                            quizBrain: _quizBrain,
                            onTap: (int value) {
                              _checkAnswerPlayer1(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    child: Column(
                      children: [
                        SizedBox(
                          child: RotatedBox(
                              quarterTurns: -2,
                              child: Info_Player_Line(
                                  falsePlayer: _falsePlayer1,
                                  score: _score1,
                                  namePlayer: "Player 1")),
                        ),
                        Row(children: <Widget>[
                          const DivideLine(),
                          Time_Runner(
                            onFinish: () {
                              if (startAgain == false) {
                                showEndGame();
                              }
                            },
                            controller: controller,
                          ),
                          const DivideLine()
                        ]),
                        Info_Player_Line(
                          falsePlayer: _falsePlayer2,
                          score: _score2,
                          namePlayer: 'Player 2',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                    child: Column(
                      children: [
                        PlayerDualScreen(
                          quizBrain: _quizBrain,
                          onTap: (int value) {
                            _checkAnswerPlayer2(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
