import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/widget/answer_table.dart';
import 'package:math/presentation/widget/quiz_body.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

import '../../application/utils/make_quiz.dart';

import 'app_bar.dart';
import 'button_custom.dart';

class PortraitModeGame extends StatelessWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ;
  int? totalQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final onTap;
  VoidCallback onBack;
  double? percentValue;
  final Size size;
  String? typeOfGame;
  double? percentTime;
  int? timeNow;
  CountDownController? controller;
  VoidCallback? onFinished;
  PortraitModeGame(
      {required this.highscore,
      required this.score,
      required this.trueQ,
      required this.falseQ,
      this.totalQ,
      required this.quizNow,
      required this.quizBrainObject,
      required this.onTap,
      this.percentValue,
      required this.size,
      required this.onBack,
      this.controller,
      this.onFinished,
      this.typeOfGame,
      this.timeNow});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        AppBarWidget(
          size: size,
          onBack: onBack,
          textTitle: 'PRACTICE TESTING',
        ),
        Container(
          color: colorSystemWhite,
          padding: EdgeInsets.only(
            top: size.height * 0.005,
            bottom: size.height * 0.05,
          ),
          child: Column(
            children: [
              UserTableScore(
                size: size,
                percentTime: percentValue,
                timeNow: timeNow,
                trueQ: trueQ,
                controller: controller,
                falseQ: falseQ,
                totalQuiz: totalQ,
                onFinished: onFinished,
                typeOfGame: typeOfGame,
                quizNow: quizNow,
              ),
              QuizBody(
                size: size,
                quizBrainObject: quizBrainObject,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              AnswerTable(
                  size: size, quizBrainObject: quizBrainObject, onTap: onTap)
            ],
          ),
        ),
      ],
    );
  }
}
