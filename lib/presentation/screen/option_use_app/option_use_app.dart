import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/constants.dart';
import '../../../application/di/event_local.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/local/repo/player_local/player_local_repo.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/authen/authen.dart';
import '../../../main.dart';

class OptionUseApp extends StatelessWidget {
  const OptionUseApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    void handleNavigationLoadApp() async {
      bool isUserSignIn =
          await instance.get<AuthenRepository>().loadHandleAutoLoginApp();
      bool isLocalCreate =
          await instance.get<AuthenRepository>().loadHandleLocalAutoLoginApp();

      //handle auto log in
      instance.get<UserGlobal>().onLogin = isUserSignIn;
      //user login
      if (isUserSignIn == true) {
        String email =
            await instance.get<AuthenRepository>().getMailHandleAutoLoginApp();
        await instance.get<UserAPIRepo>().getUserByEmail(email);
        Navigator.pushNamed(context, Routers.homeUser);
      }
      // user local
      else {
        if (isLocalCreate == true) {
          int id = await instance
              .get<AuthenRepository>()
              .getIDLocalHandleAutoLoginApp();
          PlayerLocalEntityData dataLocal =
              await instance.get<PlayerLocalRepo>().getPlayerLocal(id);
          UserEventLocal.updateUserLocal(dataLocal);
          Navigator.pushNamed(context, Routers.homeGuest);
        } else {
          Navigator.pushNamed(context, Routers.addPlayer);
        }
      }
    }

    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_bot.jpg"), fit: BoxFit.fill),
          color: colorSystemWhite,
        ),
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routers.login);
                },
                child: Container(
                    padding: EdgeInsets.only(top: 10.h),
                    width: 80.w,
                    child: Text(
                      "login".tr().toString(),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: colorWaringText,
                          fontSize: 25),
                      textAlign: TextAlign.right,
                    )),
              ),
              SizedBox(
                height: 5.h,
              ),
              Image.asset(
                'assets/images/welcome.png',
                height: 25.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              AnimatedTextKit(
                  onTap: () {
                    handleNavigationLoadApp();
                  },
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'taptostart'.tr().toString(),
                      textAlign: TextAlign.center,
                      textStyle: kAnimationTextStyle,
                      colors: kColorizeAnimationColors,
                    )
                  ],
                  repeatForever: true),
            ],
          ),
        ),
      ),
    );
  }
}
