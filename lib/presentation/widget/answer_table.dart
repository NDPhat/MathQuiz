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
      required this.onTap})
      : super(key: key);
  final Size size;
  final QuizBrain quizBrainObject;
  final onTap;
  @override
  State<AnswerTable> createState() => _AnswerTableState();
}

class _AnswerTableState extends State<AnswerTable> {
  bool _Press1 = false;
  bool _Press2 = false;
  bool _Press3 = false;
  bool _Press4 = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                press: () {
                  setState(() {
                    _Press1 = true;
                  });
                  widget.onTap(widget.quizBrainObject.listAnswer[0]);
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      _Press1 = false;
                    });
                  });
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
                  setState(() {
                    _Press1 = true;
                  });
                  widget.onTap(widget.quizBrainObject.listAnswer[1]);
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      _Press2 = false;
                    });
                  });
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
            height: widget.size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                press: () {
                  setState(() {
                    _Press1 = true;
                  });
                  widget.onTap(widget.quizBrainObject.listAnswer[2]);
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      _Press3 = false;
                    });
                  });
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
                  setState(() {
                    _Press1 = true;
                  });
                  widget.onTap(widget.quizBrainObject.listAnswer[3]);
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      _Press4 = false;
                    });
                  });
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
