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
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: SizedBox(
          height: 13.h,
          child: Row(
            children: [
              SizedBox(
                height: 13.h,
                width: 50.w,
                child: childLeft,
              ),
              Expanded(
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child:  Divider(
                    color: colorBorder,
                    height: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
                width: 20.w,
                child: childRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
