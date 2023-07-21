import 'package:flutter/material.dart';

class BoardItemTakeEasy extends StatelessWidget {
  const BoardItemTakeEasy(
      {Key? key,
      required this.child,
      required this.width,
      required this.height,
      required this.bgColor})
      : super(key: key);

  final Widget child;
  final Color bgColor;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.black)),
      child: child,
    );
  }
}
