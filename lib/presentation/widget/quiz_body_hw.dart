import 'package:flutter/material.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';

class QuizBodyHW extends StatelessWidget {
  final QuizBrain quizBrainObject;
  final Size size;

  QuizBodyHW({required this.quizBrainObject, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        child: Text(
          quizBrainObject.quiz,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45,
              color: colorSystemWhite),
        ),
      ),
    );
  }
}
