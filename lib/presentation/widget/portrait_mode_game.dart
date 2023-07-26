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
      height:90.h,
      child: Column(
        children: [
          UserTableScore(
            trueQ: trueQ,
            controller: controller,
            falseQ: falseQ,
            onFinished: onFinished,
            quizNow: quizNow,
          ),
          Container(
            padding: EdgeInsets.only(top: 2.h),
            height: 73.h,
            color: colorMainTealPri,
            child: Column(
              children: [
                Container(
                  color: colorMainTealPri,
                  child: Stack(
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
