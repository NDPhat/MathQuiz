import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class ItemTakeQuiz extends StatelessWidget {
  const ItemTakeQuiz(
      {super.key,
      required this.textTitle,
      required this.onPress,
      required this.bgColor});
  final String textTitle;
  final VoidCallback onPress;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 18.h,
        width: 60.w,
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: colorSystemWhite, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(200))),
        child: Center(
          child: Text(
            textTitle.toUpperCase(),
            style: s16f700ColorSysWhite,
          ),
        ),
      ),
    );
  }
}
