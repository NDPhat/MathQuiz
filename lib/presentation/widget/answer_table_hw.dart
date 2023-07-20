import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';
import 'button_custom.dart';

class AnswerTableHW extends StatefulWidget {
  AnswerTableHW(
      {Key? key,
      required this.quizBrainObject,
      required this.onTap})
      : super(key: key);
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
              top: 4.h,
              left: 10.w,
              right:10.w),
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
                    width: 30.w,
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
                    color: colorMainTealPri,
                    width: 30.w,
                    height: 8.h,
                    child: Text(
                      widget.quizBrainObject.listAnswer[1].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height:5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[2]);
                    },
                    color: colorMainTealPri,
                    width: 30.w,
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
                    color: colorMainTealPri,
                    width: 30.w,
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
        ),
      ],
    );
  }
}
