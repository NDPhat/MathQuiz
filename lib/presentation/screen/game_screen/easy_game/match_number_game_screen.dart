import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/screen/game_screen/easy_game/write_and_count_game_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../data/model/user_global.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/board_item_take_easy_game.dart';

class MatchNumberGameScreen extends StatefulWidget {
  const MatchNumberGameScreen({Key? key}) : super(key: key);

  @override
  State<MatchNumberGameScreen> createState() => _MatchNumberGameScreenState();
}

class _MatchNumberGameScreenState extends State<MatchNumberGameScreen> {
  late QuizBrain quizBrain;
  List<List<ItemValueMatch>> randomListDrag = [];
  List<List<ItemValueMatch>> randomListDrop = [];
  List<List<int>> listIntValue = [];
  List<Color> colorList = [
    colorErrorPrimary,
    colorSystemYeloow,
    colorMainTealPri,
    Colors.pink,
    colorGreyTetiary,
    Colors.green
  ];
  int position = 0;
  int count = 0;
  int length = 0;
  final random = Random();
  void _initDataAndModel() async {
    quizBrain.makeListMatchNum();
    listIntValue = quizBrain.listMatchNumber;
    initItem();
  }

  void initDragAgain() {
    randomListDrag.clear();
    listIntValue[position].forEach((element) {
      List<ItemValueMatch> listDrag = [];
      for (int i = 0; i < element; i++) {
        listDrag.add(ItemValueMatch(
            value: element,
            accepting: false,
            color: colorList[random.nextInt(colorList.length)]));
      }
      listDrag.shuffle();
      randomListDrag.add(listDrag);
    });
  }

  void initItem() {
    listIntValue[position].forEach((element) {
      List<ItemValueMatch> listDrag = [];
      for (int i = 0; i < element; i++) {
        listDrag.add(ItemValueMatch(
            value: element,
            accepting: false,
            color: colorList[random.nextInt(colorList.length)]));
      }
      listDrag.shuffle();
      randomListDrag.add(listDrag);
    });
    listIntValue.forEach((element) {
      List<ItemValueMatch> listDrop = [];
      for (int i = 0; i < element.length; i++) {
        listDrop.add(ItemValueMatch(
            value: element[i],
            accepting: false,
            color: colorList[random.nextInt(colorList.length)]));
      }
      listDrop.shuffle();
      randomListDrop.add(listDrop);
    });
  }

  @override
  void initState() {
    super.initState();
    quizBrain = QuizBrain();
    _initDataAndModel();
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
            onBack: () {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 80.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: randomListDrag.map((e) {
                        return Draggable(
                            feedback: BoardItemTakeEasy(
                              width: 40.w,
                              height: 26.h,
                              bgColor: colorMainBlueChart,
                              child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1.0,
                                  padding: const EdgeInsets.all(4.0),
                                  mainAxisSpacing: 4.0,
                                  crossAxisSpacing: 4.0,
                                  children: e.map((ItemValueMatch item) {
                                    return CircleItem(
                                      colorBG: item.color,
                                      width: 15.w,
                                      height: 8.h,
                                    );
                                  }).toList()),
                            ),
                            data: e.first.value,
                            childWhenDragging: SizedBox(
                              width: 40.w,
                              height: 26.h,
                            ),
                            child: e.first.accepting == true
                                ? SizedBox(
                                    width: 40.w,
                                    height: 26.h,
                                  )
                                : BoardItemTakeEasy(
                                    width: 40.w,
                                    height: 26.h,
                                    bgColor: colorMainBlueChart,
                                    child: GridView.count(
                                        crossAxisCount: 3,
                                        childAspectRatio: 1.0,
                                        padding: const EdgeInsets.all(4.0),
                                        mainAxisSpacing: 4.0,
                                        crossAxisSpacing: 4.0,
                                        children: e.map((ItemValueMatch item) {
                                          return CircleItem(
                                            colorBG: item.color,
                                            width: 40.w,
                                            height: 8.h,
                                          );
                                        }).toList()),
                                  ));
                      }).toList()),
                ),
                SizedBox(
                  width: 40.w,
                  height: 80.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: randomListDrop[position].map((e) {
                        return DragTarget(
                          builder: (context, candidateData, rejectedData) {
                            return e.accepting == true
                                ? SizedBox(
                                    width: 40.w,
                                    height: 26.h,
                                  )
                                : Container(
                                    width: 40.w,
                                    height: 26.h,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: colorBGInput),
                                    child: Center(
                                      child: Text(
                                        e.value.toString(),
                                        style: GoogleFonts.cabin(
                                            color: colorErrorPrimary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 100),
                                      ),
                                    ),
                                  );
                          },
                          onWillAccept: (data) {
                            return data == e.value;
                          },
                          onAccept: (data) {
                            count++;
                            setState(() {
                              e.accepting = true;
                              int index = randomListDrag.indexWhere(
                                  (element) => element.first.value == data);
                              randomListDrag[index].first.accepting = true;
                            });
                            if (count == 3) {
                              if (length < 9) {
                                length++;
                                setState(() {
                                  position++;
                                  count = 0;
                                  initDragAgain();
                                });
                              } else {
                                showFinishDiaLog();
                              }
                            }
                          },
                        );
                      }).toList()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemValueMatch {
  int value;
  Color color;
  bool accepting;
  ItemValueMatch(
      {required this.value, required this.color, this.accepting = false});
}
