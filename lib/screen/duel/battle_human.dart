import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:math/cons/text_style.dart';
import 'package:math/routers/navigation.dart';
import 'package:math/widget/battle_screen.dart';

import '../../cons/color.dart';
import '../../cons/constants.dart';
import '../../data/model/test_model.dart';
import '../../logic/quizBrain.dart';
import '../../widget/cir_per_indicator.dart';
import '../../widget/show_alert_test.dart';

class HumanBattle extends StatefulWidget {
  const HumanBattle({Key? key}) : super(key: key);
  @override
  State<HumanBattle> createState() => _HumanBattleScreenState();
}

class _HumanBattleScreenState extends State<HumanBattle> {
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

  void _playSound(String soundName) {
    final _player = AudioPlayer();
    _player.play(AssetSource(soundName));
  }

  void _checkAnswerPlayer1(int userChoice, BuildContext context) async {
    if (userChoice == _quizBrain.quizAnswer) {
      _playSound('correct-choice.wav');
      setState(() {
        _score1++;
      });
    } else {
      setState(() {
        _falsePlayer1--;
        if (_falsePlayer1 == 0) {
          showEndDialog("Player2 Winning");
        }
      });
      _playSound('wrong-choice.wav');
    }
    _quizBrain.makeQuizTest();
  }

  void _checkAnswerPlayer2(int userChoice, BuildContext context) async {
    if (userChoice == _quizBrain.quizAnswer) {
      _playSound('correct-choice.wav');
      setState(() {
        _score2++;
      });
    } else {
      setState(() {
        _falsePlayer2--;
        if (_falsePlayer2 == 0) {
          showEndDialog("Player1 Winning");
        }
      });
      _playSound('wrong-choice.wav');
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
              child: const Center(child: Text('GO', style: kTitleTS)),
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
                Navigator.pushNamed(context, Routers.home);
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.05,
            bottom: size.height * 0.05,
            left: size.width * 0.02,
            right: size.width * 0.02),
        child: Center(
          child: Column(
            children: [
              RotatedBox(
                quarterTurns: -2,
                child: BattleScreen(
                  size: size,
                  quizBrain: _quizBrain,
                  onTap: (int value) {
                    _checkAnswerPlayer1(value, context);
                  },
                ),
              ),
              RotatedBox(
                quarterTurns: -2,
                child: Container(
                  padding: EdgeInsets.only(
                      left: size.width * 0.02, right: size.width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.36,
                        child: Row(
                          children: [
                            Visibility(
                              visible: _falsePlayer1 >= 1,
                              child: const Icon(
                                Icons.heart_broken,
                                size: 20,
                                color: colorMainBlue,
                              ),
                            ),
                            Visibility(
                              visible: _falsePlayer1 >= 2,
                              child: const Icon(
                                Icons.heart_broken,
                                size: 20,
                                color: colorMainBlue,
                              ),
                            ),
                            Visibility(
                              visible: _falsePlayer1 >= 3,
                              child: const Icon(
                                Icons.heart_broken,
                                size: 20,
                                color: colorMainBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        child: const Text(
                          'Player 1',
                          style: s16f700ColorBlueMa,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.2,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                _score1.toString(),
                                style: s16f700ColorBlueMa,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              const CircleAvatar(
                                backgroundColor: colorMainBlue,
                                radius: 10,
                                child: Icon(
                                  Icons.check,
                                  size: 10,
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  child: Row(children: <Widget>[
                buildDivider(),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: colorSystemWhite,
                  child: CirPerIndicator(
                    percentValue: _value,
                    totalTime: _totalTime,
                  ),
                ),
                buildDivider()
              ])),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.02, right: size.width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.36,
                      child: Row(
                        children: [
                          Visibility(
                            visible: _falsePlayer2 >= 1,
                            child: const Icon(
                              Icons.heart_broken,
                              size: 20,
                              color: colorErrorPrimary,
                            ),
                          ),
                          Visibility(
                            visible: _falsePlayer2 >= 2,
                            child: const Icon(
                              Icons.heart_broken,
                              size: 20,
                              color: colorErrorPrimary,
                            ),
                          ),
                          Visibility(
                            visible: _falsePlayer2 >= 3,
                            child: const Icon(
                              Icons.heart_broken,
                              size: 20,
                              color: colorErrorPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      child: const Text(
                        'Player 2',
                        style: s16f700ColorError,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _score2.toString(),
                              style: s16f700ColorError,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const CircleAvatar(
                              backgroundColor: colorErrorPrimary,
                              radius: 10,
                              child: Icon(
                                Icons.check,
                                size: 10,
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              BattleScreen(
                size: size,
                quizBrain: _quizBrain,
                onTap: (int value) {
                  _checkAnswerPlayer2(value, context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildDivider() {
    return const Expanded(
      child: Divider(
        color: colorMainBlueChart,
        height: 20,
      ),
    );
  }
}
