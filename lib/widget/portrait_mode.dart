import 'package:flutter/material.dart';
import 'package:math/cons/color.dart';
import 'package:math/cons/text_style.dart';
import 'package:math/data/model/make_quiz.dart';
import 'package:math/logic/quizBrain.dart';
import 'package:math/widget/button_custom.dart';
import 'package:math/widget/quiz_body.dart';
import 'package:math/widget/reusable_button.dart';
import 'package:math/widget/score_indicators.dart';

import 'cir_per_indicator.dart';

class PortraitMode extends StatefulWidget {
  final highscore;
  final int score;
  final int trueQ, falseQ, totalQ;
  final int quizNow;
  final QuizBrain quizBrainObject;
  final sign;
  final onTap;
  final percentValue;
  final totalTime;

  PortraitMode({
    required this.highscore,
    required this.score,
    required this.trueQ,
    required this.falseQ,
    required this.totalQ,
    required this.quizNow,
    required this.quizBrainObject,
    required this.onTap,
    required this.totalTime,
    required this.percentValue,
    this.sign,
  });
  @override
  State<PortraitMode> createState() => _PortraitModeScreenState();
}

class _PortraitModeScreenState extends State<PortraitMode> {
  bool _Press1 = false;
  bool _Press2 = false;
  bool _Press3 = false;
  bool _Press4 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: colorSystemWhite,
      padding: EdgeInsets.only(
          top: size.height * 0.005,
          bottom: size.height * 0.05,
          left: size.width * 0.05,
          right: size.width * 0.05),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                    color: colorBlueQuaternery,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        children: [
                          const Icon(Icons.update),
                          const SizedBox(
                            height: 10,
                          ),
                          widget.totalQ == 0
                              ? Text(
                                  'Quiz : ${widget.quizNow}',
                                  style: s16f700ColorGreyTe,
                                )
                              : Text(
                                  '${widget.quizNow}/${widget.totalQ}',
                                  style: s16f700ColorGreyTe,
                                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Row(
                        children: [
                          const Text(
                            'Score : ',
                            style: s20f700ColorErrorPro,
                          ),
                          Text(
                            widget.score.toString(),
                            style: s20f700ColorErrorPro,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                  radius: 8,
                                  child: Icon(
                                    Icons.check,
                                    size: 8,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.trueQ.toString(),
                                style: s16f700ColorBlueMa,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                  backgroundColor: colorErrorPrimary,
                                  radius: 8,
                                  child: Icon(
                                    Icons.close,
                                    size: 8,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.falseQ.toString(),
                                style: s16f700ColorError,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: colorSystemWhite,
                  child: CirPerIndicator(
                    percentValue: widget.percentValue,
                    totalTime: widget.totalTime,
                  ),
                ),
              ),
            ],
          ),
          QuizBody(
            quizBrainObject: widget.quizBrainObject,
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Column(
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
                    color: _Press1 ? colorErrorPrimary : colorAccentBlue,
                    width: size.width * 0.38,
                    height: size.height * 0.1,
                    child: Text(
                      widget.quizBrainObject.listAnswer[0].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  RoundedButton(
                    press: () {
                      setState(() {
                        _Press2 = true;
                      });
                      widget.onTap(widget.quizBrainObject.listAnswer[1]);
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _Press2 = false;
                        });
                      });
                    },
                    color: _Press2 ? colorErrorPrimary : colorAccentBlue,
                    width: size.width * 0.38,
                    height: size.height * 0.1,
                    child: Text(
                      widget.quizBrainObject.listAnswer[1].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    press: () {
                      setState(() {
                        _Press3 = true;
                      });
                      widget.onTap(widget.quizBrainObject.listAnswer[2]);
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _Press3 = false;
                        });
                      });
                    },
                    color: _Press3 ? colorErrorPrimary : colorAccentBlue,
                    width: size.width * 0.38,
                    height: size.height * 0.1,
                    child: Text(
                      widget.quizBrainObject.listAnswer[2].toString(),
                      style: s16f700ColorSysWhite,
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.05,
                  ),
                  RoundedButton(
                    press: () {
                      setState(() {
                        _Press4 = true;
                      });
                      widget.onTap(widget.quizBrainObject.listAnswer[3]);
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _Press4 = false;
                        });
                      });
                    },
                    color: _Press4 ? colorErrorPrimary : colorAccentBlue,
                    width: size.width * 0.38,
                    height: size.height * 0.1,
                    child: Text(
                      widget.quizBrainObject.listAnswer[3].toString(),
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
