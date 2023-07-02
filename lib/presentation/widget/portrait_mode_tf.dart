import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/presentation/widget/quiz_body.dart';
import 'package:math/presentation/widget/quiz_body_hw.dart';
import 'package:math/presentation/widget/table_user_score.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

import '../../application/utils/make_quiz.dart';

import '../../domain/bloc/game/game_cubit.dart';
import 'app_bar.dart';
import 'button_custom.dart';
import 'cir_per_indicator.dart';
import 'package:circular_countdown/circular_countdown.dart';

class PortraitModeTF extends StatelessWidget {
  final int score;
  final int trueQ, falseQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final sign;
  final Size size;
  final onTap;
  final percentValue;
  int timeNow;
  PortraitModeTF({
    required this.score,
    required this.trueQ,
    required this.falseQ,
    required this.quizNow,
    required this.size,
    required this.quizBrainObject,
    required this.onTap,
    required this.timeNow,
    required this.percentValue,
    this.sign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                falseQ: falseQ,
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
                        top: size.height * 0.2, left: size.width * 0.2),
                    child: QuizBodyHW(
                        quizBrainObject: quizBrainObject, size: size),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.08,
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
                    height: size.height * 0.08,
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
                    height: size.height * 0.08,
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
