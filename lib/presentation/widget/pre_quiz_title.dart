import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

import 'package:math/data/model/make_quiz.dart';

class PreQuizTitle extends StatelessWidget {
  final PreQuizGame preQuiz;
  const PreQuizTitle(this.preQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 100.w,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: (preQuiz.score! / preQuiz.numQ!) * 100 > 80
                ? colorMainTealPri
                : colorErrorPrimary,
          ),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PRACTICE WITH ${_getMath(preQuiz.sign!.toString())!} MATH",
                  style: GoogleFonts.lato(
                    color: (preQuiz.score! / preQuiz.numQ!) * 100 > 80
                        ? colorMainTealPri
                        : colorErrorPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  " SCORE : ${preQuiz.score ?? 1}",
                  style: GoogleFonts.lato(
                    color: (preQuiz.score! / preQuiz.numQ!) * 100 > 80
                        ? colorMainTealPri
                        : colorErrorPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  " TOTAL QUIZ : ${preQuiz!.numQ}",
                  style: GoogleFonts.lato(
                    color: (preQuiz.score! / preQuiz.numQ!) * 100 > 80
                        ? colorMainTealPri
                        : colorErrorPrimary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: (preQuiz.score! / preQuiz.numQ!) * 100 > 80
                ? colorMainTealPri
                : colorErrorPrimary,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              (preQuiz.score! / preQuiz.numQ!) * 100 > 80
                  ? "COMPLETED"
                  : "NOT GOOD",
              style: GoogleFonts.lato(
                color: (preQuiz.score! / preQuiz.numQ!) * 100 > 80
                    ? colorMainTealPri
                    : colorErrorPrimary,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _getMath(String sign) {
    switch (sign) {
      case "+":
        return "ADDITION";
      case "-":
        return "SUBTRACTION";
      case "x":
        return "MULTIPLICATION";
      case "/":
        return "DIVISION";
    }
  }
}
