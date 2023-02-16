import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:math/routers/navigation.dart';

import '../cons/constants.dart';
import 'game_screen/game_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static final id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, Routers.home);

        },
        child: Container(
          padding: const EdgeInsets.only(top: 100),
          width: double.infinity,
          child: AbsorbPointer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/t.jpg'),
                const SizedBox(
                  height: 100,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Tap to Start',
                      textAlign: TextAlign.center,
                      textStyle: kAnimationTextStyle,
                      colors: kColorizeAnimationColors,
                    )
                  ],
                  repeatForever: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
