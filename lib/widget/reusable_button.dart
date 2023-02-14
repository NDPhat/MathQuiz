import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../cons/constants.dart';


class ReUsableOutlineButton extends StatelessWidget {
  final userChoice;
  final color;
  final onTap;

  ReUsableOutlineButton({
    @required this.userChoice,
    @required this.color,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: OutlineGradientButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            gradient: LinearGradient(
              colors: kGradientColors,
            ),
            strokeWidth: 12,
            child: Center(
                child: FittedBox(
              child: Text(
                userChoice,
                style: kButtonTextStyle.copyWith(color: color),
              ),
            )),
            elevation: 1,
            radius: Radius.circular(36),
            onTap: () => onTap(userChoice)),
      ),
    );
  }
}
