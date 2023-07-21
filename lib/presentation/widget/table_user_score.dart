import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class UserTableScore extends StatelessWidget {
  UserTableScore(
      {Key? key,
      this.trueQ,
      this.falseQ,
      this.quizNow,
      this.onFinished,
      this.controller})
      : super(key: key);
  int? trueQ;
  int? falseQ;
  int? quizNow;
  CountDownController? controller;
  VoidCallback? onFinished;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 17.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.h),
            padding: EdgeInsets.only(top: 1.h, left: 5.w, right: 5.w),
            height: 15.h,
            decoration: const BoxDecoration(
                color: colorBlueQuaternery,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Icon(Icons.update),
                    SizedBox(
                      height: 0.1.h,
                    ),
                    (Text(
                      'Quiz : $quizNow',
                      style: s16f700ColorGreyTe,
                    ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Row(
                    children: [
                      const Text(
                        'Score : ',
                        style: s20f700ColorErrorPro,
                      ),
                      Text(
                        trueQ.toString(),
                        style: s20f700ColorErrorPro,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                            radius: 8,
                            child: Icon(
                              Icons.check,
                              size: 8,
                            )),
                        SizedBox(
                          width: 0.5.w,
                        ),
                        Text(
                          trueQ.toString(),
                          style: s16f700ColorBlueMa,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.1.w,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: colorErrorPrimary,
                            radius: 8,
                            child: Icon(
                              Icons.close,
                              size: 8,
                            )),
                        SizedBox(
                          width: 0.5.w,
                        ),
                        Text(
                          falseQ.toString(),
                          style: s16f700ColorError,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
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
