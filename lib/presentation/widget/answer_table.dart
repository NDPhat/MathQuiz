import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';
import 'button_custom.dart';

class AnswerTable extends StatefulWidget {
  AnswerTable(
      {Key? key,
      required this.quizBrainObject,
      required this.onTap,
      })
      : super(key: key);
  final QuizBrain quizBrainObject;
  final onTap;
  @override
  State<AnswerTable> createState() => _AnswerTableState();
}

class _AnswerTableState extends State<AnswerTable> {
  bool _Press1 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 5.w,
          right: 5.w,
          top: 5.h),
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
                width: 35.w,
                height: 8.h,
                child: Text(
                  widget.quizBrainObject.listAnswer[0].toString(),
                  style: s16f700ColorSysWhite,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              RoundedButton(
                press: () {
                  widget.onTap(widget.quizBrainObject.listAnswer[1]);
                },
                color: colorAccentBlue,
                width: 35.w,
                height: 8.h,
                child: Text(
                  widget.quizBrainObject.listAnswer[1].toString(),
                  style: s16f700ColorSysWhite,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                press: () {
                  widget.onTap(widget.quizBrainObject.listAnswer[2]);
                },
                color: colorAccentBlue,
                width: 35.w,
                height: 8.h,
                child: Text(
                  widget.quizBrainObject.listAnswer[2].toString(),
                  style: s16f700ColorSysWhite,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              RoundedButton(
                press: () {
                  widget.onTap(widget.quizBrainObject.listAnswer[3]);
                },
                color: colorAccentBlue,
                width: 35.w,
                height: 8.h,
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
