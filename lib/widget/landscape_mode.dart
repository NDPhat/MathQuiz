import 'package:flutter/material.dart';
import 'package:math/widget/quiz_body.dart';
import 'package:math/widget/reusable_button.dart';
import 'package:math/widget/score_indicators.dart';

import 'cir_per_indicator.dart';


class LandscapeMode extends StatelessWidget {
  final highscore;
  final score;
  final quizBrainObject;
  final onTap;
  final percentValue;
  final totalTime;
  LandscapeMode({
    @required this.highscore,
    @required this.score,
    @required this.quizBrainObject,
    @required this.onTap,
    @required this.totalTime,
    @required this.percentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReUsableOutlineButton(
          userChoice: 'FALSE',
          color: Colors.redAccent,
          onTap: onTap,
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              ScoreIndicators(highscore: highscore, score: score),
              QuizBody(
                quizBrainObject: quizBrainObject,
              ),
              Expanded(
                flex: 3,
                child: CirPerIndicator(
                  percentValue: percentValue,
                  totalTime: totalTime,
                ),
              ),
            ],
          ),
        ),
        ReUsableOutlineButton(
          userChoice: 'TRUE',
          color: Colors.lightGreenAccent,
          onTap: onTap,
        ),
      ],
    );
  }
}
