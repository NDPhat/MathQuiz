import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../application/utils/sound.dart';
import '../../../data/model/app_global.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/dialog.dart';
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
  final _player = AudioPlayer();
  final _playerCheck = AudioPlayer();
  CountDownController controller = CountDownController();
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showReadyGameDialog();
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposeAudio();
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
      playSoundLocal(_playerCheck, 'correct-choice.wav',
          instance.get<AppGlobal>().volumeApp);
      DialogCommon().showInfoQuiz("${"player".tr()}1 + 1", context, colorMainTealPri);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      setState(() {
        _score1++;
      });
      _quizBrain.makeQuizTest();
    } else {
      playSoundLocal(_playerCheck, 'wrong-choice.wav',
          instance.get<AppGlobal>().volumeApp);
      DialogCommon().showInfoQuiz("${"player".tr()}1 Wrong", context, colorErrorPrimary);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      setState(() {
        _falsePlayer1--;
        if (_falsePlayer1 == 0) {
          controller.pause();
          showFinishGameDialog("Player2 ${'winning'.tr()}");
        } else {
          _quizBrain.makeQuizTest();
        }
      });
    }
  }

  void _checkAnswerPlayer2(int userChoice) async {
    if (userChoice == _quizBrain.quizAnswer) {
      playSoundLocal(_playerCheck, 'correct-choice.wav',
          instance.get<AppGlobal>().volumeApp);
      DialogCommon().showInfoQuiz("${"player".tr()}2 + 1", context, colorMainTealPri);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      setState(() {
        _score2++;
      });
      _quizBrain.makeQuizTest();
    } else {
      playSoundLocal(_playerCheck, 'wrong-choice.wav',
          instance.get<AppGlobal>().volumeApp);
      DialogCommon().showInfoQuiz("${"player".tr()}2 Wrong", context, colorErrorPrimary);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
      setState(() {
        _falsePlayer2--;
        if (_falsePlayer2 == 0) {
          controller.pause();
          showFinishGameDialog("Player1 ${'winning'.tr()}");
        } else {
          _quizBrain.makeQuizTest();
        }
      });
    }
  }

  Future<void> disposeAudio() async {
    await _player.stop();
    _player.dispose();
    await _playerCheck.stop();
    _playerCheck.dispose();
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
        _player.play(AssetSource("sound_local/Rouge.mp3"),
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
        startAgain = false;
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
        Navigator.pushNamed(context, Routers.battleMainScreen);
      },
    ).show();
  }

  void showEndGame() {
    if (_score2 > _score1) {
      showFinishGameDialog("Player2 ${"winning".tr()}");
    } else if (_score2 < _score1) {
      showFinishGameDialog("PLayer1 ${"winning".tr()}");
    } else {
      showFinishGameDialog("draw".tr());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
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
                      height: 22.h,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100.w,
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
                      height: 34.h,
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
      ),
    );
  }
}
