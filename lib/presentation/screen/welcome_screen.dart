import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/user_api_res.dart';

import '../../application/cons/constants.dart';
import '../../data/model/user_global.dart';
import '../../data/remote/authen/authen.dart';
import '../../main.dart';
import '../routers/navigation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleNavigationLoadApp() async {
      bool isUserSignIn =
          await instance.get<AuthenRepository>().loadHandleAutoLoginApp();
      instance.get<UserGlobal>().onLogin = isUserSignIn;
      // lan dau login -->completeProfile
      if (isUserSignIn == true) {
        String email =
            await instance.get<AuthenRepository>().getMailHandleAutoLoginApp();
        await instance.get<UserAPIRepo>().getUserByEmail(email);
        Navigator.pushNamed(context, Routers.homeUser);
      } else {
        Navigator.pushNamed(context, Routers.chooseOptionUseApp);
      }
    }

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
                    handleNavigationLoadApp();
                  },
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Xin Chào',
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
