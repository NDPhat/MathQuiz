import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/utils/logic.dart';
import '../../../application/utils/make_quiz.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/bot_dua_screen.dart';
import '../../widget/cir_per_indicator.dart';
import '../../widget/divider_line.dart';
import '../../widget/line_info_player.dart';
import '../../widget/playey_dual_screen.dart';
import '../../widget/show_alert_test.dart';
import '../../widget/time_runner.dart';

class BotDual extends StatefulWidget {
  const BotDual({Key? key}) : super(key: key);
  @override
  State<BotDual> createState() => _BOTBattleScreenState();
}

class _BOTBattleScreenState extends State<BotDual> {
  late Timer _timer, timer, timerNew;
  int _totalTime = 0;
  late QuizBrain _quizBrain;
  String level = "easy";
  int _scoreBot = 0;
  bool userClick = false;
  int _scoreHM = 0;
  int _falsePlayer = 3;
  late int timeSave;
  double _value = 0;
  int userChoose = 1;
  int _start = 5;
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      level = ModalRoute.of(context)!.settings.arguments as String;
      findTimeForBot();
      showReadyDialog();
    });
  }

  void _startGame() async {
    _quizBrain.makeQuizBOT(level);
    _startTimer();
    _checkAnswer();
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

  void _startTimer() {
    const speed = Duration(seconds: 1);
    _timer = Timer.periodic(speed, (timer) {
      if (_value > 0) {
        setState(() {
          _value > 1 / 60 ? _value -= 1 / 60 : _value = 0;
          _totalTime = (_value * 60 + 1).toInt();
        });
      } else {
        setState(() {
          _totalTime = 0;
          timer.cancel();
          _timer.cancel();
          if (_scoreBot > _scoreHM) {
            showEndDialog("BOT Winning");
          } else if (_scoreHM > _scoreBot) {
            showEndDialog("Player Winning");
          } else {
            showEndDialog("No One Winning");
          }
        });
      }
    });
  }

  void _checkAnswer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start <= 1) {
          _checkAnswerBot();
          findTimeForBotNextTime();
          _quizBrain.makeQuizBOT(level);
          setState(() {
            timer.cancel();
          });

          if (_totalTime >= _start) {
            _checkAnswer();
            setState(() {
              timer.cancel();
            });
          }
        } else {
          if (userClick == true) {
            _checkAnswerPlayer(userChoose);
            setState(() {
              timer.cancel();
              userClick = false;
            });
            _quizBrain.makeQuizBOT(level);
            findTimeForBotNextTime();
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
          timeSave = 5;
        });
        break;
      case "medium":
        setState(() {
          _start = 4;
          timeSave = 5;
        });

        break;
      case "hard":
        setState(() {
          _start = 3;
          timeSave = 5;
        });

        break;
    }
  }

  void findTimeForBotNextTime() {
    setState(() {
      _start = timeSave;
    });
  }

  void _checkAnswerPlayer(int userChoice) async {
    if (userChoice == _quizBrain.quizAnswer) {
      playSound('correct-choice.wav');
      setState(() {
        _scoreHM++;
      });
    } else {
      setState(() {
        _falsePlayer--;
        if (_falsePlayer == 0) {
          _timer.cancel();
          showEndDialog("BOT Winning");
        }
      });
      playSound('wrong-choice.wav');
    }
  }

  void _checkAnswerBot() async {
    playSound('correct-choice.wav');
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
              },
              child: const Center(child: Text('GO', style: kTitleTS)),
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
                timer.cancel();
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
                setState(() {
                  _start = 0;
                });
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
                      child: BotDualScreen(
                        size: size,
                        quizBrain: _quizBrain,
                        answerBot: _quizBrain.quizAnswer,
                        level: level,
                        useClick: userClick,
                        timePerQuiz: _start,
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
                            falsePlayer: 0,
                            score: _scoreBot,
                            namePlayer: "BOT")),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    child: Row(children: <Widget>[
                      DivideLine(size: size),
                      Time_Runner(
                        percentTimer: _value,
                        totalTime: _totalTime,
                        size: size,
                      ),
                      DivideLine(size: size)
                    ]),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                    child: Info_Player_Line(
                      size: size,
                      falsePlayer: _falsePlayer,
                      score: _scoreHM,
                      namePlayer: 'Player',
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
                        setState(() {
                          userClick = true;
                          userChoose = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
