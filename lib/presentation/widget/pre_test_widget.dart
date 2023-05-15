import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/model/test_model.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class PreTestTitle extends StatelessWidget {
  final PreTest preTest;
  const PreTestTitle(this.preTest, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: (preTest.score ?? 0) < (preTest.sumQuiz ?? 0)
              ? colorSystemErrorTer
              : colorBlueQuaternery,
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TEST ${preTest.id!} ",
                  style: GoogleFonts.lato(
                    textStyle: s14f500ColorMainTe,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  " SCORE : ${preTest.score ?? 0}",
                  style: GoogleFonts.lato(
                    textStyle: s14f500ColorMainTe,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  " TOTAL QUIZ : ${preTest.sumQuiz ?? 0}",
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
              ( preTest.score ?? 0 )== (preTest.sumQuiz ?? 0 )? "COMPLETED" : "NOT GOOD",
              style: GoogleFonts.lato(
                textStyle: s14f500ColorGreyTe,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
