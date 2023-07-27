import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/widget/quiz_body_hw.dart';
import 'package:math/presentation/widget/user_homework_score.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/color.dart';

import '../../application/utils/make_quiz.dart';

import 'answer_table_hw.dart';

class PortraitModeHomeWork extends StatelessWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ;
  int? totalQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final onTap;
  VoidCallback onBack;
  CountDownController? controller;
  VoidCallback? onFinished;
  PortraitModeHomeWork({
    required this.highscore,
    required this.score,
    required this.trueQ,
    required this.falseQ,
    this.totalQ,
    required this.quizNow,
    required this.quizBrainObject,
    required this.onTap,
    required this.onBack,
    this.controller,
    this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90.h,
      child: Column(
        children: [
          UserHWScore(
            totalQuiz: totalQ,
            quizNow: quizNow,
            onFinished: onFinished,
            controller: controller,
          ),
          Container(
            height: 73.h,
            color: colorWaringText,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/table_quiz.png",
                      fit: BoxFit.fill,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 20.h, left: 20.w),
                      child: QuizBodyHW(quizBrainObject: quizBrainObject),
                    ),
                  ],
                ),
                AnswerTableHW(quizBrainObject: quizBrainObject, onTap: onTap)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
