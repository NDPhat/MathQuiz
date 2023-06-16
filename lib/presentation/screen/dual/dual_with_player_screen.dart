import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/utils/logic.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/cir_per_indicator.dart';
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
  late Timer _timer;
  int _totalTime = 0;
  late QuizBrain _quizBrain;
  int _score1 = 0;
  int _score2 = 0;
  int _falsePlayer1 = 3;
  int _falsePlayer2 = 3;
  double _value = 0;
  int userChoose = 1;
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showReadyDialog();
    });
  }

  void _startGame() async {
    _quizBrain.makeQuizTest();
    _startTimer();
    _value = 1;
    _score1 = 0;
    _score2 = 0;
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void _startAgainGame() async {
    setState(() {
      _value = 1;
      _score1 = 0;
      _score2 = 0;
      _falsePlayer1 = 3;
      _falsePlayer2 = 3;
    });
    _quizBrain.makeQuizTest();
    _startTimer();
  }

  void _startTimer() {
    const speed = Duration(milliseconds: 100);
    _timer = Timer.periodic(speed, (timer) {
      if (_value > 0) {
        setState(() {
          _value > 1 / 600 ? _value -= 1 / 600 : _value = 0;
          _totalTime = (_value * 60 + 1).toInt();
        });
      } else {
        setState(() {
          _totalTime = 0;
          _timer.cancel();
          if (_score1 > _score2) {
            showEndDialog("Player2 Winning");
          } else if (_score2 > _score1) {
            showEndDialog("Player1 Winning");
          } else {
            showEndDialog("No One Winning");
          }
        });
      }
    });
  }

  void _checkAnswerPlayer1(int userChoice) async {
    if (userChoice == _quizBrain.quizAnswer) {
      playSound('correct-choice.wav');
      setState(() {
        _score1++;
      });
    } else {
      setState(() {
        _falsePlayer1--;
        if (_falsePlayer1 == 0) {
          _timer.cancel();
          showEndDialog("Player2 Winning");
        }
      });
      playSound('wrong-choice.wav');
    }
    _quizBrain.makeQuizTest();
  }

  void _checkAnswerPlayer2(int userChoice) async {
    if (userChoice == _quizBrain.quizAnswer) {
      playSound('correct-choice.wav');
      setState(() {
        _score2++;
      });
    } else {
      setState(() {
        _falsePlayer2--;
        if (_falsePlayer2 == 0) {
          _timer.cancel();
          showEndDialog("Player1 Winning");
        }
      });
      playSound('wrong-choice.wav');
    }
    _quizBrain.makeQuizTest();
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
                Navigator.pushNamed(context, Routers.homeGuest);
              },
              child: const Text('EXIT', style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _startAgainGame();
              },
              child: const Text('PLAY AGAIN', style: kDialogButtonsTS),
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
                _timer.cancel();
                Navigator.pushNamed(context, Routers.homeGuest);
              },
              child:
                  const Center(child: Text('YES', style: kScoreLabelTextStyle)),
            ),
            TextButton(
              onPressed: () {
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
                  showOutDialog();
                }),
            Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.025,
                    right: size.width * 0.025,
                    top: size.height * 0.025,
                    bottom: size.height * 0.025),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.32,
                      child: RotatedBox(
                        quarterTurns: -2,
                        child: PlayerDualScreen(
                          size: size,
                          quizBrain: _quizBrain,
                          onTap: (int value) {
                            _checkAnswerPlayer1(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                      child: RotatedBox(
                          quarterTurns: -2,
                          child: Info_Player_Line(
                              size: size,
                              falsePlayer: _falsePlayer1,
                              score: _score1,
                              namePlayer: "Player 1")),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      child: Row(children: <Widget>[
                        DivideLine(
                          size: size,
                        ),
                        Time_Runner(
                          percentTimer: _value,
                          totalTime: _totalTime,
                          size: size,
                        ),
                        DivideLine(
                          size: size,
                        )
                      ]),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                      child: Info_Player_Line(
                        size: size,
                        falsePlayer: _falsePlayer2,
                        score: _score2,
                        namePlayer: 'Player 2',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    SizedBox(
                      height: size.height * 0.32,
                      child: PlayerDualScreen(
                        size: size,
                        quizBrain: _quizBrain,
                        onTap: (int value) {
                          _checkAnswerPlayer2(value);
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
