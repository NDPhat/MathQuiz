import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/widget/app_bar.dart';

import '../../../../application/cons/cons_rec.dart';
import '../../../../application/utils/recognizer.dart';
import '../../../../data/model/prediction.dart';

class DrawingNumberBoardGame extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingNumberBoardGame> {
  double strokeWidth = 5;
  bool loading = false;
  final _recognizer = Recognizer();
  List<Prediction> _prediction = [];
  final List<Offset?> _points = [];

  void _initModel() async {
    var res = await _recognizer.loadModel();
    print(res);
  }

  @override
  void initState() {
    super.initState();
    _initModel();
  }

  void _checkFinish() {}

  void _recognize() async {
    List<dynamic> pred = await _recognizer.recognize(_points);
    setState(() {
      _prediction = pred.map((json) => Prediction.fromJson(json)).toList();
    });
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

  preDictMax() {
    Prediction prediction = _prediction.reduce(
        (item1, item2) => item1.confidence > item2.confidence ? item1 : item2);

    return prediction;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: Center(
        child: Column(
          children: [
            AppBarWidget(
                bgColor: colorSystemWhite,
                onBack: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              height: size.height * 0.05,
            ),
            _drawCanvasWidget(size.width * 0.6, size.height * 0.3),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.6,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: Constants.borderSize,
                ),
              ),
              child: _prediction.isNotEmpty
                  ? Center(
                      child: preDictMax() != null
                          ? Text(
                              "${preDictMax().label}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                background: Paint()..color = Colors.white,
                              ),
                            )
                          : const Text("NULl"),
                    )
                  : Container(),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 20,
                        child: Center(
                          child: Icon(Icons.question_mark),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 20,
                        child: Center(
                          child: Icon(Icons.clear),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
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
