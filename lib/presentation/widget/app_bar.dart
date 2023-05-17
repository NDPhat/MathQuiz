import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.size, required this.onBack})
      : super(key: key);
  final Size size;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorMainBlue,
      width: size.width,
      height: size.height * 0.1,
      alignment: Alignment.centerLeft,
      padding:
          EdgeInsets.only(top: size.height * 0.02, left: size.width * 0.1),
      child: GestureDetector(
          onTap: onBack,
          child: const Icon(
            Icons.keyboard_backspace,
            color: colorSystemWhite,
            size: 30,
          )),
    );
  }
}
