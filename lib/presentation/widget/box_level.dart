import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';

class Level_Box extends StatelessWidget {
  const Level_Box(
      {super.key,
      required this.level,
      required this.style,
      required this.colorBG,
      required this.imageLink,
      required this.onTap});

  final String level;
  final VoidCallback onTap;
  final Color colorBG;
  final String imageLink;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(2.w),
            height: 10.h,
            width: 60.w,
            decoration: BoxDecoration(
                color: colorSystemWhite,
                border: Border.all(color: colorBG),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imageLink,
                  fit: BoxFit.fill,
                  width: 10.w,
                  height: 5.h,
                ),
                Text(level.toUpperCase(), style: style)
              ],
            )));
  }
}
