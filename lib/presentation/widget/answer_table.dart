import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';
import 'button_custom.dart';

class AnswerTable extends StatefulWidget {
  AnswerTable(
      {Key? key,
      required this.size,
      required this.quizBrainObject,
      required this.onTap,
      required this.colorBG})
      : super(key: key);
  final Size size;
  final QuizBrain quizBrainObject;
  final onTap;
  final Color colorBG;
  @override
  State<AnswerTable> createState() => _AnswerTableState();
}

class _AnswerTableState extends State<AnswerTable> {
  bool _Press1 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.colorBG,
      padding: EdgeInsets.only(
          left: widget.size.width * 0.05,
          right: widget.size.width * 0.05,
          top: widget.size.height * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                press: () {
                  // setState(() {
                  //   _Press1 = true;
                  // });
                  widget.onTap(widget.quizBrainObject.listAnswer[0]);
                  // Future.delayed(Duration(seconds: 1), () {
                  //   setState(() {
                  //     _Press1 = false;
                  //   });
                  // });
                },
                color: colorAccentBlue,
                width: widget.size.width * 0.35,
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
                color: colorAccentBlue,
                width: widget.size.width * 0.35,
                height: widget.size.height * 0.08,
                child: Text(
                  widget.quizBrainObject.listAnswer[1].toString(),
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
                press: () {
                  widget.onTap(widget.quizBrainObject.listAnswer[2]);
                },
                color: colorAccentBlue,
                width: widget.size.width * 0.35,
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
                color: colorAccentBlue,
                width: widget.size.width * 0.35,
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
    );
  }
}
