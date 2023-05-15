import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';



import 'package:math/data/model/make_quiz.dart';

class PreQuizTitle extends StatelessWidget {
  final PreQuiz preQuiz;
  const PreQuizTitle(this.preQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: (preQuiz.score ?? 1) < preQuiz.numQ!
              ? colorSystemErrorTer
              : colorBlueQuaternery,
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PRACTICE WITH ${_getMath(preQuiz.sign!.toString())!} MATH",
                  style: GoogleFonts.lato(
                    textStyle: s14f500ColorMainTe,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  " SCORE : ${preQuiz.score ?? 1}",
                  style: GoogleFonts.lato(
                    textStyle: s14f500ColorMainTe,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  " TOTAL QUIZ : ${preQuiz!.numQ}",
                  style: GoogleFonts.lato(
                    textStyle: s14f500ColorMainTe,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: colorMainBlue,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              (preQuiz.score?? 1) == preQuiz.numQ! ? "COMPLETED" : "NOT GOOD",
              style: GoogleFonts.lato(
                textStyle: s14f500ColorGreyTe,
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
