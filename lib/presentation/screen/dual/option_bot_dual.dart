import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/data/model/level_game_bot.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../routers/navigation.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class OptionModeBotDual extends StatelessWidget {
  const OptionModeBotDual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
        onBack: () {
          Navigator.pop(context);
        },
        textNow: "battle game".tr(),
        onPressHome: () {},
        colorTextAndIcon: Colors.black,
        child: Container(
          width: 100.w,
          height: 80.h,
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100.w,
                height: 10.h,
                child: Center(
                    child: Text("SELECT MODE GAME".tr(),
                        style: GoogleFonts.abrilFatface(
                            color: colorSystemWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 25))),
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Level_Box(
                    level: "easy".tr(),
                    time: 5,
                    style: kTitleTSBold1,
                    colorBG: colorMainTealPri,
                  ),
                  sizedBox,
                  Level_Box(
                    level: "medium".tr(),
                    time: 4,
                    style: kTitleTSBold1,
                    colorBG: colorMainBlue,
                  ),
                  sizedBox,
                  Level_Box(
                    level: "hard".tr(),
                    time: 3,
                    style: kTitleTSBold1,
                    colorBG: colorErrorPrimary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Level_Box extends StatelessWidget {
  const Level_Box(
      {super.key,
      required this.level,
      required this.style,
      required this.time,
      required this.colorBG});

  final String level;
  final int time;
  final Color colorBG;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routers.battleBOT,
              arguments: LevelGameBot(level: level, time: time));
        },
        child: Container(
            height: 17.h,
            width: 80.w,
            decoration: BoxDecoration(
                color: colorBG,
                border: Border.all(color: colorGrayBG),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Center(child: Text(level.toUpperCase(), style: style))));
  }
}
