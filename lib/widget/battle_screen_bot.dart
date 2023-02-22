import 'package:flutter/material.dart';
import 'package:math/logic/quizBrain.dart';
import 'package:math/widget/quiz_body.dart';

import '../cons/color.dart';
import '../cons/text_style.dart';
import 'button_custom.dart';

class BattleScreenBot extends StatefulWidget {
  const BattleScreenBot(
      {Key? key,
      required this.size,
      required this.quizBrain,
      required this.onTap,
      required this.answerBot,
      })
      : super(key: key);
  final Size size;
  final QuizBrain quizBrain;
  final onTap;
  final int answerBot;
  @override
  State<BattleScreenBot> createState() => _BattleScreenBotState();
}

class _BattleScreenBotState extends State<BattleScreenBot> {
  int answerNeed = -1;

  @override
  void initState() {

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.8,
      height: widget.size.height * 0.35,
      child: Column(
        children: [
          QuizBody(
            quizBrainObject: widget.quizBrain,
          ),
          SizedBox(
            height: widget.size.height * 0.05,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {},
                    color: answerNeed == widget.quizBrain.listAnswer[0]
                        ? colorErrorPrimary
                        : colorAccentBlue,
                    width: widget.size.width * 0.35,
                    height: widget.size.height * 0.06,
                    child: Text(
                      widget.quizBrain.listAnswer[0].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.05,
                  ),
                  RoundedButton(
                    press: () {},
                    color: answerNeed == widget.quizBrain.listAnswer[1]
                        ? colorErrorPrimary
                        : colorAccentBlue,
                    width: widget.size.width * 0.35,
                    height: widget.size.height * 0.06,
                    child: Text(
                      widget.quizBrain.listAnswer[1].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {},
                    color: answerNeed == widget.quizBrain.listAnswer[2]
                        ? colorErrorPrimary
                        : colorAccentBlue,
                    width: widget.size.width * 0.35,
                    height: widget.size.height * 0.06,
                    child: Text(
                      widget.quizBrain.listAnswer[2].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.05,
                  ),
                  RoundedButton(
                    press: () {},
                    color: answerNeed == widget.quizBrain.listAnswer[3]
                        ? colorErrorPrimary
                        : colorAccentBlue,
                    width: widget.size.width * 0.35,
                    height: widget.size.height * 0.06,
                    child: Text(
                      widget.quizBrain.listAnswer[3].toString(),
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
