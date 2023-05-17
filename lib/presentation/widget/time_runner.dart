import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import 'cir_per_indicator.dart';

class Time_Runner extends StatelessWidget {
  const Time_Runner({
    super.key,
    required double percentTimer,
    required int totalTime,
    required this.size,
  })  : _value = percentTimer,
        _totalTime = totalTime;

  final double _value;
  final int _totalTime;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: colorSystemWhite,
      child: CirPerIndicator(
        size: size,
        percentValue: _value,
        totalTime: _totalTime,
      ),
    );
  }
}
