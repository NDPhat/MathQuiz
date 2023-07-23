import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import 'dart:math' as math;

class ItemCardHW extends StatelessWidget {
  const ItemCardHW(
      {Key? key,
      required this.childLeft,
      required this.childRight,
      required this.backgroundColor, required this.onTap})
      : super(key: key);
  final Widget childLeft;
  final Widget childRight;
  final Color backgroundColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        child: SizedBox(
          height: 10.h,
          child: Row(
            children: [
              SizedBox(
                width:50.w,
                child: childLeft,
              ),
              Expanded(
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child:  const Divider(
                    color: colorGreyDisable,
                    height:10,
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
      ),
    );
  }
}
