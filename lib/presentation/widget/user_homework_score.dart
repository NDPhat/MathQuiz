import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';

class UserHWScore extends StatelessWidget {
  UserHWScore({Key? key, this.quizNow, this.onFinished, this.controller})
      : super(key: key);
  int? quizNow;
  CountDownController? controller;
  VoidCallback? onFinished;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 90.w,
            margin: EdgeInsets.only(top: 3.h),
            padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h),
            decoration: BoxDecoration(
                border: Border.all(color: colorSystemYeloow),
                borderRadius: BorderRadius.all(Radius.circular(10.w))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Image.asset(
                        "assets/images/happy.png",
                        width: 50,
                        height: 7.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Image.asset(
                        "assets/images/sad.png",
                        width: 50,
                        height: 7.h,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 90.w,
                  child: Text(
                    "${"quiz".tr()} :$quizNow",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aclonica(
                        color: colorSystemYeloow, fontSize: 27),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
                radius: 40,
                backgroundColor: colorSystemYeloow,
                child: CircularCountDownTimer(
                  duration: 60,
                  initialDuration: 0,
                  controller: controller,
                  width: 50,
                  height: 50,
                  ringColor: colorSystemWhite,
                  fillColor: colorSystemWhite,
                  backgroundColor: colorSystemWhite,
                  strokeWidth: 20.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                      fontSize: 25,
                      color: colorSystemYeloow,
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
