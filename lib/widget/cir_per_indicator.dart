import 'package:flutter/material.dart';
import 'package:math/cons/color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../cons/constants.dart';


class CirPerIndicator extends StatelessWidget {
  final percentValue;
  final totalTime;

  CirPerIndicator({@required this.totalTime, @required this.percentValue});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 10,
      fillColor: colorSystemWhite,
      backgroundColor: colorBGInput,
      percent: percentValue,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        '$totalTime',
        style: kTimerTextStyle,
      ),
      progressColor: percentValue > 0.6
          ? Colors.blueAccent
          : percentValue > 0.3
              ? Colors.yellowAccent
              : Colors.red,
    );
  }
}
