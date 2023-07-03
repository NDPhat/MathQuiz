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
import '../../widget/bot_dua_screen.dart';
import '../../widget/divider_line.dart';
import '../../widget/line_info_player.dart';
import '../../widget/playey_dual_screen.dart';
import '../../widget/time_runner.dart';

class BotDual extends StatefulWidget {
  const BotDual({Key? key}) : super(key: key);
  @override
  State<BotDual> createState() => _BOTBattleScreenState();
}

class _BOTBattleScreenState extends State<BotDual> {
  late Timer timer;
  late QuizBrain _quizBrain;
  String level = "easy";
  int _scoreBot = 0;
  bool userClick = false;
  int _scoreHM = 0;
  double _value = 1;
  int _falsePlayer = 3;
  int userChoose = 1;
  int _start = 5;
  CountDownController controller = CountDownController();
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
    _scoreBot = 0;
    _scoreHM = 0;
  }

  void _startAgainGame() async {
    setState(() {
      _scoreBot = 0;
      _scoreHM = 0;
      _falsePlayer = 3;
    });
    _quizBrain.makeQuizBOT(level);
  }

  void doNext() {
    _value = 1;
    _quizBrain.makeQuizBOT(level);
    _startTimer();
  }

  void _startTimer() {
    const speed = Duration(milliseconds: 100);
    timer = Timer.periodic(speed, (timer) {
      print(_value);
      print(1 / (_start! * 10) * 4 / 3);
      if (_value > (1 / (_start! * 10) * 4 / 3)) {
        setState(() {
          _value > 1 / (_start! * 10)
              ? _value -= 1 / (_start! * 10)
              : _value = 0;
        });
      } else {
        _checkAnswerBot();
        setState(() {
          timer.cancel();
        });
        doNext();
      }
    });
  }

  // void checkTheQuiz() {
  //   const oneSec = const Duration(seconds: 1);
  //   timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start <= 1) {
  //         _checkAnswerBot();
  //         setState(() {
  //           timer.cancel();
  //         });
  //         doNext();
  //       } else {
  //         if (userClick == true) {
  //           _checkAnswerPlayer(userChoose);
  //           setState(() {
  //             timer.cancel();
  //             userClick = false;
  //           });
  //           doNext();
  //         } else {
  //           setState(() {
  //             _start--;
  //           });
  //         }
  //       }
  //     },
  //   );
  // }

  void findTimeForBot() {
    switch (level) {
      case "easy":
        _start = 5;
        break;
      case "medium":
        _start = 4;

        break;
      case "hard":
        _start = 3;

        break;
    }
  }

  void _checkAnswerPlayer(int userChoice) async {
    print("click");
    if (userChoice == _quizBrain.quizAnswer) {
      playSound('correct-choice.wav');
      setState(() {
        _scoreHM++;
      });
    } else {
      setState(() {
        _falsePlayer--;
      });
      if (_falsePlayer == 0) {
        showFinishDialog("BOT Winning");
      }
      playSound('wrong-choice.wav');
    }
    setState(() {
      timer.cancel();
    });
    doNext();
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
                controller.start();
                _startGame();
              },
              child: Text('GO', style: kTitleTSReadyDL),
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
              child: Text('BACK', style: kTitleTSReadyDL),
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
                controller.resume();
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
              },
              child: const Center(child: Text('NO', style: kTitleTS)),
            ),
          ],
        );
      },
    );
  }

  Future<void> showFinishDialog(String player) {
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
      resizeToAvoidBottomInset: false,
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
                        child: BotDualScreen(
                          size: size,
                          quizBrain: _quizBrain,
                          answerBot: _quizBrain.quizAnswer,
                          level: level,
                          useClick: userClick,
                          timePerQuizNow: _start,
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
                                falsePlayer: 0,
                                score: _scoreBot,
                                namePlayer: "BOT")),
                      ),
                      Row(children: <Widget>[
                        DivideLine(size: size),
                        Time_Runner(
                          onFinish: () {},
                          size: size,
                          controller: controller,
                        ),
                        DivideLine(size: size)
                      ]),
                      Info_Player_Line(
                        size: size,
                        falsePlayer: _falsePlayer,
                        score: _scoreHM,
                        namePlayer: 'Player',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.35,
                  child: Column(
                    children: [
                      SizedBox(
                        child: PlayerDualScreen(
                          size: size,
                          quizBrain: _quizBrain,
                          onTap: (int value) {
                            setState(() {
                              userClick = true;
                              userChoose = value;
                            });
                            _checkAnswerPlayer(value);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
