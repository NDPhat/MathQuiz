import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/utils/make_quiz.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../../application/cons/color.dart';
import '../../../../application/cons/cons_rec.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/logic.dart';
import '../../../../application/utils/recognizer.dart';
import '../../../../data/model/prediction.dart';
import '../../../../data/model/user_global.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/board_item_take_easy_game.dart';

class WriteMissingNumberGameScreen extends StatefulWidget {
  @override
  State<WriteMissingNumberGameScreen> createState() =>
      _WriteMissingNumberGameScreenState();
}

class _WriteMissingNumberGameScreenState
    extends State<WriteMissingNumberGameScreen> {
  double strokeWidth = 5;
  bool loading = false;
  final _recognizer = Recognizer();
  List<Prediction> _prediction = [];
  final List<Offset?> _points = [];
  late QuizBrain quizBrain;
  List<List<int>> randomList = [];

  int position = 0;

  void _initDataAndModel() async {
    randomList = quizBrain.listWriteMissingNumber;
    randomList.shuffle();
    await _recognizer.loadModel();
  }

  @override
  void initState() {
    super.initState();
    quizBrain = QuizBrain();
    _initDataAndModel();
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
                playAgain();
              },
              child: const Text('PLAY AGAIN', style: kDialogButtonsTS),
            )
          ],
        );
      },
    );
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
    if (position < 7) {
      if (int.parse(prediction.label) == randomList[position][1]) {
        playSound("correct-choice.wav");
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            position++;
            _points.clear();
            _prediction.clear();
          });
        });
      } else {
        playSound("wrong-choice.wav");
        setState(() {
          _points.clear();
          _prediction.clear();
        });
      }
    } else {
      if (int.parse(prediction.label) == randomList[position]) {
        playSound("correct-choice.wav");
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _points.clear();
            _prediction.clear();
          });
        });
        showFinishDiaLog();
      } else {
        playSound("wrong-choice.wav");
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
      body: Center(
        child: Column(
          children: [
            AppBarWidget(
              onBack: () {
                Navigator.pop(context);
              },
              bgColor: colorSystemWhite,
            ),
            BoardItemTakeEasy(
                width: 60.w,
                height: 25.h,
                bgColor: colorMainBlueChart,
                child: Center(
                  child: Text(
                    randomList[position][0].toString(),
                    style: GoogleFonts.cabin(
                        color: colorSystemWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 100),
                  ),
                )),
            sizedBox,
            _drawCanvasWidget(60.w, 25.h),
            sizedBox,
            BoardItemTakeEasy(
                width: 60.w,
                height: 25.h,
                bgColor: colorMainBlueChart,
                child: Center(
                  child: Text(
                    randomList[position][2].toString(),
                    style: GoogleFonts.cabin(
                        color: colorSystemWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 100),
                  ),
                )),
          ],
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
  const CircleItem({Key? key, required this.colorBG}) : super(key: key);
  final Color colorBG;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.w,
      height: 10.h,
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
