import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import '../../application/cons/color.dart';

class Time_Runner extends StatelessWidget {
  const Time_Runner({
    super.key,
    required this.controller,
    this.onFinish,
  });
  final CountDownController controller;
  final onFinish;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: colorSystemYeloow,
      child: CircleAvatar(
          radius: 40,
          backgroundColor: colorSystemYeloow,
          child: CircularCountDownTimer(
            duration: 60,
            initialDuration: 0,
            controller: controller,
            width: 50,
            height: 50,
            ringColor: colorSystemYeloow,
            fillColor: colorSystemWhite,
            backgroundColor: colorSystemYeloow,
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
