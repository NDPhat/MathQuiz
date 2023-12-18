import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/remote/authen/authen.dart';
import 'package:math/presentation/screen/game_screen/hard_game/widget/features_to_user.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../data/model/app_global.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/dialog.dart';

class DragDropGameScreen extends StatefulWidget {
  const DragDropGameScreen({Key? key}) : super(key: key);

  @override
  State<DragDropGameScreen> createState() => _DragDropGameScreenState();
}

class _DragDropGameScreenState extends State<DragDropGameScreen> {
  final dragKey = GlobalKey();
  final timeKey = GlobalKey();
  final userManualKey = GlobalKey();
  final dropKey = GlobalKey();
  late TutorialCoachMark tutorialCoachMark;
  late TutorialCoachMark tutorialCoachMarkUserManual;
  late QuizBrain _quizBrain;
  int _score = 0;
  int userChoose = 1;
  int falseChoose = 0;
  bool userAnswer = true;
  bool playerAgain = false;
  late bool firstTimeValue;
  bool trustShow = false;
  final _playerCheck = AudioPlayer();
  final CountDownController _controller = CountDownController();
  List<ItemValueConnect> listQuiz = [];
  List<ItemValueConnect> listAnswer = [];
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    handleFirstTime();
  }
  @override
  void dispose() {
    super.dispose();
    soundDispose();
  }

  Future<void> soundDispose() async {
    await _playerCheck.stop();
    _playerCheck.dispose();
  }


  Future<void> handleFirstTime() async {
    firstTimeValue = await instance
        .get<AuthenRepository>()
        .loadHandleFirstTimeShowUserManualDragDrop();
    if (firstTimeValue == true) {
      createTutorialMain();
      showTutorialMain();
    } else {
      showReadyGameDialog();
    }
  }

  void showTutorialMain() {
    Future.delayed(const Duration(seconds: 1), () {
      tutorialCoachMark.show(context: context);
    });
  }

  void showTutorialUserMan() {
    Future.delayed(const Duration(seconds: 1), () {
      tutorialCoachMarkUserManual.show(context: context);
    });
  }

  void createTutorialMain() {
    tutorialCoachMark = TutorialCoachMark(
      targets: listTargetFocusMainDrag(
        timeKey: timeKey,
        userManualKey: userManualKey,
      ),
      colorShadow: colorMainBlue,
      hideSkip: true,
      paddingFocus: 10,
      opacityShadow: 0.5,
      onFinish: () {
        instance
            .get<AuthenRepository>()
            .handleFirstTimeDragDropUserManual(false);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          showModalBottomSheetUserManual();
        });
      },
    );
  }

  void createTutorialUserMan() {
    tutorialCoachMarkUserManual = TutorialCoachMark(
      targets: listTargetFocusUserManDrag(
          dragKey: dragKey,
          dropKey: dropKey,
          textDrag: "pull and drag this".tr(),
          textDrop: "drop this here".tr()),
      colorShadow: colorMainBlue,
      hideSkip: true,
      paddingFocus: 10,
      opacityShadow: 0.5,
      onFinish: () {
        if (trustShow == false) {
          Navigator.pop(context);
          showReadyGameDialog();
        } else {
          Navigator.pop(context);
          _controller.resume();
        }
      },
    );
  }

  void showModalBottomSheetUserManual() {
    createTutorialUserMan();
    showTutorialUserMan();
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SizedBox(
            width: 100.w,
            height: 80.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  key: dragKey,
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorErrorPrimary),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: colorBGInput),
                  child: CircleAvatar(
                    radius: 5.w,
                    backgroundColor: colorMainBlue,
                  ),
                ),
                Container(
                  key: dropKey,
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorErrorPrimary),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: colorSystemWhite),
                  child: Center(
                    child: Text(
                      "1",
                      style: GoogleFonts.aclonica(
                          color: colorErrorPrimary, fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void initData() {
    setState(() {
      _quizBrain.makeQuizDragDrop();
    });
    List<int> listAnswerData = _quizBrain.getListAnswerDD;
    List<String> listQuizData = _quizBrain.getListQuizDD;
    for (int i = 0; i < listAnswerData.length; i++) {
      listAnswer.add(ItemValueConnect(value: listAnswerData[i]));
    }
    for (int i = 0; i < listQuizData.length; i++) {
      listQuiz.add(
          ItemValueConnect(quiz: listQuizData[i], value: listAnswerData[i]));
    }
    listQuiz.shuffle();
    listAnswer.shuffle();
  }

  void checkEndGame() {
    if (listQuiz.isEmpty) {
      _controller.pause();
      showFinishGameDialog();
    }
  }

  void playAgain() {
    listAnswer.clear();
    listQuiz.clear();
    _score = 0;
    setState(() {
      _quizBrain.makeQuizDragDrop();
    });
    playerAgain = true;
    _controller.reset();
    _controller.start();
    List<int> listAnswerData = _quizBrain.getListAnswerDD;
    List<String> listQuizData = _quizBrain.getListQuizDD;
    for (int i = 0; i < listAnswerData.length; i++) {
      listAnswer.add(ItemValueConnect(value: listAnswerData[i]));
    }
    for (int i = 0; i < listQuizData.length; i++) {
      listQuiz.add(
          ItemValueConnect(quiz: listQuizData[i], value: listAnswerData[i]));
    }
    listQuiz.shuffle();
    listAnswer.shuffle();
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
        _controller.resume();
      },
      btnOkOnPress: () {
        Navigator.pushNamed(context, Routers.takeHardQuiz);
      },
    ).show();
  }

  Future<void> showReadyGameDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      desc: '${'are you ready'.tr()} ?',
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelOnPress: () {
        Navigator.pushNamed(context, Routers.takeHardQuiz);
      },
      btnOkOnPress: () {
        _controller.start();
        initData();
      },
    ).show();
  }

  Future<void> showFinishGameDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      dismissOnTouchOutside: false,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'game over'.tr(),
      desc: 'score'.tr() + " : " + '$_score | 5',
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelOnPress: () {
        Navigator.pushNamed(context, Routers.takeHardQuiz);
      },
      btnOkText: "play again".tr(),
      btnOkOnPress: () {
        playAgain();
        playerAgain = false;
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorSystemWhite,
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg/bg2.jpg',
                ),
                fit: BoxFit.fill),
          ),
          child: MainPageHomePG(
            colorTextAndIcon: Colors.black,
            onBack: () {
              _controller.pause();
              showOutPageDialog();
            },
            child: Column(
              children: [
                Container(
                  key: timeKey,
                  height: 10.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  child: CircleAvatar(
                      radius: 35,
                      backgroundColor: colorMainBlue,
                      child: CircularCountDownTimer(
                        duration: 60,
                        initialDuration: 0,
                        controller: _controller,
                        width: 40,
                        height: 40,
                        ringColor: colorSystemWhite,
                        fillColor: colorSystemWhite,
                        backgroundColor: colorMainBlue,
                        backgroundGradient: null,
                        strokeWidth: 20.0,
                        strokeCap: StrokeCap.round,
                        textStyle: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.S,
                        autoStart: false,
                        onStart: () {},
                        onComplete: () {
                          if (playerAgain == false) {
                            showFinishGameDialog();
                          }
                        },
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(
                      bottom: 2.h, top: 2.h, left: 5.w, right: 5.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 40.w,
                            height: 60.h,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: listQuiz.map((e) {
                                  return Draggable(
                                      feedback: Container(
                                        width: 40.w,
                                        height: 10.h,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorBGInput),
                                        child: Center(
                                          child: Text(
                                            e.quiz.toString(),
                                            style: s16f700ColorGreyTe,
                                          ),
                                        ),
                                      ),
                                      data: e.value,
                                      childWhenDragging: SizedBox(
                                        width: 40.w,
                                        height: 10.h,
                                      ),
                                      child: e.accepting == true
                                          ? SizedBox(
                                              width: 40.w,
                                              height: 10.h,
                                            )
                                          : Container(
                                              width: 40.w,
                                              height: 10.h,
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: colorBGInput),
                                              child: Center(
                                                child: Text(
                                                  e.quiz.toString(),
                                                  style: s16f700ColorGreyTe,
                                                ),
                                              ),
                                            ));
                                }).toList()),
                          ),
                          SizedBox(
                            width: 40.w,
                            height: 60.h,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: listAnswer.map((e) {
                                  return DragTarget(
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return e.accepting == true
                                          ? SizedBox(
                                              width: 40.w,
                                              height: 10.h,
                                            )
                                          : Container(
                                              width: 40.w,
                                              height: 10.h,
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: colorBGInput),
                                              child: Center(
                                                child: Text(
                                                  e.value.toString(),
                                                  style: s16f700ColorGreyTe,
                                                ),
                                              ),
                                            );
                                    },
                                    onWillAccept: (data) {
                                      return data == e.value;
                                    },
                                    onLeave: (data) {
                                      if (e.accepting == false) {
                                        _playerCheck.play(
                                            AssetSource(
                                              'wrong-choice.wav',
                                            ),
                                            volume:
                                            instance.get<AppGlobal>().volumeApp);
                                        DialogCommon().showInfoQuiz("false".tr(), context, colorErrorPrimary);
                                        Future.delayed(const Duration(milliseconds: 500), () {
                                          Navigator.pop(context);
                                        });
                                      }
                                    },
                                    onAccept: (data) {
                                      _playerCheck.play(
                                          AssetSource(
                                            'correct-choice.wav',
                                          ),
                                          volume:
                                          instance.get<AppGlobal>().volumeApp);
                                      DialogCommon().showInfoQuiz("true".tr(), context, colorMainTealPri);
                                      Future.delayed(const Duration(milliseconds: 500), () {
                                        Navigator.pop(context);
                                        _score++;
                                        setState(() {
                                          e.accepting = true;
                                          int index = listQuiz.indexWhere(
                                                  (element) => element.value == data);
                                          listQuiz[index].accepting = true;
                                          listQuiz.removeAt(index);
                                          listAnswer.remove(e);
                                        });
                                        checkEndGame();
                                      });

                                    },
                                  );
                                }).toList()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 50.w,
                            height: 5.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              trustShow = true;
                              _controller.pause();
                              showModalBottomSheetUserManual();
                            },
                            child: CircleAvatar(
                              key: userManualKey,
                              radius: 20,
                              child: const Center(
                                child: Icon(Icons.question_mark),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ItemValueConnect {
  String? quiz;
  int value;
  bool accepting;
  ItemValueConnect({required this.value, this.accepting = false, this.quiz});
}
