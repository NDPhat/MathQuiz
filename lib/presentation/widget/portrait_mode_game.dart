import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/widget/answer_table.dart';
import 'package:math/presentation/widget/quiz_body.dart';
import 'package:math/presentation/widget/quiz_body_hw.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

import '../../application/utils/make_quiz.dart';

import 'answer_table_hw.dart';
import 'app_bar.dart';
import 'button_custom.dart';

class PortraitModeGame extends StatelessWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final onTap;
  final Size size;
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
    required this.size,
    this.controller,
    this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.9,
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
              Container(
                padding: EdgeInsets.only(top: size.height * 0.02),
                height: size.height * 0.73,
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
                                top: size.height * 0.2, left: size.width * 0.2),
                            child: QuizBodyHW(
                                quizBrainObject: quizBrainObject, size: size),
                          ),
                        ],
                      ),
                    ),
                    AnswerTable(
                      size: size,
                      quizBrainObject: quizBrainObject,
                      onTap: onTap,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
