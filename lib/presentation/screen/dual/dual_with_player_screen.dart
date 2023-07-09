import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/logic.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
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
          showEndDialog("Player2 Winning");
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
          showEndDialog("Player1 Winning");
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
          title: const FittedBox(
            child: Text('ARE YOU READY ?',
                textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controller.start();
                _startGame();
              },
              child: const Text('GO', style: kTitleTSReadyDL),
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
              child: const Text('BACK', style: kTitleTSReadyDL),
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
            child:
                Text("$player", textAlign: TextAlign.center, style: kTitleTS),
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
              child: const Text('EXIT', style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controller.pause();
                _startAgainGame();
                startAgain = false;
              },
              child: const Text('PLAY AGAIN', style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
  }

  void showEndGame() {
    if (_score2 > _score1) {
      showEndDialog("Player2 Wining");
    } else if (_score2 < _score1) {
      showEndDialog("PLayer1 Wining");
    } else {
      showEndDialog("DRAW");
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
          title: const FittedBox(
            child: Text('DO YOU WANT TO QUIT ?',
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
                  const Center(child: Text('YES', style: kScoreLabelTextStyle)),
            ),
            TextButton(
              onPressed: () {
                controller.resume();
                Navigator.pop(context);
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: Center(
        child: Column(
          children: [
            AppBarWidget(
                size: size,
                onBack: () {
                  controller.pause();
                  showOutDialog();
                }),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.35,
                  child: Column(
                    children: [
                      RotatedBox(
                        quarterTurns: -2,
                        child: PlayerDualScreen(
                          size: size,
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
                  height: size.height * 0.2,
                  child: Column(
                    children: [
                      SizedBox(
                        child: RotatedBox(
                            quarterTurns: -2,
                            child: Info_Player_Line(
                                size: size,
                                falsePlayer: _falsePlayer1,
                                score: _score1,
                                namePlayer: "Player 1")),
                      ),
                      Row(children: <Widget>[
                        DivideLine(size: size),
                        Time_Runner(
                          onFinish: () {
                            if (startAgain == false) {
                              showEndGame();
                            }
                          },
                          size: size,
                          controller: controller,
                        ),
                        DivideLine(size: size)
                      ]),
                      Info_Player_Line(
                        size: size,
                        falsePlayer: _falsePlayer2,
                        score: _score2,
                        namePlayer: 'Player 2',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.35,
                  child: Column(
                    children: [
                      PlayerDualScreen(
                        size: size,
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
    );
  }
}
