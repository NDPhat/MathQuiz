import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';
import 'button_custom.dart';

class AnswerTableHW extends StatefulWidget {
  AnswerTableHW(
      {Key? key,
      required this.size,
      required this.quizBrainObject,
      required this.onTap})
      : super(key: key);
  final Size size;
  final QuizBrain quizBrainObject;
  final onTap;
  @override
  State<AnswerTableHW> createState() => _AnswerTableState();
}

class _AnswerTableState extends State<AnswerTableHW> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: widget.size.height * 0.04,
              left: widget.size.width * 0.1,
              right: widget.size.width * 0.1),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[0]);
                    },
                    color: colorMainTealPri,
                    width: widget.size.width * 0.3,
                    height: widget.size.height * 0.08,
                    child: Text(
                      widget.quizBrainObject.listAnswer[0].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.05,
                  ),
                  RoundedButton(
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[1]);
                    },
                    color: colorMainTealPri,
                    width: widget.size.width * 0.3,
                    height: widget.size.height * 0.08,
                    child: Text(
                      widget.quizBrainObject.listAnswer[1].toString(),
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
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[2]);
                    },
                    color: colorMainTealPri,
                    width: widget.size.width * 0.3,
                    height: widget.size.height * 0.08,
                    child: Text(
                      widget.quizBrainObject.listAnswer[2].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.height * 0.05,
                  ),
                  RoundedButton(
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[3]);
                    },
                    color: colorMainTealPri,
                    width: widget.size.width * 0.3,
                    height: widget.size.height * 0.08,
                    child: Text(
                      widget.quizBrainObject.listAnswer[3].toString(),
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
