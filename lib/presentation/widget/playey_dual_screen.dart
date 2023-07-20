import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/widget/answer_table.dart';
import 'package:sizer/sizer.dart';
import '../../application/utils/make_quiz.dart';
import 'package:math/presentation/widget/quiz_body.dart';

class PlayerDualScreen extends StatelessWidget {
  const PlayerDualScreen(
      {Key? key,
      required this.quizBrain,
      required this.onTap})
      : super(key: key);
  final QuizBrain quizBrain;
  final onTap;
  final boolBotClick = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:5.h),
      child: Center(
        child: Column(
          children: [
            QuizBody(
              quizBrainObject: quizBrain,
            ),
            AnswerTable(
              quizBrainObject: quizBrain,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
