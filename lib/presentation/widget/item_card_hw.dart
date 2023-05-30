import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import 'dart:math' as math;

class ItemCardHW extends StatelessWidget {
  const ItemCardHW(
      {Key? key,
      required this.size,
      required this.childLeft,
      required this.childRight,
      required this.backgroundColor, required this.onTap})
      : super(key: key);
  final Size size;
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
          height: size.height * 0.1,
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.5,
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
                width: size.width * 0.2,
                child: childRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
