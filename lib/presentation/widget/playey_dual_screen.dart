import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/widget/answer_table.dart';
import '../../application/utils/make_quiz.dart';
import 'package:math/presentation/widget/quiz_body.dart';

class PlayerDualScreen extends StatelessWidget {
  const PlayerDualScreen(
      {Key? key,
      required this.size,
      required this.quizBrain,
      required this.onTap})
      : super(key: key);
  final Size size;
  final QuizBrain quizBrain;
  final onTap;
  final boolBotClick = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: Center(
        child: Column(
          children: [
            QuizBody(
              size: size,
              quizBrainObject: quizBrain,
            ),
            AnswerTable(
              size: size,
              quizBrainObject: quizBrain,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
