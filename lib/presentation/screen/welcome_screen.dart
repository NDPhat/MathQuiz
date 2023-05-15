import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:math/application/cons/color.dart';

import '../../application/cons/constants.dart';
import '../routers/navigation.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Flexible(
              flex: 4,
              child: Image.asset(
                'assets/images/t.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Flexible(
              flex: 3,
              child: AnimatedTextKit(
                  onTap: () {
                    Navigator.pushNamed(context, Routers.chooseOptionUseApp);
                  },
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Tap to Start',
                      textAlign: TextAlign.center,
                      textStyle: kAnimationTextStyle,
                      colors: kColorizeAnimationColors,
                    )
                  ],
                  repeatForever: true),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
