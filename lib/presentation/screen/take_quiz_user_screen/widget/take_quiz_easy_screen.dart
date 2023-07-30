import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/item_quiz_easy.dart';
import 'package:sizer/sizer.dart';

import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class TakeQuizEasyScreen extends StatelessWidget {
  const TakeQuizEasyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPageHomePG(   onBack: () {
        Navigator.pop(context);
      },
        textNow: 'Easy quiz',
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
                        onPress: () {
                          Navigator.pushNamed(context, Routers.writeNumGame);
                        },
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
                        textBot1: 'Write',
                        textBot2: 'numbers',
                      ),
                      ItemTakeQuizEasy(
                        bgColor: Colors.purpleAccent,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.writeAndCountNumGame);
                        },
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
                        textBot1: 'Count and',
                        textBot2: 'write',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemTakeQuizEasy(
                        bgColor: Colors.green,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.writeMissing);
                        },
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/write_missing.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Write missing',
                        textBot2: 'numbers',
                      ),
                      ItemTakeQuizEasy(
                        bgColor: Colors.pink,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.matchNumber);
                        },
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
                        textBot1: 'Match',
                        textBot2: 'numbers',
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
