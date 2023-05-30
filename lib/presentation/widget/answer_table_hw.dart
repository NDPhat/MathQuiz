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
  bool _Press1 = false;
  bool _Press2 = false;
  bool _Press3 = false;
  bool _Press4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: widget.size.width * 0.015),
      child: Stack(
        children: [
          Image.asset("assets/images/board_hw.png"),
          Padding(
            padding: EdgeInsets.only(
                top: widget.size.height * 0.05,
                left: widget.size.width * 0.15,
                right: widget.size.width * 0.17),
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
                      color: colorGrayBG,
                      width: widget.size.width * 0.25,
                      height: widget.size.height * 0.05,
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
                      color: colorGrayBG,
                      width: widget.size.width * 0.25,
                      height: widget.size.height * 0.05,
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
                      color: colorGrayBG,
                      width: widget.size.width * 0.25,
                      height: widget.size.height * 0.05,
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
                      color: colorGrayBG,
                      width: widget.size.width * 0.25,
                      height: widget.size.height * 0.05,
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
      ),
    );
  }
}
