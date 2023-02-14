import 'package:flutter/material.dart';

import '../cons/text_style.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double width;
  final double height;
  final Color color, textColor;
  final TextStyle textStyle;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.width,
    required this.height,
    required this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration:  BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style:textStyle
          ),
        ),
      ),
    );
  }
}
