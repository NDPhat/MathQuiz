import 'package:flutter/material.dart';

import '../cons/constants.dart';

class QuizBody extends StatelessWidget {
  final quizBrainObject;
  QuizBody({@required this.quizBrainObject});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            quizBrainObject.quiz,
            style: kQuizTextStyle,
          ),
        ),
      ),
    );
  }
}
