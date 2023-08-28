import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/widget/answer_table.dart';
import 'package:math/presentation/widget/quiz_body_hw.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/color.dart';
import '../../application/utils/make_quiz.dart';

class PortraitModeGame extends StatelessWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final onTap;
  CountDownController? controller;
  VoidCallback? onFinished;
  PortraitModeGame({
    required this.highscore,
    required this.score,
    required this.trueQ,
    required this.falseQ,
    required this.quizNow,
    required this.quizBrainObject,
    required this.onTap,
    this.controller,
    this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Column(
        children: [
          UserTableScore(
            trueQ: trueQ,
            controller: controller,
            falseQ: falseQ,
            onFinished: onFinished,
            quizNow: quizNow,
          ),
          SizedBox(
            height: 70.h,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Image.asset(
                        "assets/images/bee_table.png",
                        fit: BoxFit.cover,
                        height: 35.h,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.h),
                      alignment: Alignment.centerRight,
                      child: QuizBodyHW(quizBrainObject: quizBrainObject),
                    ),
                  ],
                ),
                AnswerTable(
                  quizBrainObject: quizBrainObject,
                  onTap: onTap,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
