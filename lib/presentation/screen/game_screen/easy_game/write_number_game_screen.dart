import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/utils/make_quiz.dart';
import 'package:math/data/model/app_global.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:math/presentation/widget/board_item_take_easy_game.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/cons_rec.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/cons/text_style.dart';
import '../../../../application/utils/recognizer.dart';
import '../../../../data/model/prediction.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';

class WriteNumberBoardGame extends StatefulWidget {
  @override
  _DrawingBoardState createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<WriteNumberBoardGame> {
  double strokeWidth = 5;
  bool loading = false;
  late QuizBrain quizBrain;
  final _recognizer = Recognizer();
  List<Prediction> _prediction = [];
  final List<Offset?> _points = [];
  List<int> randomList = [];
  int position = 0;
  int answer = 0;
  final _player = AudioPlayer();
  final _playerCheck = AudioPlayer();
  void _initDataAndModel() async {
    randomList = quizBrain.listWriteNumber;
    await _recognizer.loadModel();
  }

  @override
  void dispose() {
    super.dispose();
    soundDispose();
  }

  void playSound() {
    _player.play(AssetSource("sound_local/Teru.mp3"),
        volume: instance.get<AppGlobal>().volumeApp);
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
        soundDispose();
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
  void resetDialogAnswer() {
    Future.delayed(const Duration(seconds: 1), ()
    {
      setState(() {
        answer = 0;
      });
    });
  }

  checkPreDict() {
    Prediction prediction = _prediction.reduce(
        (item1, item2) => item1.confidence > item2.confidence ? item1 : item2);
    if (position < 9) {
      if (int.parse(prediction.label) == randomList[position]) {
        _playerCheck.play(AssetSource('correct-choice.wav'),
            volume: instance.get<AppGlobal>().volumeApp);
            setState(() {
              position++;
              answer = 1;
              _points.clear();
              _prediction.clear();
            });
          resetDialogAnswer();
        } else {
        _playerCheck.play(
            AssetSource(
              'wrong-choice.wav',
            ),
            volume: instance.get<AppGlobal>().volumeApp);
        setState(() {
          _points.clear();
          answer = 2;
          _prediction.clear();
        });
        resetDialogAnswer();

      }
    } else {
      if (int.parse(prediction.label) == randomList[position]) {
        _playerCheck.play(AssetSource('correct-choice.wav'),
            volume: instance.get<AppGlobal>().volumeApp);
          setState(() {
            answer = 1;
            _points.clear();
            _prediction.clear();
          });
          resetDialogAnswer();
        showFinishGameDialog();
      } else {
        _playerCheck.play(
            AssetSource(
              'wrong-choice.wav',
            ),
            volume: instance.get<AppGlobal>().volumeApp);
        setState(() {
          answer = 2;
          _points.clear();
          _prediction.clear();
        });
        resetDialogAnswer();
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
                'assets/images/bg/bg3.jpg',
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
          child: Center(
            child: Column(
              children: [
                BoardItemTakeEasy(
                    width: 60.w,
                    height: 30.h,
                    bgColor: colorMainBlueChart,
                    child: Center(
                      child: Text(
                        randomList[position].toString(),
                        style: GoogleFonts.cabin(
                            color: colorSystemWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 100),
                      ),
                    )),
                sizedBox,
                Transform.rotate(
                  angle: math.pi / 2,
                  child: const Icon(
                    Icons.keyboard_double_arrow_right,
                    color: colorMainTealPri,
                    size: 50,
                  ),
                ),
                sizedBox,
                _drawCanvasWidget(60.w, 30.h),
                answer != 0 ?
                Container(
                  alignment: Alignment.center,
                  padding:  EdgeInsets.only(top: 5.h),
                  child: Visibility(
                      child: Container(
                        alignment: Alignment.center,
                        width: 60.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: answer == 1 ? colorMainTealPri: colorErrorPrimary,
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                        ),
                    child: Text(answer == 1 ? "true".tr().toUpperCase():"false".tr().toUpperCase(),style: s16f500ColorSysWhite,textAlign: TextAlign.center,),
                  )),
                ): const SizedBox.shrink()
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
