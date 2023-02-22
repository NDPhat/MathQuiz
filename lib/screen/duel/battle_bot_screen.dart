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
import '../../widget/battle_screen_bot.dart';
import '../../widget/cir_per_indicator.dart';
import '../../widget/show_alert_test.dart';

class BOTBattle extends StatefulWidget {
  const BOTBattle({Key? key}) : super(key: key);
  @override
  State<BOTBattle> createState() => _BOTBattleScreenState();
}

class _BOTBattleScreenState extends State<BOTBattle> {
  late Timer _timer,timer, timerNew;
  int _totalTime = 0;
  late QuizBrain _quizBrain;
  late String level;
  int _scoreBot = 0;
  bool userClick = false;
  late AudioPlayer _player;
  int _scoreHM = 0;
  int _falsePlayer = 3;
  double _value = 0;
  int userChoose = 1;
  int newT = 60;
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _player = AudioPlayer();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      level = ModalRoute.of(context)!.settings.arguments as String;
      findTimeForBot();
      showReadyDialog();
    });
    const oneSec = const Duration(seconds: 1);
    timerNew = Timer.periodic(oneSec, (Timer timer) {
      if (newT == 0) {
        _player.dispose();
        _player.stop();
      } else {
        newT--;
      }
    });
  }

  void _startGame() async {
    _quizBrain.makeQuizBOT(level);
    _startTimer();
    _value = 1;
    _scoreBot = 0;
    _scoreHM = 0;
  }

  void _startAgainGame() async {
    setState(() {
      _value = 1;
      _scoreBot = 0;
      _scoreHM = 0;
      _falsePlayer = 3;
    });
    _quizBrain.makeQuizBOT(level);
    _startTimer();
  }

  bool onTap = false;
  late int _start;

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
          if (_scoreBot > _scoreHM) {
            showEndDialog("BOT Winning");
          } else if (_scoreHM > _scoreBot) {
            showEndDialog("Player Winning");
          } else {
            showEndDialog("No One Winning");
          }
        });
        _timer.cancel();
        _player.dispose();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  void _checkAnswer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          _checkAnswerBot();
          _quizBrain.makeQuizBOT(level);
          setState(() {
            timer.cancel();
            findTimeForBot();
          });
          _checkAnswer();
        } else {
          if (userClick == true) {
            _checkAnswerPlayer(userChoose);
            _quizBrain.makeQuizBOT(level);
            setState(() {
              timer.cancel();
              findTimeForBot();
              userClick = false;
            });
            _checkAnswer();
          } else {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }

  void findTimeForBot() {
    switch (level) {
      case "easy":
        setState(() {
          _start = 5;
        });

        break;
      case "medium":
        _start = 4;
        break;
      case "hard":
        _start = 3;
        break;
    }
  }

  void _playSound(String soundName) {
    _player.play(AssetSource(soundName));
  }

  void _checkAnswerPlayer(int userChoice) async {
    if (userChoice == _quizBrain.quizAnswer) {
      _playSound('correct-choice.wav');
      setState(() {
        _scoreHM++;
      });
    } else {
      setState(() {
        _falsePlayer--;
        if (_falsePlayer == 0) {
          showEndDialog("BOT Winning");
        }
      });
      _playSound('wrong-choice.wav');
    }
  }

  void _checkAnswerBot() async {
    _playSound('correct-choice.wav');
    setState(() {
      _scoreBot++;
    });
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
                _checkAnswer();
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
                _player.pause();
                _player.stop();
                _player.dispose();
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
                child: BattleScreenBot(
                  size: size,
                  quizBrain: _quizBrain,
                  onTap: (int value) {},
                  answerBot: _quizBrain.quizAnswer,
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
                      Container(
                        margin: EdgeInsets.only(
                          left: size.width * 0.42,
                        ),
                        width: size.width * 0.3,
                        child: const Text(
                          'BOT',
                          style: s16f700ColorBlueMa,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.2,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                _scoreBot.toString(),
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
                            visible: _falsePlayer >= 1,
                            child: const Icon(
                              Icons.heart_broken,
                              size: 20,
                              color: colorErrorPrimary,
                            ),
                          ),
                          Visibility(
                            visible: _falsePlayer >= 2,
                            child: const Icon(
                              Icons.heart_broken,
                              size: 20,
                              color: colorErrorPrimary,
                            ),
                          ),
                          Visibility(
                            visible: _falsePlayer >= 3,
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
                        'PLAYER',
                        style: s16f700ColorError,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.2,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _scoreHM.toString(),
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
                  setState(() {
                    userClick = true;
                    userChoose = value;
                  });
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
