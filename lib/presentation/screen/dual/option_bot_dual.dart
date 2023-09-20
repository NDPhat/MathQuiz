import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/data/model/level_game_bot.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../routers/navigation.dart';
import '../../widget/box_level.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class OptionModeBotDual extends StatelessWidget {
  const OptionModeBotDual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pushNamed(context, Routers.battleMainScreen);
          },
          textNow: "mode".tr(),
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
                    onTap: () {
                      Navigator.pushNamed(context, Routers.battleBOT,
                          arguments: LevelGameBot(level: "easy", time: 5));
                    },
                    imageLink: "assets/images/easy_lv.png",
                    style: GoogleFonts.barlow(
                        fontSize: 20, color: colorMainTealPri),
                    colorBG: colorMainTealPri,
                  ),
                  sizedBox,
                  Level_Box(
                    level: "medium".tr(),
                    imageLink: "assets/images/medium_lv.jpg",
                    style:
                        GoogleFonts.barlow(fontSize: 20, color: colorMainBlue),
                    colorBG: colorMainBlue,
                    onTap: () {
                      Navigator.pushNamed(context, Routers.battleBOT,
                          arguments: LevelGameBot(level: "medium", time: 4));
                    },
                  ),
                  sizedBox,
                  Level_Box(
                    level: "hard".tr(),
                    imageLink: "assets/images/hard_lv.jpg",
                    style: GoogleFonts.barlow(
                        fontSize: 20, color: colorErrorPrimary),
                    colorBG: colorErrorPrimary,
                    onTap: () {
                      Navigator.pushNamed(context, Routers.battleBOT,
                          arguments: LevelGameBot(level: "hard", time: 3));
                    },
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
