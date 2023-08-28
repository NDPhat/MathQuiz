import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/color.dart';
import '../../application/utils/make_quiz.dart';

class QuizBodyHW extends StatelessWidget {
  final QuizBrain quizBrainObject;

  QuizBodyHW({required this.quizBrainObject});

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
          style:GoogleFonts.aclonica(color: colorSystemYeloow,fontSize: 30)
        ),
      ),
    );
  }
}
