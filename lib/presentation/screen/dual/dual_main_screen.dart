import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/box_level.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class DualMainScreen extends StatelessWidget {
  const DualMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: colorSystemWhite,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/batlle_game_bg.jpg"),
                fit: BoxFit.fill),
            color: colorSystemWhite,
          ),
          child: MainPageHomePG(
            onBack: () {
              if (instance.get<UserGlobal>().onLogin == true) {
                Navigator.pushNamed(context, Routers.homeUser);
              } else {
                Navigator.pushNamed(context, Routers.homeGuest);
              }
            },
            textNow: "battle game".tr(),
            onPressHome: () {},
            colorTextAndIcon: colorBlackSys,
            child: Container(
              alignment: Alignment.center,
              width: 100.w,
              height: 80.h,
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Level_Box(
                        level: "bot".tr(),
                        onTap: () {
                          Navigator.pushNamed(context, Routers.optionBot);
                        },
                        imageLink: "assets/images/bee_bot.png",
                        style: GoogleFonts.barlow(
                            fontSize: 20, color: colorMainBlue),
                        colorBG: colorMainBlue,
                      ),
                      sizedBox,
                      Level_Box(
                        level: "player".tr(),
                        onTap: () {
                          Navigator.pushNamed(context, Routers.battleHuman);
                        },
                        imageLink: "assets/images/medium_lv.jpg",
                        style: GoogleFonts.barlow(
                            fontSize: 20, color: colorMainBlue),
                        colorBG: colorMainBlue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
