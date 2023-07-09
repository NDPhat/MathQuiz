import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import 'cir_per_indicator.dart';

class UserHWScore extends StatelessWidget {
  UserHWScore(
      {Key? key,
      required this.size,
      this.totalQuiz,
      this.quizNow,
      this.onFinished,
      this.controller})
      : super(key: key);
  final Size size;
  int? quizNow;
  int? totalQuiz;
  CountDownController? controller;
  VoidCallback? onFinished;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height*0.02,left: size.width*0.08,right: size.width*0.09),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                children: [
                  const Icon(Icons.update,color: colorSystemWhite,),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$quizNow/$totalQuiz',
                    style: s16f700ColorSysWhite,
                  )
                ],
              ),
            ],
          ),
          CircleAvatar(
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
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.S,
                autoStart: false,
                onStart: () {
                },
                onComplete: onFinished,
              ))
        ],
      ),
    );
  }
}
