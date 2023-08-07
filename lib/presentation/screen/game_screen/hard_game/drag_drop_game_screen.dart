import 'dart:async';
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
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../data/model/user_global.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';

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
  final CountDownController _controller = CountDownController();
  List<ItemValueConnect> listQuiz = [];
  List<ItemValueConnect> listAnswer = [];
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    handleFirstTime();
  }

  Future<void> handleFirstTime() async {
    firstTimeValue = await instance
        .get<AuthenRepository>()
        .loadHandleFirstTimeShowUserManualDragDrop();
    if (firstTimeValue == true) {
      createTutorialMain();
      showTutorialMain();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        showReadyDialog();
      });
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
      colorShadow: colorErrorPrimary,
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
      colorShadow: colorErrorPrimary,
      paddingFocus: 10,
      opacityShadow: 0.5,
      onFinish: () {
        if (trustShow == false) {
          Navigator.pop(context);
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            showReadyDialog();
          });
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

  Future<void> showReadyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBui) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            25,
          )),
          backgroundColor: const Color(0xff1542bf),
          title:  FittedBox(
            child: Text('${'are you ready'.tr()} ?',
                textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _controller.start();
                initData();
              },
              child:  Text('go'.tr(), style: kDialogButtonsTS),
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
              child:  Text('exit'.tr(), style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
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
      showFinishDiaLog();
    }
  }

  void playAgain() {
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
          title:  FittedBox(
            child: Text('${'do you want to quiz'.tr()} ?',
                textAlign: TextAlign.center, style: kScoreLabelTextStyle),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routers.homeUser);
              },
              child:  Center(child: Text('yes'.tr(), style: kDialogButtonsTS)),
            ),
            TextButton(
              onPressed: () {
                _controller.resume();
                Navigator.pop(context);
              },
              child:  Center(child: Text('no'.tr(), style: kDialogButtonsTS)),
            ),
          ],
        );
      },
    );
  }

  Future<void> showFinishDiaLog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBuild) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            25,
          )),
          backgroundColor: const Color(0xff1542bf),
          title:  FittedBox(
            child:
                Text('game over'.tr(), textAlign: TextAlign.center, style: kTitleTS),
          ),
          content: Text('score'.tr()+" : "+ '$_score | 5',
              textAlign: TextAlign.center, style: kContentTS),
          actions: [
            TextButton(
              onPressed: () {
                if (instance.get<UserGlobal>().onLogin == true) {
                  Navigator.pushNamed(context, Routers.homeUser);
                } else {
                  Navigator.pushNamed(context, Routers.homeGuest);
                }
              },
              child:  Text('exit'.tr(), style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                playAgain();
                playerAgain = false;
              },
              child:  Text('play again'.tr(), style: kDialogButtonsTS),
            )
          ],
        );
      },
    );
  }

  Future<void> showErrorForm() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBui) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                25,
              )),
          backgroundColor: const Color(0xff1542bf),
          title:  FittedBox(
            child: Text("${"fill all the blank".tr()} ?",
                textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:  Text('go'.tr(), style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorSystemWhite,
        resizeToAvoidBottomInset: false,
        body: MainPageHomePG(
          colorTextAndIcon: Colors.black,
          onBack: () {
            _controller.pause();
            showOutDialog();
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
                          showFinishDiaLog();
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                borderRadius: BorderRadius.all(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                borderRadius: BorderRadius.all(
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
                                  onAccept: (data) {
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
        ));
  }
}

class ItemValueConnect {
  String? quiz;
  int value;
  bool accepting;
  ItemValueConnect({required this.value, this.accepting = false, this.quiz});
}
