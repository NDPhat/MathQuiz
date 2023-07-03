import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import 'cir_per_indicator.dart';

class UserTableScore extends StatelessWidget {
  UserTableScore(
      {Key? key,
      required this.size,
      this.trueQ,
      this.falseQ,
      this.quizNow,
      this.onFinished,
      this.controller})
      : super(key: key);
  final Size size;
  int? trueQ;
  int? falseQ;
  int? quizNow;
  CountDownController? controller;
  VoidCallback? onFinished;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height*0.17,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            padding:  EdgeInsets.only(top: size.height*0.01, left: size.width*0.05, right: size.width*0.05),
            height: size.height * 0.15,
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
                    const SizedBox(
                      height: 10,
                    ),
                    (Text(
                      'Quiz : $quizNow',
                      style: s16f700ColorGreyTe,
                    ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.08),
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
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          trueQ.toString(),
                          style: s16f700ColorBlueMa,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
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
                        const SizedBox(
                          width: 5,
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
            margin: EdgeInsets.only(bottom: size.height * 0.08),
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
