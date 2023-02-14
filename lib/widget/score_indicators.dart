import 'package:flutter/material.dart';

import '../cons/constants.dart';


class ScoreIndicators extends StatelessWidget {
  final highscore;
  final score;
  ScoreIndicators({
    @required this.highscore,
    @required this.score,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('HIGHSCORE', style: kScoreLabelTextStyle),
                SizedBox(height: 10),
                Text('$highscore', style: kScoreIndicatorTextStyle),
              ],
            ),
            SizedBox(width: 40),
            Column(
              children: [
                Text('SCORE', style: kScoreLabelTextStyle),
                SizedBox(height: 10),
                Text('$score', style: kScoreIndicatorTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
