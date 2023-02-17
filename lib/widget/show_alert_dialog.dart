import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../cons/constants.dart';
import '../routers/navigation.dart';

class ShowAlertDialog extends StatelessWidget {
  final score;
  final totalNumberOfQuizzes;
  final startGame;
  final int preId;

  ShowAlertDialog(
      {required this.score,
      required this.totalNumberOfQuizzes,
      required this.startGame,
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
            Navigator.pushNamed(context, Routers.home);
          },
          child: const Text('EXIT', style: kDialogButtonsTS),
        ),
        TextButton(
          onPressed: () {
            startGame();
            Navigator.pop(context);
          },
          child: const Text('PLAY AGAIN', style: kDialogButtonsTS),
        ),
      ],
    );
  }
}
