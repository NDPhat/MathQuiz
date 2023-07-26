import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return SizedBox(
      height: 17.h,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.h),
            padding:
                EdgeInsets.only(top: 1.h, left: 5.w, right: 5.w, bottom: 2.h),
            alignment: Alignment.bottomCenter,
            height: 15.h,
            decoration: const BoxDecoration(
                color: colorSystemPurple,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Text(
              "$quizNow/$totalQuiz",
              style:
                  GoogleFonts.aclonica(color: colorErrorPrimary, fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10.h),
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
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  autoStart: false,
                  onStart: () {},
                  onComplete: onFinished,
                )),
          )
        ],
      ),
    );
  }
}
