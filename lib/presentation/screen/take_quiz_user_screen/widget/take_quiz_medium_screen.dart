import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/item_quiz_easy.dart';
import 'package:sizer/sizer.dart';
import '../../../routers/navigation.dart';
import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class TakeQuizMediumScreen extends StatelessWidget {
  const TakeQuizMediumScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPageHomePG(   onBack: () {
        Navigator.pop(context);
      },
        textNow: 'Medium quiz',
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
                          Navigator.pushNamed(context, Routers.chooseOption,
                              arguments: '+');
                        },
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/cong.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Addition',
                        textBot2: 'numbers',
                      ),
                      ItemTakeQuizEasy(
                        bgColor: Colors.purpleAccent,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.chooseOption,
                              arguments: '-');
                        },
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/tru.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Subtraction',
                        textBot2: 'numbers',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemTakeQuizEasy(
                        bgColor: Colors.green,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.chooseOption,
                              arguments: 'x');
                        },
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/nhan.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Multiple',
                        textBot2: 'numbers',
                      ),
                      ItemTakeQuizEasy(
                        bgColor: Colors.pink,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.chooseOption,
                              arguments: '/');
                        },
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/chia.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Division',
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
