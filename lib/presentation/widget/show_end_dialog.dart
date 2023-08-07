import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cons/constants.dart';
import '../../data/model/user_global.dart';
import '../../domain/bloc/game/game_cubit.dart';

import '../../main.dart';
import '../routers/navigation.dart';

class ShowEndDialog extends StatelessWidget {
  final score;
  final totalNumberOfQuizzes;
  final startGame;

  ShowEndDialog({
    required this.score,
    required this.totalNumberOfQuizzes,
    required this.startGame,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        25,
      )),
      backgroundColor: const Color(0xff1542bf),
      title: FittedBox(
        child: Text('game over'.tr(),
            textAlign: TextAlign.center, style: kTitleTS),
      ),
      content: Text('sco: $score | $totalNumberOfQuizzes',
          textAlign: TextAlign.center, style: kContentTS),
      actions: [
        BlocBuilder<GameCubit, GameState>(builder: (context, state) {
          return TextButton(
            onPressed: () {
              if (instance.get<UserGlobal>().onLogin == true) {
                Navigator.pushNamed(context, Routers.homeUser);
              } else {
                Navigator.pushNamed(context, Routers.homeGuest);
              }
            },
            child: Text('exit'.tr(), style: kDialogButtonsTS),
          );
        }),
        BlocBuilder<GameCubit, GameState>(builder: (context, state) {
          return TextButton(
            onPressed: () {
              startGame();
              context.read<GameCubit>().changeDataPlayAgain();
              Navigator.pop(context);
            },
            child: Text('play again'.tr(), style: kDialogButtonsTS),
          );
        }),
      ],
    );
  }
}
