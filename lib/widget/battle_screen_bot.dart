import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math/logic/quizBrain.dart';
import 'package:math/widget/quiz_body.dart';

import '../cons/color.dart';
import '../cons/text_style.dart';
import 'button_custom.dart';

class BattleScreenBot extends StatefulWidget {
  BattleScreenBot({
    Key? key,
    required this.size,
    required this.quizBrain,
    required this.answerBot,
    required this.level,
    required this.useClick,
    required this.timePerQuiz,
  }) : super(key: key);
  final Size size;
  final QuizBrain quizBrain;
  final String level;
  final bool useClick;
  final int answerBot;
  int timePerQuiz;
  @override
  State<BattleScreenBot> createState() => _BattleScreenBotState();
}

class _BattleScreenBotState extends State<BattleScreenBot> {
  int answerNeed = -100;
  late Timer timer;
  int count = 0;
  late int save = 1;

  @override
  void initState() {
    super.initState();
    save = widget.timePerQuiz;
    _checkAnswer();
  }

  void _checkAnswer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (widget.timePerQuiz == 1) {
          setState(() {
            answerNeed = widget.answerBot;
            timer.cancel();
            count++;
          });
          if (count != 60 / save) {
            _checkAnswer();
          }
        } else {
          if (widget.useClick == true) {
            setState(() {
              timer.cancel();
            });
            print('vao day 2');
            _checkAnswer();
          } else {
            setState(() {
              widget.timePerQuiz--;
            });
          }
        }
      },
    );
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
