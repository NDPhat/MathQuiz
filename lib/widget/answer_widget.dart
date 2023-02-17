import 'package:flutter/material.dart';
import 'package:math/cons/color.dart';
import 'package:math/cons/text_style.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget(
      {Key? key,
      required this.size,
      required this.num1,
      required this.num2,
      required this.sign,
      required this.answer,
      required this.answerSelect})
      : super(key: key);
  final Size size;
  final String num1;
  final String num2;
  final String sign;
  final String answer;
  final String answerSelect;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration:  BoxDecoration(
          color:answer==answerSelect ? colorBlueQuaternery : colorSystemErrorTer,
        ),
        padding: EdgeInsets.only(
            left: size.width * 0.02,
            right: size.width * 0.02,
            top: size.height * 0.01,
            bottom: size.height * 0.02),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    backgroundColor: colorSystemWhite,
                    radius: 30,
                    child: answer == answerSelect
                        ? const Icon(
                            (Icons.done),
                            color: colorMainBlue,
                            size: 30,
                          )
                        : const Icon(
                            (Icons.close),
                            color: colorErrorPrimary,
                            size: 30,
                          )),
                Column(
                  children: [
                    Text(
                      "$num1 + $num2 = ",
                      style: s20f700ColorMBlue,
                    ),
                    Text(
                      "Answer = $answer",
                      style: s16f700ColorBlueMa,
                    )
                  ],
                )
              ],
            ),
          ),
          Center(
            child: Text(
              answerSelect,
              style: s20f700ColorMBlue,
            ),
          )
        ]),
      ),
    );
  }
}
