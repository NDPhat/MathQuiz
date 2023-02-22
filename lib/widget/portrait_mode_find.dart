import 'package:flutter/material.dart';
import 'package:math/cons/color.dart';
import 'package:math/cons/text_style.dart';
import 'package:math/data/model/make_quiz.dart';
import 'package:math/logic/quizBrain.dart';
import 'package:math/widget/button_custom.dart';
import 'package:math/widget/quiz_body.dart';
import 'package:math/widget/reusable_button.dart';
import 'package:math/widget/score_indicators.dart';

import 'cir_per_indicator.dart';

class PortraitModeFind extends StatelessWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ, totalQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final sign;
  final onTap;
  final percentValue;
  final totalTime;
  PortraitModeFind({
    required this.highscore,
    required this.score,
    required this.trueQ,
    required this.falseQ,
    required this.totalQ,
    required this.quizNow,
    required this.quizBrainObject,
    required this.onTap,
    required this.totalTime,
    required this.percentValue,
    this.sign,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: colorSystemWhite,
      padding: EdgeInsets.only(
          top: size.height * 0.005,
          bottom: size.height * 0.05,
          left: size.width * 0.05,
          right: size.width * 0.05),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height * 0.2,
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
                          totalQ == 0
                              ? Text(
                            'Quiz : $quizNow',
                            style: s16f700ColorGreyTe,
                          )
                              : Text(
                            '$quizNow/$totalQ',
                            style: s16f700ColorGreyTe,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Row(
                        children: [
                          const Text(
                            'Score : ',
                            style: s20f700ColorErrorPro,
                          ),
                          Text(
                            score.toString(),
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
                padding: const EdgeInsets.only(bottom: 150),
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: colorSystemWhite,
                  child: CirPerIndicator(
                    percentValue: percentValue,
                    totalTime: totalTime,
                  ),
                ),
              ),
            ],
          ),
          QuizBody(
            quizBrainObject: quizBrainObject,
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      onTap(quizBrainObject.listFakeNum[0]);
                    },
                    color: colorAccentBlue,
                    width: size.width * 0.38,
                    height: size.height * 0.1,
                    child: Text(
                      quizBrainObject.listFakeNum[0].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  RoundedButton(
                    press: () {
                      onTap(quizBrainObject.listFakeNum[1]);
                    },
                    color: colorAccentBlue,
                    width: size.width * 0.38,
                    height: size.height * 0.1,
                    child: Text(
                      quizBrainObject.listFakeNum[1].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      onTap(quizBrainObject.listFakeNum[2]);
                    },
                    color: colorAccentBlue,
                    width: size.width * 0.38,
                    height: size.height * 0.1,
                    child: Text(
                      quizBrainObject.listFakeNum[2].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  RoundedButton(
                    press: () {
                      onTap(quizBrainObject.listFakeNum[3]);
                    },
                    color: colorAccentBlue,
                    width: size.width * 0.38,
                    height: size.height * 0.1,
                    child: Text(
                      quizBrainObject.listFakeNum[3].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
