import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/widget/answer_table.dart';
import 'package:math/presentation/widget/quiz_body_sen.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import '../../application/cons/color.dart';
import '../../application/utils/make_quiz.dart';
class PortraitModeGameSen extends StatelessWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final onTap;
  final Size size;
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
    required this.size,
    this.controller,
    this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Column(
        children: [
          Container(
            color: colorSystemWhite,
            child: Column(
              children: [
                UserTableScore(
                  size: size,
                  trueQ: trueQ,
                  controller: controller,
                  falseQ: falseQ,
                  onFinished: onFinished,
                  quizNow: quizNow,
                ),
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                          color: colorMainTealPri,
                          border: Border.all(
                            width: 10,
                            color: colorSystemYeloow,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      child: QuizBodySen(
                          quizBrainObject: quizBrainObject, size: size),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                AnswerTable(
                    size: size, quizBrainObject: quizBrainObject, onTap: onTap,  colorBG: colorMainBlue,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
