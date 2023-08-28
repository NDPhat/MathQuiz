import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../application/utils/make_quiz.dart';
import 'button_custom.dart';

class AnswerTableHW extends StatefulWidget {
  AnswerTableHW({Key? key, required this.quizBrainObject, required this.onTap})
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
          padding: EdgeInsets.only(top: 4.h, left: 5.w, right: 5.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[0]);
                    },
                    colorBorder: colorSystemYeloow,
                    color: colorSystemWhite,
                    width: 40.w,
                    height: 8.h,
                    child: Text(widget.quizBrainObject.listAnswer[0].toString(),
                        style: GoogleFonts.aclonica(
                            color: colorSystemYeloow, fontSize: 30)),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  RoundedButton(
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[1]);
                    },
                    colorBorder: colorSystemYeloow,
                    color: colorSystemWhite,
                    width: 40.w,
                    height: 8.h,
                    child: Text(widget.quizBrainObject.listAnswer[1].toString(),
                        style: GoogleFonts.aclonica(
                            color: colorSystemYeloow, fontSize: 30)),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[2]);
                    },
                    colorBorder: colorSystemYeloow,
                    color: colorSystemWhite,
                    width: 40.w,
                    height: 8.h,
                    child: Text(widget.quizBrainObject.listAnswer[2].toString(),
                        style: GoogleFonts.aclonica(
                            color: colorSystemYeloow, fontSize: 30)),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  RoundedButton(
                    press: () {
                      widget.onTap(widget.quizBrainObject.listAnswer[3]);
                    },
                    colorBorder: colorSystemYeloow,
                    color: colorSystemWhite,
                    width: 40.w,
                    height: 8.h,
                    child: Text(widget.quizBrainObject.listAnswer[3].toString(),
                        style: GoogleFonts.aclonica(
                            color: colorSystemYeloow, fontSize: 30)),
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
