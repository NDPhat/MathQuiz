import 'package:flutter/material.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';

class QuizBody extends StatelessWidget {
  final QuizBrain quizBrainObject;
  final Size size;

  QuizBody({required this.quizBrainObject, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:size.height*0.05,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.05,),
        child: Text(
          quizBrainObject.quiz,
          style: s30f700ColorGreyPri,
        ),
      ),
    );
  }
}
