import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:drift/drift.dart' as driff;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../data/model/item_value_puzzle.dart';
import '../../../../data/model/make_quiz.dart';
import '../../../../data/model/user_global.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/app_bar.dart';

class PuzzleGameScreen extends StatefulWidget {
  const PuzzleGameScreen({Key? key}) : super(key: key);

  @override
  State<PuzzleGameScreen> createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int userChoose = 1;
  int falseChoose = 0;
  bool userAnswer = true;
  bool playerAgain = false;
  final CountDownController _controller = CountDownController();
  List<ItemValuePuzzle> listTarget1 = [];
  List<ItemValuePuzzle> listNumber = [];
  List<ItemValuePuzzle> listTarget2 = [];
  List<int> listAnswer = [];
  List<String> listSign = [];
  List<String> listEqual = ["=", "=", "=", "=", "="];
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showReadyDialog();
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
          title: const FittedBox(
            child: Text('ARE YOU GUYS READY ?',
                textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _controller.start();
                initData();
              },
              child: const Text('GO', style: kDialogButtonsTS),
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
              child: const Text('BACK', style: kDialogButtonsTS),
            ),
          ],
        );
      },
    );
  }

  void initData() {
    setState(() {
      _quizBrain.makeQuizPuzzle();
    });
    List<int> value1 = _quizBrain.getListNumPuzzle1;
    List<int> value2 = _quizBrain.getListNumPuzzle2;
    listAnswer = _quizBrain.getListAnswerPuzzle;
    for (int i = 0; i < value1.length; i++) {
      listNumber.add(ItemValuePuzzle(value: value1[i]));
    }
    for (int i = 0; i < value2.length; i++) {
      listNumber.add(ItemValuePuzzle(value: value2[i]));
    }
    listNumber.shuffle();
    for (int i = 0; i < 5; i++) {
      listTarget1.add(ItemValuePuzzle(accepting: "0"));
    }
    for (int i = 0; i < 5; i++) {
      listTarget2.add(ItemValuePuzzle(accepting: "0"));
    }
    listSign = _quizBrain.getListSignHardGame;
  }

  void playAgain() {
    setState(() {
      _quizBrain.makeQuizPuzzle();
      listTarget1.clear();
      listTarget2.clear();
      listNumber.clear();
      listSign.clear();
      listAnswer.clear();
      playerAgain = true;
      _controller.reset();
      _controller.start();
      List<int> value1 = _quizBrain.getListNumPuzzle1;
      List<int> value2 = _quizBrain.getListNumPuzzle2;
      listAnswer = _quizBrain.getListAnswerPuzzle;
      listSign = _quizBrain.getListSignHardGame;
      for (int i = 0; i < value1.length; i++) {
        listNumber.add(ItemValuePuzzle(value: value1[i]));
      }
      for (int i = 0; i < value2.length; i++) {
        listNumber.add(ItemValuePuzzle(value: value2[i]));
      }
      listNumber.shuffle();
      for (int i = 0; i < 5; i++) {
        listTarget1.add(ItemValuePuzzle(accepting: "0"));
      }
      for (int i = 0; i < 5; i++) {
        listTarget2.add(ItemValuePuzzle(accepting: "0"));
      }
    });
  }

  int calAnswer(int a, int b, String sign) {
    switch (sign) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case 'x':
        return a * b;
      case '/':
        {
          return (a ~/ b);
        }
    }
    return a + b;
  }

  bool checkEmpty(List<ItemValuePuzzle> list) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].value == null) {
        return false;
      }
    }
    return true;
  }

  bool checkAnswer() {
    if (checkEmpty(listTarget1) && checkEmpty(listTarget2)) {
      for (int i = 0; i < listAnswer.length; i++) {
        if (listAnswer[i] ==
            calAnswer(
                listTarget1[i].value!, listTarget2[i].value!, listSign[i])) {
          _score++;
        }
      }
      return true;
    } else {
      return false;
    }
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
                if (instance.get<UserGlobal>().onLogin == true) {
                  Navigator.pushNamed(context, Routers.homeUser);
                } else {
                  Navigator.pushNamed(context, Routers.homeGuest);
                }
              },
              child: const Center(child: Text('YES', style: kDialogButtonsTS)),
            ),
            TextButton(
              onPressed: () {
                _controller.resume();
                Navigator.pop(context);
              },
              child: const Center(child: Text('NO', style: kDialogButtonsTS)),
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
          title: const FittedBox(
            child:
                Text('GAME OVER', textAlign: TextAlign.center, style: kTitleTS),
          ),
          content: Text('Score: $_score | 5',
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
              child: const Text('EXIT', style: kDialogButtonsTS),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                playAgain();
                playerAgain = false;
              },
              child: const Text('PLAY AGAIN', style: kDialogButtonsTS),
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
          title: const FittedBox(
            child: Text('FILL ALL THE BLANK ?',
                textAlign: TextAlign.center, style: kTitleTS),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _controller.resume();
                Navigator.pop(context);
              },
              child: const Text('GO', style: kDialogButtonsTS),
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
      body: Column(
        children: [
          AppBarWidget(
            bgColor: colorSystemWhite,
            onBack: () {
              _controller.pause();
              showOutDialog();
            },
          ),
          Container(
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
            padding:
                EdgeInsets.only(bottom: 2.h, top: 2.h, left: 5.w, right: 5.w),
            child: Column(
              children: [
                SizedBox(
                  width: 100.w,
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //target 1
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listTarget1.map((e) {
                          return e.accepting == "1"
                              ? GestureDetector(
                                  onTap: () {
                                    int past2 = listTarget2.indexWhere(
                                        (element) => element.accepting == "2");
                                    int past1 = listTarget1.indexWhere(
                                        (element) => element.accepting == "2");
                                    setState(() {
                                      if (past2 >= 0) {
                                        listTarget2[past2].accepting = "1";
                                      }
                                      if (past1 >= 0) {
                                        listTarget1[past1].accepting = "1";
                                      }
                                      e.accepting = "2";
                                    });
                                  },
                                  child: Container(
                                    width: 16.w,
                                    height: 8.h,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: colorGreyTetiary),
                                    child: Center(
                                      child: Text(
                                        e.value.toString(),
                                        style: s14f500colorSysWhite,
                                      ),
                                    ),
                                  ),
                                )
                              : (e.accepting == "0"
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          int indexNum = listNumber.indexWhere(
                                              (element) =>
                                                  element.accepting == "1");
                                          if (indexNum >= 0) {
                                            e.value =
                                                listNumber[indexNum].value;
                                            e.accepting = "1";
                                            // remove number vua chon
                                            listNumber[indexNum].accepting =
                                                "2";
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 16.w,
                                        height: 8.h,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorBGInput),
                                      ),
                                    )
                                  //2 co nghia la da dc chon
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          int indexNum = listNumber.indexWhere(
                                              (element) =>
                                                  element.accepting == "3");
                                          setState(() {
                                            if (indexNum >= 0) {
                                              listNumber[indexNum].value =
                                                  e.value;
                                              listNumber[indexNum].accepting =
                                                  "0";
                                              e.accepting = "0";
                                            } else {
                                              e.accepting = "1";
                                            }
                                          });
                                        });
                                      },
                                      child: Container(
                                        width: 16.w,
                                        height: 8.h,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorMainBlue),
                                        child: Center(
                                          child: Text(
                                            e.value.toString(),
                                            style: s14f500colorSysWhite,
                                          ),
                                        ),
                                      ),
                                    ));
                        }).toList(),
                      ),
                      //sign
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listSign.map((e) {
                          return SizedBox(
                            width: 16.w,
                            height: 8.h,
                            child: Center(
                              child: Text(
                                e,
                                style: s30f700colorAccBlue,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      //target 2
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listTarget2.map((e) {
                          return e.accepting == "1"
                              ? GestureDetector(
                                  onTap: () {
                                    // onTap cac phan tu da duoc chon
                                    // chi onTap duoc 1 phan tu
                                    int past = listTarget2.indexWhere(
                                        (element) => element.accepting == "2");
                                    //tat onTap ben 1
                                    int past1 = listTarget1.indexWhere(
                                        (element) => element.accepting == "2");

                                    setState(() {
                                      if (past1 >= 0) {
                                        listTarget1[past1].accepting = "1";
                                      }
                                      if (past >= 0) {
                                        listTarget2[past].accepting = "1";
                                      }
                                      if (past != listTarget2.indexOf(e)) {
                                        e.accepting = "2";
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 16.w,
                                    height: 8.h,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: colorGreyTetiary),
                                    child: Center(
                                      child: Text(
                                        e.value.toString(),
                                        style: s14f500colorSysWhite,
                                      ),
                                    ),
                                  ),
                                )
                              : (e.accepting == "0"
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          int indexNum = listNumber.indexWhere(
                                              (element) =>
                                                  element.accepting == "1");
                                          if (indexNum >= 0) {
                                            e.value =
                                                listNumber[indexNum].value;
                                            e.accepting = "1";
                                            // remove number vua chon
                                            listNumber[indexNum].accepting =
                                                "2";
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 16.w,
                                        height: 8.h,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorBGInput),
                                      ),
                                    )
                                  //2 co nghia la da dc chon
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          e.accepting = "1";
                                        });
                                      },
                                      child: Container(
                                        width: 16.w,
                                        height: 8.h,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorMainBlue),
                                        child: Center(
                                          child: Text(
                                            e.value.toString(),
                                            style: s14f500colorSysWhite,
                                          ),
                                        ),
                                      ),
                                    ));
                        }).toList(),
                      ),
                      //equal
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listEqual.map((e) {
                          return SizedBox(
                            width: 16.w,
                            height: 8.h,
                            child: Center(
                              child: Text(
                                e,
                                style: s30f700colorAccBlue,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      //answer
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listAnswer.map((e) {
                          return SizedBox(
                            width: 16.w,
                            height: 8.h,
                            child: Center(
                              child: Text(
                                e.toString(),
                                style: s20f700ColorErrorPro,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 100.w,
                  height: 16.h,
                  child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: listNumber.map((e) {
                        return e.accepting == "0"
                            ? GestureDetector(
                                onTap: () {
                                  int past = listNumber.indexWhere(
                                      (element) => element.accepting == "1");
                                  int past3 = listNumber.indexWhere(
                                      (element) => element.accepting == "3");
                                  setState(() {
                                    if (past >= 0) {
                                      listNumber[past].accepting = "0";
                                    }
                                    if (past3 >= 0) {
                                      listNumber[past3].accepting = "2";
                                    }
                                    e.accepting = "1";
                                  });
                                },
                                child: Container(
                                  width: 5.w,
                                  height: 8.h,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: colorBGInput),
                                  child: Center(
                                    child: Text(
                                      e.value.toString(),
                                      style: s16f700ColorGreyTe,
                                    ),
                                  ),
                                ),
                              )
                            // 1 la da dang duoc chon
                            : (e.accepting == "1"
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        e.accepting = "0";
                                      });
                                    },
                                    child: Container(
                                      width: 8.w,
                                      height: 8.h,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: colorErrorPrimary),
                                      child: Center(
                                        child: Text(
                                          e.value.toString(),
                                          style: s16f700ColorSysWhite,
                                        ),
                                      ),
                                    ),
                                  )
                                // 2 co nghia la da duoc chon va mat di
                                : (e.accepting == "2"
                                    ? GestureDetector(
                                        onTap: () {
                                          // tat cac onTap cua da chon va mat di
                                          int past = listNumber.indexWhere(
                                              (element) =>
                                                  element.accepting == "3");
                                          int past1 = listNumber.indexWhere(
                                              (element) =>
                                                  element.accepting == "1");
                                          setState(() {
                                            if (past >= 0) {
                                              listNumber[past].accepting = "2";
                                            }
                                            if (past1 >= 0) {
                                              listNumber[past1].accepting = "0";
                                            }
                                            e.accepting = "3";
                                          });
                                        },
                                        child: Container(
                                          width: 8.w,
                                          height: 8.h,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color: colorBGInput),
                                        ),
                                      )
                                    //3 la trang thai 2 va dang duoc chon
                                    : GestureDetector(
                                        onTap: () {
                                          int indexTarget1 = listTarget1
                                              .indexWhere((element) =>
                                                  element.accepting == "2");
                                          int indexTarget2 = listTarget2
                                              .indexWhere((element) =>
                                                  element.accepting == "2");
                                          setState(() {
                                            if (indexTarget1 >= 0) {
                                              e.value =
                                                  listTarget1[indexTarget1]
                                                      .value;
                                              e.accepting = "0";
                                              listTarget1[indexTarget1]
                                                  .accepting = "0";
                                            } else if (indexTarget2 >= 0) {
                                              e.value =
                                                  listTarget2[indexTarget2]
                                                      .value;
                                              e.accepting = "0";
                                              listTarget2[indexTarget2]
                                                  .accepting = "0";
                                            } else {
                                              e.accepting = "2";
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 8.w,
                                          height: 8.h,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color: colorErrorPrimary),
                                        ),
                                      )));
                      }).toList()),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundedButton(
                        press: () {
                          _controller.pause();
                          if (checkAnswer() == true) {
                            showFinishDiaLog();
                          } else {
                            showErrorForm();
                          }
                        },
                        color: colorMainBlue,
                        width: 50.w,
                        height: 5.h,
                        child: const Center(
                            child: Text(
                          "CHECK",
                          style: s16f700ColorSysWhite,
                        ))),
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 20,
                        child: Center(
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
    );
  }
}
