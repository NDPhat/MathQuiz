import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/presentation/widget/quiz_body.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

import '../../application/utils/make_quiz.dart';

import '../../domain/bloc/game/game_cubit.dart';
import 'button_custom.dart';
import 'cir_per_indicator.dart';
import 'package:circular_countdown/circular_countdown.dart';

class PortraitModeTF extends StatelessWidget {
  final int score;
  final int trueQ, falseQ, totalQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final sign;
  final onTap;
  final percentValue;
  int timeNow;
  PortraitModeTF({
    required this.score,
    required this.trueQ,
    required this.falseQ,
    required this.totalQ,
    required this.quizNow,
    required this.quizBrainObject,
    required this.onTap,
    required this.timeNow,
    required this.percentValue,
    this.sign,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: colorSystemWhite,
      padding: EdgeInsets.only(
          top: size.height * 0.005,
          bottom: size.height * 0.05,
          left: size.width * 0.05,
          right: size.width * 0.05),
      child: Column(
        children: [
          UserTableScore(
            size: size,
            percentTime: percentValue,
            timeNow: timeNow,
            trueQ: trueQ,
            falseQ: falseQ,
            totalQuiz: totalQ,
            typeOfGame: "TF",
            quizNow: quizNow,
          ),
          QuizBody(
            size: size,
            quizBrainObject: quizBrainObject,
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                press: () {
                  onTap('TRUE');
                },
                color: colorSystemWhite,
                width: size.width * 0.4,
                height: size.height * 0.1,
                child: Image.asset('assets/images/true.jpg'),
              ),
              SizedBox(
                width: size.height * 0.03,
              ),
              RoundedButton(
                press: () {
                  onTap('FALSE');
                },
                color: colorSystemWhite,
                width: size.width * 0.4,
                height: size.height * 0.1,
                child: Image.asset('assets/images/false.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
