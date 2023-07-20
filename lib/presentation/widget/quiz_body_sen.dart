import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';

class QuizBodySen extends StatelessWidget {
  final QuizBrain quizBrainObject;

  QuizBodySen({required this.quizBrainObject});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Text(
          quizBrainObject.quiz,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: colorSystemWhite),
        ),
      ),
    );
  }
}
