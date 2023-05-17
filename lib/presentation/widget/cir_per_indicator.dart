import 'package:flutter/material.dart';
import '../../application/cons/color.dart';
import '../../application/cons/constants.dart';
import '../../application/cons/text_style.dart';



import 'package:percent_indicator/circular_percent_indicator.dart';




class CirPerIndicator extends StatelessWidget {
  final percentValue;
  final totalTime;
  final Size size;

  CirPerIndicator({@required this.totalTime, @required this.percentValue,required this.size});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 40,
      lineWidth: 8,
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
