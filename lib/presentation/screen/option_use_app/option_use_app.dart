import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/widget/button_custom.dart';

import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';

class OptionUseApp extends StatelessWidget {
  const OptionUseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routers.login);
              },
              child: Container(
                  padding: EdgeInsets.only(top: size.height * 0.1),
                  width: size.width * 0.8,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: colorGrayBG,
                        fontSize: 20),
                    textAlign: TextAlign.right,
                  )),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Image.asset('assets/images/bg2.jpg'),
            SizedBox(
              height: size.height * 0.1,
            ),
            AnimatedTextKit(
                onTap: () {
                  Navigator.pushNamed(context, Routers.homeGuest);
                },
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Tap to start ',
                    textAlign: TextAlign.center,
                    textStyle: kAnimationTextStyle,
                    colors: kColorizeAnimationColors,
                  )
                ],
                repeatForever: true),
          ],
        ),
      ),
    );
  }
}
