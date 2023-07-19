import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/item_quiz_easy.dart';
import 'package:sizer/sizer.dart';

import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class TakeQuizHardScreen extends StatelessWidget {
  const TakeQuizHardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPageHomePG(
        textNow: 'Hard quiz',
        onPressHome: () {},
        colorTextAndIcon: Colors.black,
        child: Stack(
          children: [
            Container(
                width: 100.w,
                height: 90.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_take_easy.jpg"),
                      fit: BoxFit.cover),
                )),
            Container(
              alignment: Alignment.center,
              width: 100.w,
              height: 90.h,
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemTakeQuizEasy(
                        bgColor: Colors.yellow,
                        onPress: () {},
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/write.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Puzzle',
                        textBot2: 'number',
                      ),
                      ItemTakeQuizEasy(
                        bgColor: Colors.purpleAccent,
                        onPress: () {},
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/count.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Connect',
                        textBot2: 'number',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemTakeQuizEasy(
                        bgColor: Colors.green,
                        onPress: () {},
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/mix.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Mix',
                        textBot2: 'numbers',
                      ),
                      ItemTakeQuizEasy(
                        bgColor: Colors.pink,
                        onPress: () {},
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/match.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Sentences',
                        textBot2: 'quiz',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
