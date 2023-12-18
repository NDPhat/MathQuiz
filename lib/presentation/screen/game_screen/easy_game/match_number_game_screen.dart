import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/game_screen/easy_game/write_and_count_game_screen.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/make_quiz.dart';
import '../../../../application/utils/sound.dart';
import '../../../../data/model/app_global.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/board_item_take_easy_game.dart';
import '../../../widget/dialog.dart';
import '../hard_game/widget/features_to_user.dart';

class MatchNumberGameScreen extends StatefulWidget {
  const MatchNumberGameScreen({Key? key}) : super(key: key);

  @override
  State<MatchNumberGameScreen> createState() => _MatchNumberGameScreenState();
}

class _MatchNumberGameScreenState extends State<MatchNumberGameScreen> {
  final dragKey = GlobalKey();
  final userManualKey = GlobalKey();
  final dropKey = GlobalKey();
  late TutorialCoachMark tutorialCoachMarkUserManual;
  late QuizBrain quizBrain;
  final _player = AudioPlayer();
  final _playerCheck = AudioPlayer();

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

  @override
  void dispose() {
    super.dispose();
    soundDispose();
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

  void createTutorialUserMan() {
    tutorialCoachMarkUserManual = TutorialCoachMark(
      targets: listTargetFocusUserManDrag(
          dragKey: dragKey,
          dropKey: dropKey,
          textDrag: "pull and drag this".tr(),
          textDrop: "drop this here".tr()),
      colorShadow: colorErrorPrimary,
      hideSkip: true,
      paddingFocus: 10,
      opacityShadow: 0.5,
      onFinish: () {
        Navigator.pop(context);
      },
    );
  }

  void showTutorialUserMan() {
    Future.delayed(const Duration(seconds: 1), () {
      tutorialCoachMarkUserManual.show(context: context);
    });
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
    playSound();
  }

  void playSound() {
    _player.play(AssetSource("sound_local/Teru.mp3"),
        volume: instance.get<AppGlobal>().volumeApp);
  }

  Future<void> soundDispose() async {
    await _player.stop();
    _player.dispose();
    await _playerCheck.stop();
    _playerCheck.dispose();
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
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelOnPress: () {
        Navigator.pushNamed(context, Routers.takeEasyQuiz);
      },
      btnOkText: "play again".tr(),
      btnOkOnPress: () {},
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
          textNow: "",
          colorTextAndIcon: colorSystemWhite,
          onBack: () {
            soundDispose();
            Navigator.pushNamed(context, Routers.takeEasyQuiz);
          },
          child: Column(
            children: [
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
                                            children:
                                                e.map((ItemValueMatch item) {
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
                                count++;
                                _playerCheck.play(
                                    AssetSource('correct-choice.wav'),
                                    volume:
                                        instance.get<AppGlobal>().volumeApp);
                                DialogCommon().showInfoQuiz("true".tr(), context, colorMainTealPri);
                                Future.delayed(const Duration(milliseconds: 500), () {
                                  Navigator.pop(context);
                                });
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
                                    showFinishGameDialog();
                                  }
                                }
                              },
                            );
                          }).toList()),
                    ),
                  ],
                ),
              ),
              sizedBox,
              GestureDetector(
                onTap: () {
                  showModalBottomSheetUserManual();
                },
                child: Container(
                  padding: EdgeInsets.only(right: 5.w),
                  width: 100.w,
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    backgroundColor: colorErrorPrimary,
                    key: userManualKey,
                    radius: 20,
                    child: const Center(
                      child: Icon(
                        Icons.question_mark,
                        color: colorSystemWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
