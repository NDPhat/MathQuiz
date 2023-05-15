import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../application/cons/constants.dart';
import '../routers/navigation.dart';


class ShowAlerTesttDialog extends StatelessWidget {
  final score;
  final totalNumberOfQuizzes;
  final int preId;

  ShowAlerTesttDialog(
      {required this.score,
      required this.totalNumberOfQuizzes,
      required this.preId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        25,
      )),
      backgroundColor: const Color(0xff1542bf),
      title: const FittedBox(
        child: Text('GAME OVER', textAlign: TextAlign.center, style: kTitleTS),
      ),
      content: Text('Score: $score | $totalNumberOfQuizzes',
          textAlign: TextAlign.center, style: kContentTS),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routers.homeGuest);
          },
          child: const Text('EXIT', style: kDialogButtonsTS),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routers.checkAnswer, arguments: preId);
          },
          child: const Text('CHECK ANSWER', style: kDialogButtonsTS),
        ),
      ],
    );
  }
}
