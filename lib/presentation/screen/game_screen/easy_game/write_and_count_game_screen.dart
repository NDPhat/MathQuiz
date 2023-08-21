import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/application/utils/make_quiz.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../../application/cons/color.dart';
import '../../../../application/cons/cons_rec.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/recognizer.dart';
import '../../../../application/utils/sound.dart';
import '../../../../data/model/app_global.dart';
import '../../../../data/model/prediction.dart';
import '../../../../data/model/user_global.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/board_item_take_easy_game.dart';

class WriteAndCountGameScreen extends StatefulWidget {
  @override
  State<WriteAndCountGameScreen> createState() =>
      _WriteAndCountGameScreenState();
}

class _WriteAndCountGameScreenState extends State<WriteAndCountGameScreen> {
  double strokeWidth = 5;
  bool loading = false;
  final _recognizer = Recognizer();
  List<Prediction> _prediction = [];
  final List<Offset?> _points = [];
  late QuizBrain quizBrain;
  List<List<ItemValue>> randomListValue = [];
  List<int> randomList = [];
  List<Color> colorList = [
    colorErrorPrimary,
    colorSystemYeloow,
    colorMainTealPri,
    Colors.pink,
    colorGreyTetiary
  ];
  final _player = AudioPlayer();
  final _playerCheck = AudioPlayer();
  int position = 0;

  void _initDataAndModel() async {
    randomList = quizBrain.listWriteAndCountNumber;
    randomList.shuffle();
    initItem();
    await _recognizer.loadModel();
  }

  void initItem() {
    final random = new Random();
    randomList.forEach((element) {
      List<ItemValue> list = [];
      for (int i = 0; i < element; i++) {
        list.add(ItemValue(
            value: element,
            color: colorList[random.nextInt(colorList.length)]));
      }
      randomListValue.add(list);
    });
  }

  @override
  void dispose() {
    super.dispose();
    soundDispose();
  }

  @override
  void initState() {
    super.initState();
    quizBrain = QuizBrain();
    _initDataAndModel();
    playSound();
  }

  Future<void> soundDispose() async {
    await _player.stop();
    await _playerCheck.stop();
    _player.dispose();
    _playerCheck.dispose();
  }

  void playSound() {
    _player.play(AssetSource("sound_local/Rouge.mp3"),
        volume: instance.get<AppGlobal>().volumeApp);
  }

  void _recognize() async {
    List<dynamic> pred = await _recognizer.recognize(_points);
    setState(() {
      _prediction = pred.map((json) => Prediction.fromJson(json)).toList();
    });
    checkPreDict();
  }

  Widget _drawCanvasWidget(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorSystemWhite,
        border: Border.all(
          color: Colors.black,
          width: Constants.borderSize,
        ),
      ),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          Offset _localPosition = details.localPosition;
          if (_localPosition.dx >= 0 &&
              _localPosition.dx <= Constants.canvasSize &&
              _localPosition.dy >= 0 &&
              _localPosition.dy <= Constants.canvasSize) {
            setState(() {
              _points.add(_localPosition);
            });
          }
        },
        onPanEnd: (DragEndDetails details) {
          _points.add(null);
          _recognize();
        },
        child: CustomPaint(
          painter: DrawingPainter(_points),
        ),
      ),
    );
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
      btnOkOnPress: () {
        playAgain();
      },
    ).show();
  }

  void playAgain() {
    setState(() {
      position = 0;
      _points.clear();
      _prediction.clear();
    });
  }

  checkPreDict() {
    Prediction prediction = _prediction.reduce(
        (item1, item2) => item1.confidence > item2.confidence ? item1 : item2);
    if (position < 8) {
      if (int.parse(prediction.label) ==
          randomListValue[position].first.value) {
        _playerCheck.play(AssetSource('correct-choice.wav'),
            volume: instance.get<AppGlobal>().volumeApp);
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            position++;
            _points.clear();
            _prediction.clear();
          });
        });
      } else {
        _playerCheck.play(
            AssetSource(
              'wrong-choice.wav',
            ),
            volume: instance.get<AppGlobal>().volumeApp);
        setState(() {
          _points.clear();
          _prediction.clear();
        });
      }
    } else {
      if (int.parse(prediction.label) == randomList[position]) {
        _playerCheck.play(AssetSource('correct-choice.wav'),
            volume: instance.get<AppGlobal>().volumeApp);
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _points.clear();
            _prediction.clear();
          });
        });
        showFinishGameDialog();
      } else {
        _playerCheck.play(
            AssetSource(
              'wrong-choice.wav',
            ),
            volume: instance.get<AppGlobal>().volumeApp);
        setState(() {
          _points.clear();
          _prediction.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/bg/bg6.jpg',
              ),
              fit: BoxFit.fill),
        ),
        child: MainPageHomePG(
          textNow: "",
          colorTextAndIcon: colorSystemYeloow,
          onBack: () {
            soundDispose();
            Navigator.pushNamed(context, Routers.takeEasyQuiz);
          },
          child: Center(
            child: Column(
              children: [
                BoardItemTakeEasy(
                  width: 60.w,
                  height: 30.h,
                  bgColor: colorMainBlueChart,
                  child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      padding: const EdgeInsets.all(4.0),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      children: randomListValue[position].map((ItemValue item) {
                        return CircleItem(
                          colorBG: item.color,
                          width: 60.w,
                          height: 10.h,
                        );
                      }).toList()),
                ),
                sizedBox,
                Transform.rotate(
                  angle: math.pi / 2,
                  child: const Icon(
                    Icons.keyboard_double_arrow_right,
                    color: colorSystemWhite,
                    size: 50,
                  ),
                ),
                sizedBox,
                _drawCanvasWidget(60.w, 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;

  DrawingPainter(this.points);

  final Paint _paint = Paint()
    ..strokeCap = StrokeCap.round
    ..color = Colors.black
    ..strokeWidth = Constants.strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CircleItem extends StatelessWidget {
  const CircleItem(
      {Key? key,
      required this.colorBG,
      required this.width,
      required this.height})
      : super(key: key);
  final Color colorBG;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: colorBG,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: colorSystemWhite, width: 2)),
    );
  }
}

class ItemValue {
  int value;
  Color color;
  ItemValue({required this.value, required this.color});
}
