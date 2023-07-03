import 'dart:async';

import 'package:flutter/material.dart';
import '../../application/utils/make_quiz.dart';
import 'package:math/presentation/widget/quiz_body.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

import 'button_custom.dart';

class BotDualScreen extends StatefulWidget {
  BotDualScreen({
    Key? key,
    required this.size,
    required this.quizBrain,
    required this.answerBot,
    required this.level,
    required this.useClick,
    required this.timePerQuizNow,
  }) : super(key: key);
  final Size size;
  final QuizBrain quizBrain;
  final String level;
  final bool useClick;
  final int answerBot;
  int timePerQuizNow;
  @override
  State<BotDualScreen> createState() => _BotDualScreenState();
}

class _BotDualScreenState extends State<BotDualScreen> {
  int answerNeed = -100;
  late Timer timer;
  late int timeNow = 1;

  @override
  void initState() {
    // timeNow = widget.timePerQuizNow;
    super.initState();
    // _checkAnswer();
  }

  // void _checkAnswer() {
  //   const oneSec = const Duration(seconds: 1);
  //   timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (widget.timePerQuizNow == 1) {
  //         setState(() {
  //           answerNeed = widget.answerBot;
  //           timer.cancel();
  //         });
  //       } else {
  //         if (widget.useClick == true) {
  //           setState(() {
  //             timer.cancel();
  //           });
  //           _checkAnswer();
  //         } else {
  //           setState(() {
  //             timeNow--;
  //           });
  //         }
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuizBody(
          size: widget.size,
          quizBrainObject: widget.quizBrain,
        ),
        SizedBox(
          height: widget.size.height * 0.05,
        ),
        Container(
          padding: EdgeInsets.only(
              left: widget.size.width * 0.05,
              right: widget.size.width * 0.05,
              bottom: widget.size.height * 0.02),
          child: Column(
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
                    height: widget.size.height * 0.08,
                    child: Text(
                      widget.quizBrain.listAnswer[0].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.02,
                  ),
                  RoundedButton(
                    press: () {},
                    color: answerNeed == widget.quizBrain.listAnswer[1]
                        ? colorErrorPrimary
                        : colorAccentBlue,
                    width: widget.size.width * 0.35,
                    height: widget.size.height * 0.08,
                    child: Text(
                      widget.quizBrain.listAnswer[1].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.size.height * 0.02,
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
                    height: widget.size.height * 0.08,
                    child: Text(
                      widget.quizBrain.listAnswer[2].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.02,
                  ),
                  RoundedButton(
                    press: () {},
                    color: answerNeed == widget.quizBrain.listAnswer[3]
                        ? colorErrorPrimary
                        : colorAccentBlue,
                    width: widget.size.width * 0.35,
                    height: widget.size.height * 0.08,
                    child: Text(
                      widget.quizBrain.listAnswer[3].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
