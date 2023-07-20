import 'package:flutter/material.dart';
import 'package:math/presentation/widget/quiz_body_hw.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/color.dart';
import '../../application/utils/make_quiz.dart';
import 'button_custom.dart';

class PortraitModeTF extends StatelessWidget {
  final int score;
  final int trueQ, falseQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final sign;
  final controller;
  final onTap;
  final onFinished;
  PortraitModeTF({
    required this.score,
    required this.trueQ,
    required this.falseQ,
    required this.quizNow,
    required this.onFinished,
    required this.controller,
    required this.quizBrainObject,
    required this.onTap,
    this.sign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: colorSystemWhite,
          padding: EdgeInsets.only(
            top: 0.5.h,
            bottom: 5.h,
          ),
          child: Column(
            children: [
              UserTableScore(
                controller: controller,
                falseQ: falseQ,
                onFinished: onFinished,
                quizNow: quizNow,
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/images/table_quiz.png",
                    fit: BoxFit.fill,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        top: 20.h, left: 20.w),
                    child: QuizBodyHW(
                        quizBrainObject: quizBrainObject),
                  ),
                ],
              ),
              SizedBox(
                height:8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      onTap('TRUE');
                    },
                    color: colorSystemWhite,
                    width: 40.w,
                    height: 8.h,
                    child: Image.asset('assets/images/true.jpg'),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  RoundedButton(
                    press: () {
                      onTap('FALSE');
                    },
                    color: colorSystemWhite,
                    width: 40.w,
                    height: 8.h,
                    child: Image.asset('assets/images/false.jpg'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
