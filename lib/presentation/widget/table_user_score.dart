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
      this.timeNow,
      this.percentTime,
      this.quizNow,
      this.onFinished,
      this.controller})
      : super(key: key);
  final Size size;
  int? trueQ;
  int? falseQ;
  int? quizNow;
  double? percentTime;
  int? timeNow;
  CountDownController? controller;
  VoidCallback? onFinished;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height * 0.15,
            decoration: const BoxDecoration(
                color: colorBlueQuaternery,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.1),
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Column(
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
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.1),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: colorSystemWhite,
              child: CirPerIndicator(
                percentValue: percentTime,
                size: size,
                timeNow: timeNow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
