import 'package:flutter/material.dart';
import 'package:math/cons/color.dart';
import 'package:math/cons/text_style.dart';
import 'package:math/widget/button_custom.dart';
import 'package:math/widget/quiz_body.dart';
import 'package:math/widget/reusable_button.dart';
import 'package:math/widget/score_indicators.dart';

import 'cir_per_indicator.dart';

class PortraitMode extends StatelessWidget {
  final highscore;
  final score;
  final quizBrainObject;
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
                      text: '1',
                      press: () {},
                      color: colorSystemWhite,
                      textColor: colorMainBlue,
                      width: size.width * 0.4,
                      height: size.height * 0.1,
                      textStyle: s16f700ColorGreyTe),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  RoundedButton(
                      text: '2',
                      press: () {},
                      color: colorSystemWhite,
                      textColor: colorMainBlue,
                      width: size.width * 0.4,
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
                      text: '1',
                      press: () {},
                      color: colorSystemWhite,
                      textColor: colorMainBlue,
                      width: size.width * 0.4,
                      height: size.height * 0.1,
                      textStyle: s16f700ColorGreyTe),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  RoundedButton(
                      text: '2',
                      press: () {},
                      color: colorSystemWhite,
                      textColor: colorMainBlue,
                      width: size.width * 0.4,
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
