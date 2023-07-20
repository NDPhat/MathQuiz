import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class UserHWScore extends StatelessWidget {
  UserHWScore(
      {Key? key,
      this.totalQuiz,
      this.quizNow,
      this.onFinished,
      this.controller})
      : super(key: key);
  int? quizNow;
  int? totalQuiz;
  CountDownController? controller;
  VoidCallback? onFinished;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: 8.w, right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.update,
                    color: colorSystemWhite,
                  ),
                   SizedBox(
                    height:0.1.h,
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
                onStart: () {},
                onComplete: onFinished,
              ))
        ],
      ),
    );
  }
}
