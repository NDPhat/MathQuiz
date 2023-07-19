import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/widget/answer_table.dart';
import 'package:math/presentation/widget/quiz_body.dart';
import 'package:math/presentation/widget/quiz_body_hw.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import 'package:math/presentation/widget/user_homework_score.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

import '../../application/utils/make_quiz.dart';

import 'answer_table_hw.dart';
import 'app_bar.dart';
import 'button_custom.dart';

class PortraitModeHomeWork extends StatelessWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ;
  int? totalQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final onTap;
  VoidCallback onBack;
  final Size size;
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
    required this.size,
    required this.onBack,
    this.controller,
    this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        AppBarWidget(
          onBack: onBack,
          textTitle: 'HOME WORK',
        ),
        Container(
          height: size.height * 0.02,
          color: colorSystemWhite,
        ),
        Container(
          alignment: Alignment.center,
          color: colorSystemWhite,
          height: size.height * 0.88,
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
                    padding: EdgeInsets.only(
                        top: size.height * 0.2, left: size.width * 0.2),
                    child: QuizBodyHW(
                        quizBrainObject: quizBrainObject, size: size),
                  ),
                  UserHWScore(
                    size: size,
                    totalQuiz: totalQ,
                    quizNow: quizNow,
                    onFinished: onFinished,
                    controller: controller,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              AnswerTableHW(
                  size: size, quizBrainObject: quizBrainObject, onTap: onTap)
            ],
          ),
        ),
      ],
    );
  }
}
