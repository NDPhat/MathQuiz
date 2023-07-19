import 'package:flutter/material.dart';
import 'package:math/data/model/level_game_bot.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';

import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/button_custom.dart';

class OptionModeBotDual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: Column(
        children: [
          AppBarWidget(
              textTitle: 'CHOOSE ONE',
              onBack: () {
                Navigator.pop(context);
              }),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.15, bottom: size.height * 0.05),
            child: Center(
              child: Column(
                children: [
                  Level_Box(
                    size: size,
                    time: 5,
                    level: "easy",
                    style: kTitleTSBold,
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Level_Box(
                    size: size,
                    level: "medium",
                    time: 4,
                    style: kTitleTSBold1,
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Level_Box(
                    size: size,
                    level: "hard",
                    time: 3,
                    style: kTitleTSBold2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Level_Box extends StatelessWidget {
  const Level_Box(
      {super.key,
      required this.size,
      required this.level,
      required this.style,
      required this.time});

  final Size size;
  final String level;
  final int time;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routers.battleBOT,
              arguments: LevelGameBot(level: level, time: time));
        },
        child: Container(
            height: size.height * 0.17,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                border: Border.all(color: colorGrayBG),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Center(child: Text(level.toUpperCase(), style: style))));
  }
}
