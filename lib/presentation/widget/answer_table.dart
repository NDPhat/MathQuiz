import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/utils/make_quiz.dart';
import 'button_custom.dart';

class AnswerTable extends StatefulWidget {
  AnswerTable({
    Key? key,
    required this.quizBrainObject,
    required this.onTap,
  }) : super(key: key);
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
      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                colorBorder: colorSystemYeloow,
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
                color: colorSystemWhite,
                width: 35.w,
                height: 8.h,
                child: Text(
                  widget.quizBrainObject.listAnswer[0].toString(),
                  style: GoogleFonts.aclonica(
                      color: colorSystemYeloow, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              RoundedButton(
                colorBorder: colorSystemYeloow,
                press: () {
                  widget.onTap(widget.quizBrainObject.listAnswer[1]);
                },
                color: colorSystemWhite,
                width: 35.w,
                height: 8.h,
                child: Text(
                  widget.quizBrainObject.listAnswer[1].toString(),
                  style: GoogleFonts.aclonica(
                      color: colorSystemYeloow, fontSize: 20),
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
                colorBorder: colorSystemYeloow,
                press: () {
                  widget.onTap(widget.quizBrainObject.listAnswer[2]);
                },
                color: colorSystemWhite,
                width: 35.w,
                height: 8.h,
                child: Text(
                  widget.quizBrainObject.listAnswer[2].toString(),
                  style: GoogleFonts.aclonica(
                      color: colorSystemYeloow, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              RoundedButton(
                colorBorder: colorSystemYeloow,
                press: () {
                  widget.onTap(widget.quizBrainObject.listAnswer[3]);
                },
                color: colorSystemWhite,
                width: 35.w,
                height: 8.h,
                child: Text(
                  widget.quizBrainObject.listAnswer[3].toString(),
                  style: GoogleFonts.aclonica(
                      color: colorSystemYeloow, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
