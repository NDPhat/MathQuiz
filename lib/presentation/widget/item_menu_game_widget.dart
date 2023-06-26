import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class ItemMenuGame extends StatelessWidget {
  const ItemMenuGame(
      {super.key,
      required this.size,
      required this.child,
      required this.textTitle,
      required this.onPress});
  final Widget child;
  final String textTitle;
  final Size size;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onPress,
          child: Container(
              padding: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.05),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: colorErrorPrimary)),
              child: child),
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: size.height * 0.05),
            child: Text(
              textTitle,
              style: s20f700ColorMBlue,
            )),
      ],
    );
  }
}
