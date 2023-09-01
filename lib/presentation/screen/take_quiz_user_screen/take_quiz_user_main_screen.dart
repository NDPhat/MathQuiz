import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/constants.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/box_level.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class TakeQuizUserScreen extends StatelessWidget {
  const TakeQuizUserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/batlle_game_bg.jpg"),
                fit: BoxFit.fill),
          ),
          child: MainPageHomePG(
            onBack: () {
              if (instance.get<UserGlobal>().onLogin == true) {
                Navigator.pushNamed(context, Routers.homeUser);
              } else {
                Navigator.pushNamed(context, Routers.homeGuest);
              }
            },
            textNow: 'practice'.tr(),
            onPressHome: () {},
            colorTextAndIcon: Colors.black,
            child: Container(
              width: 100.w,
              height: 90.h,
              alignment: Alignment.center,
              child: Container(
                width: 90.w,
                height: 40.h,
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Level_Box(
                      level: "easy".tr(),
                      imageLink: "assets/images/easy_lv.png",
                      style: GoogleFonts.barlow(
                          fontSize: 20, color: colorMainTealPri),
                      colorBG: colorMainTealPri,
                      onTap: () {
                        Navigator.pushNamed(context, Routers.takeEasyQuiz);
                      },
                    ),
                    sizedBox,
                    Level_Box(
                      level: "medium".tr(),
                      onTap: () {
                        Navigator.pushNamed(context, Routers.takeMediumQuiz);
                      },
                      imageLink: "assets/images/medium_lv.jpg",
                      style: GoogleFonts.barlow(
                          fontSize: 20, color: colorMainBlue),
                      colorBG: colorMainBlue,
                    ),
                    sizedBox,
                    Level_Box(
                      level: "hard".tr(),
                      onTap: () {
                        Navigator.pushNamed(context, Routers.takeHardQuiz);
                      },
                      imageLink: "assets/images/hard_lv.jpg",
                      style: GoogleFonts.barlow(
                          fontSize: 20, color: colorErrorPrimary),
                      colorBG: colorErrorPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
