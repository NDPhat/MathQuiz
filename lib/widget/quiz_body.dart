import 'package:flutter/material.dart';
import 'package:math/cons/text_style.dart';
import 'package:math/logic/quizBrain.dart';

import '../cons/constants.dart';

class QuizBody extends StatelessWidget {
  final QuizBrain quizBrainObject;

  QuizBody({required this.quizBrainObject});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            quizBrainObject.quiz,
            style: s16f700ColorError,
          ),
        ),
      ),
    );
  }
}
