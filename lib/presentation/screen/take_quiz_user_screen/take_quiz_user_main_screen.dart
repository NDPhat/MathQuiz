import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/constants.dart';
import '../../routers/navigation.dart';
import '../../widget/item_take_quiz_widget.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class TakeQuizUserScreen extends StatelessWidget {
  const TakeQuizUserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
        textNow: 'Take quiz',
        onPressHome: () {},
        colorTextAndIcon: Colors.black,
        child: Container(
          width: 100.w,
          height: 80.h,
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 10.h,
                  child: Center(
                      child: Text("SELECT MODE GAME",
                          style: GoogleFonts.abrilFatface(
                              color: colorSystemWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 25))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemTakeQuiz(
                        bgColor: colorMainTealPri,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.takeEasyQuiz);
                        },
                        textTitle: "easy"),
                    sizedBox,
                    ItemTakeQuiz(
                        onPress: () {
                          Navigator.pushNamed(context, Routers.takeMediumQuiz);
                        },
                        bgColor: colorMainBlue,
                        textTitle: "medium"),
                    sizedBox,
                    ItemTakeQuiz(
                      onPress: () {
                        Navigator.pushNamed(context, Routers.takeHardQuiz);
                      },
                      textTitle: 'hard',
                      bgColor: colorErrorPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
