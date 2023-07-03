import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import '../../application/cons/color.dart';

class Time_Runner extends StatelessWidget {
  const Time_Runner({
    super.key,
    required this.size,
    required this.controller,
    this.onFinish,
  });
  final CountDownController controller;
  final onFinish;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: colorSystemWhite,
      child: CircleAvatar(
          radius: 40,
          backgroundColor: colorSystemWhite,
          child: CircularCountDownTimer(
            duration: 60,
            initialDuration: 0,
            controller: controller,
            width: 50,
            height: 50,
            ringColor: colorSystemWhite,
            fillColor: colorSystemWhite,
            backgroundColor: colorGrayBG,
            backgroundGradient: null,
            strokeWidth: 20.0,
            strokeCap: StrokeCap.round,
            textStyle: const TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.S,
            autoStart: false,
            onStart: () {},
            onComplete: onFinish,
          )),
    );
  }
}
