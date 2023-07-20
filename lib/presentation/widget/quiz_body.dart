import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';

class QuizBody extends StatelessWidget {
  final QuizBrain quizBrainObject;
  QuizBody({required this.quizBrainObject});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Text(
          quizBrainObject.quiz,
          style: s30f700ColorGreyPri,
        ),
      ),
    );
  }
}
