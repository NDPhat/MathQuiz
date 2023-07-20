import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/widget/answer_table.dart';
import 'package:math/presentation/widget/quiz_body_sen.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/color.dart';
import '../../application/utils/make_quiz.dart';
class PortraitModeGameSen extends StatelessWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final onTap;
  CountDownController? controller;
  VoidCallback? onFinished;
  PortraitModeGameSen({
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
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Column(
        children: [
          Container(
            color: colorSystemWhite,
            child: Column(
              children: [
                UserTableScore(
                  trueQ: trueQ,
                  controller: controller,
                  falseQ: falseQ,
                  onFinished: onFinished,
                  quizNow: quizNow,
                ),
                Stack(
                  children: [
                    Container(
                      width: 100.w,
                      height:35.h,
                      decoration: BoxDecoration(
                          color: colorMainTealPri,
                          border: Border.all(
                            width: 10,
                            color: colorSystemYeloow,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(top:3.h),
                      child: QuizBodySen(
                          quizBrainObject: quizBrainObject),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                AnswerTable(
                     quizBrainObject: quizBrainObject, onTap: onTap,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
