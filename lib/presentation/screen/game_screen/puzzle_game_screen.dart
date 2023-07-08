import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:drift/drift.dart' as driff;
import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/model/item_value_puzzle.dart';
import '../../../data/model/make_quiz.dart';
import '../../widget/app_bar.dart';

class PuzzleGameScreen extends StatefulWidget {
  const PuzzleGameScreen({Key? key}) : super(key: key);

  @override
  State<PuzzleGameScreen> createState() => _PuzzleGameScreenState();
}

class _PuzzleGameScreenState extends State<PuzzleGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  late PreQuizGame _preQuiz;
  int _preIdNow = 0;
  int userChoose = 1;
  int falseChoose = 0;
  bool userAnswer = true;
  String _preIdServerNow = "";
  final CountDownController _controller = CountDownController();
  List<ItemValuePuzzle> listTarget1 = [];
  List<ItemValuePuzzle> listNumber = [];
  List<ItemValuePuzzle> listTarget = [];
  List<ItemValuePuzzle> listTarget2 = [];
  List<int> listAnswer = [];
  List<String> listSign = [];
  List<String> listEqual = ["=", "=", "=", "=", "="];
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreQuizGame();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz = ModalRoute.of(context)!.settings.arguments as PreQuizGame;
      _preIdNow = _preQuiz.id!;
      _preIdServerNow = _preQuiz.idServer!;
      initData();
    });
  }

  void initData() {
    setState(() {
      _quizBrain.makeQuizPuzzle(_preQuiz);
    });
    List<int> value1 = _quizBrain.getListNumPuzzle1;
    List<int> value2 = _quizBrain.getListNumPuzzle2;
    List<int> target1 = _quizBrain.getColumnTarget1;
    List<int> target2 = _quizBrain.getColumnTarget2;
    listAnswer = _quizBrain.getListAnswerPuzzle;
    for (int i = 0; i < value1.length; i++) {
      listNumber.add(ItemValuePuzzle(value: value1[i]));
    }
    for (int i = 0; i < value2.length; i++) {
      listNumber.add(ItemValuePuzzle(value: value2[i]));
    }
    listNumber.shuffle();
    for (int i = 0; i < target1.length; i++) {
      listTarget1.add(ItemValuePuzzle(value: value1[i]));
      listTarget.add(ItemValuePuzzle(value: value1[i]));
    }
    for (int i = 0; i < target2.length; i++) {
      listTarget2.add(ItemValuePuzzle(value: value2[i]));
      listTarget.add(ItemValuePuzzle(value: value2[i]));
    }
    for (int i = 0; i < 5; i++) {
      listSign.add(_preQuiz.sign!);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBarWidget(
            bgColor: colorSystemWhite,
            size: size,
            onBack: () {},
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: size.height * 0.02,
                top: size.height * 0.02,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //target 1
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listTarget1.map((e) {
                          return e.accepting == "1"
                              ? GestureDetector(
                                  child: Container(
                                    width: size.width * 0.16,
                                    height: size.height * 0.1,
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
                                          e.value = listNumber[indexNum].value;
                                          // enable het target 2
                                          listTarget2.forEach((element) {
                                            element.accepting = "0";
                                          });
                                          e.accepting = "1";
                                          // remove number vua chon
                                          listNumber[indexNum].accepting = "2";
                                        });
                                      },
                                      child: Container(
                                        width: size.width * 0.16,
                                        height: size.height * 0.1,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorBGInput),
                                      ),
                                    )
                                  //2 co nghia la da dc chon
                                  : GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: size.width * 0.16,
                                        height: size.height * 0.1,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorBGInput),
                                      ),
                                    ));
                        }).toList(),
                      ),
                      //sign
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listSign.map((e) {
                          return SizedBox(
                            width: size.width * 0.16,
                            height: size.height * 0.1,
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
                            child: Container(
                              width: size.width * 0.16,
                              height: size.height * 0.1,
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
                                e.value = listNumber[indexNum].value;
                                // enable het target 2
                                listTarget1.forEach((element) {
                                  element.accepting = "0";
                                });
                                e.accepting = "1";
                                // remove number vua chon
                                listNumber[indexNum].accepting = "2";
                              });
                            },
                            child: Container(
                              width: size.width * 0.16,
                              height: size.height * 0.1,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                  color: colorBGInput),
                            ),
                          )
                          //2 co nghia la da dc chon
                              : GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: size.width * 0.16,
                              height: size.height * 0.1,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                  color: colorBGInput),
                            ),
                          ));
                        }).toList(),
                      ),
                      //equal
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: listEqual.map((e) {
                          return SizedBox(
                            width: size.width * 0.16,
                            height: size.height * 0.1,
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
                            width: size.width * 0.16,
                            height: size.height * 0.1,
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
                  height: size.height * 0.04,
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.22,
                  child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      children: listNumber.map((e) {
                        return GestureDetector(
                            onTap: () {
                              if (e.accepting != "2") {
                                int past = listNumber.indexWhere(
                                    (element) => element.accepting == "1");
                                setState(() {
                                  if (past >= 0) {
                                    listNumber[past].accepting = "0";
                                  }
                                  if (past != listNumber.indexOf(e)) {
                                    if (e.accepting == "0") {
                                      e.accepting = "1";
                                    } else if (e.accepting == "1") {
                                      e.accepting = "0";
                                    }
                                  }
                                });
                              }
                            },
                            child: e.accepting == "0"
                                ? Container(
                                    width: size.width * 0.06,
                                    height: size.height * 0.1,
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
                                  )
                                : (e.accepting == "1"
                                    ? Container(
                                        width: size.width * 0.08,
                                        height: size.height * 0.1,
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
                                      )
                                    : Container(
                                        width: size.width * 0.08,
                                        height: size.height * 0.1,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorBGInput),
                                      )));
                      }).toList()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumberDragable extends StatelessWidget {
  const NumberDragable({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Container(
        color: colorSystemWhite,
        width: size.width * 0.16,
        height: size.height * 0.1,
      ),
      childWhenDragging: Container(
        width: size.width * 0.16,
        height: size.height * 0.1,
        color: colorBGInput,
      ),
      child: Container(
        width: size.width * 0.16,
        height: size.height * 0.1,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: colorGreyTetiary),
        child: const Center(
          child: Text(
            "1",
            style: s14f500colorSysWhite,
          ),
        ),
      ),
    );
  }
}
