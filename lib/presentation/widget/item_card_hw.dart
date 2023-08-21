import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import 'dart:math' as math;

class ItemCardHW extends StatelessWidget {
  const ItemCardHW(
      {Key? key,
      required this.childLeft,
      required this.childRight,
      required this.colorBorder,
      required this.onTap})
      : super(key: key);
  final Widget childLeft;
  final Widget childRight;
  final Color colorBorder;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 12.h,
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Row(
          children: [
            SizedBox(
              width: 50.w,
              child: childLeft,
            ),
            Container(
              alignment: Alignment.center,
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 2, color: colorBorder),
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
              child: childRight,
            ),
          ],
        ),
      ),
    );
  }
}
