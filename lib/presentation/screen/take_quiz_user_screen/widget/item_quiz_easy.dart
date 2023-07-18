import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../../application/cons/color.dart';
import '../../../../application/cons/text_style.dart';

class ItemTakeQuizEasy extends StatelessWidget {
  const ItemTakeQuizEasy(
      {super.key,
      required this.onPress,
      required this.bgColor,
      required this.childTop,
      required this.textBot1,
      required this.textBot2});
  final String textBot1, textBot2;
  final VoidCallback onPress;
  final Color bgColor;
  final Widget childTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 42.w,
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: colorErrorPrimary,width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        children: [
          childTop,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textBot1,
                  style: GoogleFonts.cabin(color: colorSystemWhite,fontSize: 16,fontWeight: FontWeight.w700),
                ),
                Text(
                  textBot2,
                  style: GoogleFonts.cabin(color: colorSystemWhite,fontSize: 16,fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
