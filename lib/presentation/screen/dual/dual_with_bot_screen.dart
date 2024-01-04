import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/model/app_global.dart';
import '../../../data/model/level_game_bot.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/dialog.dart';
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
  final _player = AudioPlayer();
  final _playerCheck = AudioPlayer();
  bool playAgain = false;
  CountDownController controller = CountDownController();
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      levelGame = ModalRoute.of(context)!.settings.arguments as LevelGameBot;
      showReadyGameDialog();
    });
  }

  Future<void> disposeAudio() async {
    timer.cancel();
    await _player.stop();
    _player.dispose();
    await _playerCheck.stop();
    _playerCheck.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    disposeAudio();
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
    playAgain = true;
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
      _playerCheck.play(AssetSource('correct-choice.wav'),
          volume: instance.get<AppGlobal>().volumeApp);
      DialogCommon().showInfoQuiz("${"player".tr()} + 1", context, colorMainTealPri);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      setState(() {
        _scoreHM++;
      });
      setState(() {
        timer.cancel();
      });
      doNext();
    } else {
      _playerCheck.play(
          AssetSource(
            'wrong-choice.wav',
          ),
          volume: instance.get<AppGlobal>().volumeApp);
      DialogCommon().showInfoQuiz("${"player".tr()} Wrong", context, colorErrorPrimary);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      setState(() {
        _falsePlayer--;
        timer.cancel();
      });
      if (_falsePlayer == 0) {
        controller.pause();
        showFinishGameDialog("BOT Winning");
      } else {
        doNext();
      }
    }
  }

  void _checkAnswerBot() async {
    _playerCheck.play(AssetSource('hw_sound.mp3'),
        volume: instance.get<AppGlobal>().volumeApp);
    DialogCommon().showInfoQuiz("${"bot".tr()} + 1", context, colorMainTealPri);
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pop(context);
    });
    setState(() {
      _scoreBot++;
    });
  }

  Future<void> showReadyGameDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      desc: '${'are you ready'.tr()} ?',
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelOnPress: () {
        Navigator.pushNamed(context, Routers.battleMainScreen);
      },
      btnOkOnPress: () {
        controller.start();
        _startGame();
        _player.play(AssetSource("sound_local/Teru.mp3"),
            volume: instance.get<AppGlobal>().volumeApp);
      },
    ).show();
  }

  Future<void> showFinishGameDialog(String player) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'game over'.tr(),
      desc: player,
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelOnPress: () {
        disposeAudio();
        Navigator.pushNamed(context, Routers.battleMainScreen);
      },
      btnOkText: "play again".tr(),
      btnOkOnPress: () {
        controller.pause();
        _startAgainGame();
        playAgain = false;
      },
    ).show();
  }

  Future<void> showOutPageDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      desc: '${'do you want to quit'.tr()} ?',
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelOnPress: () {
        controller.resume();
      },
      btnOkOnPress: () {
        disposeAudio();
        Navigator.pushNamed(context, Routers.optionBot);
      },
    ).show();
  }

  void showEndGame() {
    timer.cancel();
    if (_scoreBot > _scoreHM) {
      showFinishGameDialog("bot".tr() + "wining".tr());
    } else if (_scoreHM > _scoreBot) {
      showFinishGameDialog("player".tr() + "wining".tr());
    } else {
      showFinishGameDialog("draw".tr());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg_bot.jpg',
                ),
                fit: BoxFit.fill),
          ),
          child: MainPageHomePG(
            textNow: "",
            colorTextAndIcon: colorErrorPrimary,
            onBack: () {
              controller.pause();
              showOutPageDialog();
            },
            child: Center(
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 34.h,
                        child: Image.asset("assets/images/dual_bot.png"),
                      ),
                      SizedBox(
                        height: 22.h,
                        child: Column(
                          children: [
                            SizedBox(
                              child: RotatedBox(
                                  quarterTurns: -2,
                                  child: Info_Player_Line(
                                      falsePlayer: 0,
                                      score: _scoreBot,
                                      namePlayer: "Bot")),
                            ),
                            Row(children: <Widget>[
                              const DivideLine(),
                              Time_Runner(
                                onFinish: () {
                                  if (playAgain == false) {
                                    showEndGame();
                                  }
                                },
                                controller: controller,
                              ),
                              const DivideLine()
                            ]),
                            Info_Player_Line(
                              falsePlayer: _falsePlayer,
                              score: _scoreHM,
                              namePlayer: 'Player',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 34.h,
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
          ),
        ));
  }
}
