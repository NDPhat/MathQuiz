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

class PortraitMode extends StatelessWidget {
  final highscore;
  final score;
  final QuizBrain quizBrainObject;
  final sign;
  final onTap;
  final percentValue;
  final totalTime;
  PortraitMode({
    required this.highscore,
    required this.score,
    required this.quizBrainObject,
    required this.onTap,
    required this.totalTime,
    required this.percentValue,
    this.sign,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.1,
          bottom: size.height * 0.1,
          left: size.width * 0.05,
          right: size.width * 0.05),
      child: Column(
        children: [
          CirPerIndicator(
            percentValue: percentValue,
            totalTime: totalTime,
          ),
          QuizBody(
            quizBrainObject: quizBrainObject,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                      text: quizBrainObject.listAnswer[0].toString(),
                      press: () {
                        onTap(quizBrainObject.listAnswer[0]);
                      },
                      color: colorSystemWhite,
                      textColor: colorMainBlue,
                      width: size.width * 0.38,
                      height: size.height * 0.1,
                      textStyle: s16f700ColorGreyTe),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  RoundedButton(
                      text: quizBrainObject.listAnswer[1].toString(),
                      press: () {
                        onTap(quizBrainObject.listAnswer[1]);
                      },
                      color: colorSystemWhite,
                      textColor: colorMainBlue,
                      width: size.width * 0.38,
                      height: size.height * 0.1,
                      textStyle: s16f700ColorGreyTe),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                      text: quizBrainObject.listAnswer[2].toString(),
                      press: () {
                        onTap(quizBrainObject.listAnswer[2]);
                      },
                      color: colorSystemWhite,
                      textColor: colorMainBlue,
                      width: size.width * 0.38,
                      height: size.height * 0.1,
                      textStyle: s16f700ColorGreyTe),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  RoundedButton(
                      text: quizBrainObject.listAnswer[3].toString(),
                      press: () {
                        onTap(quizBrainObject.listAnswer[3]);
                      },
                      color: colorSystemWhite,
                      textColor: colorMainBlue,
                      width: size.width * 0.38,
                      height: size.height * 0.1,
                      textStyle: s16f700ColorGreyTe),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
