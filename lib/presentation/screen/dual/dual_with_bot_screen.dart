import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/logic.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/model/level_game_bot.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
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
  int _scoreBot = 0;
  int _scoreHM = 0;
  late LevelGameBot levelGame;
  double _value = 1;
  int _falsePlayer = 3;
  int userChoose = 1;
  bool playerAgain = false;
  CountDownController controller = CountDownController();
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      levelGame = ModalRoute.of(context)!.settings.arguments as LevelGameBot;
      showReadyDialog();
    });
  }

  void _startGame() async {
    _quizBrain.makeQuizBOT(levelGame.level);
    _startTimer();
    _scoreBot = 0;
    _scoreHM = 0;
  }

  void _startAgainGame() {
    _scoreBot = 0;
    _scoreHM = 0;
    _value = 1;
    _falsePlayer = 3;
    playerAgain = true;
    controller.reset();
    controller.start();
    _quizBrain.makeQuizBOT(levelGame.level);
    _startTimer();
  }

  void doNext() {
    _value = 1;
    _quizBrain.makeQuizBOT(levelGame.level);
    _startTimer();
  }

  void _startTimer() {
    const speed = Duration(milliseconds: 100);
    timer = Timer.periodic(speed, (timer) {
      // check xem da het thoi gian chua tren 1 cau hoi chua

      if (_value > (1 / (levelGame.time! * 10) * 4 / 3)) {
        setState(() {
          _value > 1 / (levelGame.time! * 10)
              ? _value -= 1 / (levelGame.time! * 10)
              : _value = 0;
        });
        // nguoi choi k dua ra cau tra loi thi bot dua ra
      } else {
        _checkAnswerBot();
        setState(() {
          timer.cancel();
        });
        doNext();
      }
    });
  }

  void _checkAnswerPlayer(int userChoice) async {
    if (userChoice == _quizBrain.quizAnswer) {
      playSound('correct-choice.wav');
      setState(() {
        _scoreHM++;
      });
      setState(() {
        timer.cancel();
      });
      doNext();
    } else {
      playSound('wrong-choice.wav');
      setState(() {
        _falsePlayer--;
        timer.cancel();
      });
      if (_falsePlayer == 0) {
        controller.pause();
        showFinishDialog("BOT Winning");
      } else {
        doNext();
      }
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
                controller.reset();
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
                _startAgainGame();
                playerAgain = false;
              },
              child: const Text('PLAY AGAIN', style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
  }

  void showEndGame() {
    timer.cancel();
    if (_scoreBot > _scoreHM) {
      showFinishDialog("BOT Wining");
    } else if (_scoreHM > _scoreBot) {
      showFinishDialog("PLayer Wining");
    } else {
      showFinishDialog("DRAW");
    }
  }

  @override
  void dispose() {
    timer.cancel();
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
                bgColor: colorSystemWhite,
                onBack: () {
                  controller.pause();
                  showOutDialog();
                }),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.35,
                  child: const Image(
                      image: NetworkImage(
                          "https://media3.giphy.com/media/bU2xOiv6LlSyB75szf/giphy.gif?cid=ecf05e47uylbzn7cuj96pgnqnjyt5tvkqvlfzwg6c2lm9okz&ep=v1_gifs_search&rid=giphy.gif&ct=g")),
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
                          onFinish: () {
                            if (playerAgain == false) {
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
                          quizBrain: _quizBrain,
                          onTap: (int value) {
                            setState(() {
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
