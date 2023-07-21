import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/make_quiz.dart';
import '../../../data/model/make_quiz.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';

class DragDropGameScreen extends StatefulWidget {
  const DragDropGameScreen({Key? key}) : super(key: key);

  @override
  State<DragDropGameScreen> createState() => _DragDropGameScreenState();
}

class _DragDropGameScreenState extends State<DragDropGameScreen> {
  late QuizBrain _quizBrain;
  int _score = 0;
  int _highScore = 0;
  late PreQuizGame _preQuiz;
  int _preIdNow = 0;
  int userChoose = 1;
  int falseChoose = 0;
  bool userAnswer = true;
  String _preIdServerNow = "";
  bool playerAgain = false;
  final CountDownController _controller = CountDownController();
  List<ItemValueConnect> listQuiz = [];
  List<ItemValueConnect> listAnswer = [];
  List<String> listSign = [];
  @override
  void initState() {
    super.initState();
    _quizBrain = QuizBrain();
    _preQuiz = PreQuizGame();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _preQuiz = ModalRoute.of(context)!.settings.arguments as PreQuizGame;
      _preIdNow = _preQuiz.id!;
      _preIdServerNow = _preQuiz.idServer!;
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
      _quizBrain.makeQuizDragDrop(_preQuiz);
    });

    listAnswer = _quizBrain.getListAnswerDD;
    listQuiz = _quizBrain.getListQuizDD;
    listQuiz.shuffle();
    listAnswer.shuffle();
    for (int i = 0; i < 5; i++) {
      listSign.add(_preQuiz.sign!);
    }
  }

  void checkEndGame() {
    if (listQuiz.isEmpty) {
      _controller.pause();
      showFinishDiaLog();
    }
  }

  void playAgain() {
    _score = 0;
    listAnswer.clear();
    listQuiz.clear();
    setState(() {
      _quizBrain.makeQuizDragDrop(_preQuiz);
    });
    playerAgain = true;
    _controller.reset();
    _controller.start();
    listAnswer = _quizBrain.getListAnswerDD;
    listQuiz = _quizBrain.getListQuizDD;
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
          title: const FittedBox(
            child: Text('DO YOU WANT TO QUIT ?',
                textAlign: TextAlign.center, style: kScoreLabelTextStyle),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routers.homeUser);
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
    var size = MediaQuery.of(context).size;
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
            height: size.height * 0.1,
            width: size.width,
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
                bottom: size.height * 0.02,
                top: size.height * 0.02,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      height: size.height * 0.6,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: listQuiz.map((e) {
                            return Draggable(
                                feedback: Container(
                                  width: size.width * 0.4,
                                  height: size.height * 0.1,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
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
                                  width: size.width * 0.4,
                                  height: size.height * 0.1,
                                ),
                                child: e.accepting == true
                                    ? SizedBox(
                                        width: size.width * 0.4,
                                        height: size.height * 0.1,
                                      )
                                    : Container(
                                        width: size.width * 0.4,
                                        height: size.height * 0.1,
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
                      width: size.width * 0.4,
                      height: size.height * 0.6,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: listAnswer.map((e) {
                            return DragTarget(
                              builder: (context, candidateData, rejectedData) {
                                return e.accepting == true
                                    ? SizedBox(
                                        width: size.width * 0.4,
                                        height: size.height * 0.1,
                                      )
                                    : Container(
                                        width: size.width * 0.4,
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
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      height: size.height * 0.05,
                    ),
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

class ItemValueConnect {
  String? quiz;
  int value;
  bool accepting;
  ItemValueConnect({required this.value, this.accepting = false, this.quiz});
}
