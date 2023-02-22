import 'package:flutter/material.dart';
import 'package:math/logic/quizBrain.dart';
import 'package:math/widget/quiz_body.dart';

import '../cons/color.dart';
import '../cons/text_style.dart';
import 'button_custom.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen(
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
      width: size.width * 0.8,
      height: size.height * 0.35,
      child: Column(
        children: [
          QuizBody(
            quizBrainObject: quizBrain,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      onTap(quizBrain.listAnswer[0]);
                    },
                    color: colorAccentBlue,
                    width: size.width * 0.35,
                    height: size.height * 0.06,
                    child: Text(
                      quizBrain.listAnswer[0].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  RoundedButton(
                    press: () {
                      onTap(quizBrain.listAnswer[1]);
                    },
                    color: colorAccentBlue,
                    width: size.width * 0.35,
                    height: size.height * 0.06,
                    child: Text(
                      quizBrain.listAnswer[1].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      onTap(quizBrain.listAnswer[2]);
                    },
                    color: colorAccentBlue,
                    width: size.width * 0.35,
                    height: size.height * 0.06,
                    child: Text(
                      quizBrain.listAnswer[2].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  RoundedButton(
                    press: () {
                      onTap(quizBrain.listAnswer[3]);
                    },
                    color: colorAccentBlue,
                    width: size.width * 0.35,
                    height: size.height * 0.06,
                    child: Text(
                      quizBrain.listAnswer[3].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
