import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import '../../data/model/pre_test_model.dart';

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
          border: Border.all(
            color: (preTest.score! / preTest.sumQ!) * 100 > 80
                ? colorMainBlue
                : colorErrorPrimary,
          ),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TEST ${preTest.id!} ",
                  style: GoogleFonts.lato(
                    color: (preTest.score! / preTest.sumQ!) * 100 > 80
                        ? colorMainBlue
                        : colorErrorPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  " SCORE : ${preTest.score ?? 0}",
                  style: GoogleFonts.lato(
                    color: (preTest.score! / preTest.sumQ!) * 100 > 80
                        ? colorMainBlue
                        : colorErrorPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  " TOTAL QUIZ : ${preTest.sumQ ?? 0}",
                  style: GoogleFonts.lato(
                    color: (preTest.score! / preTest.sumQ!) * 100 > 80
                        ? colorMainBlue
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
            color: (preTest.score! / preTest.sumQ!) * 100 > 80
                ? colorMainBlue
                : colorErrorPrimary,
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              (preTest.score ?? 0) == (preTest.sumQ ?? 0)
                  ? "COMPLETED"
                  : "NOT GOOD",
              style: GoogleFonts.lato(
                color: (preTest.score! / preTest.sumQ!) * 100 > 80
                    ? colorMainBlue
                    : colorErrorPrimary,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
