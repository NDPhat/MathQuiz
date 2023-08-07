import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/model/user_local.dart';
import 'package:math/main.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/student_data.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/constants.dart';
import '../../../widget/home_card.dart';

class HomeGuestMainScreen extends StatelessWidget {
  const HomeGuestMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMainBlueChart,
      body: Column(
        children: [
          //we will divide the screen into two parts
          //fixed height for first half
          Container(
            width: 100.w,
            height: 40.h,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentName(),
                    kHalfSizedBox,
                    StudentPicture(
                        picAddress:
                            instance.get<UserLocal>().imageLink!.isNotEmpty
                                ? instance.get<UserLocal>().imageLink!
                                : 'assets/images/profile.png'),
                  ],
                ),
                sizedBox,
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                      title: 'attendance'.tr(),
                      value: '90.02%',
                    ),
                    StudentDataCard(
                      title: 'score'.tr(),
                      value: 'B',
                    ),
                  ],
                )
              ],
            ),
          ),

          //other will use all the remaining height of screen
          Expanded(
            child: Container(
              width: 100.w,
              decoration: const BoxDecoration(
                color: colorSystemWhite,
                borderRadius: kTopBorderRadius,
              ),
              child: SingleChildScrollView(
                //for padding
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    kHalfSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          colorBG: colorMainTealPri,
                          onPress: () {
                            Navigator.pushNamed(context, Routers.takeQuiz);
                          },
                          icon: 'assets/icons/quiz.svg',
                          title: 'take quiz'.tr(),
                        ),
                        HomeCard(
                          colorBG: colorErrorPrimary,
                          onPress: () {
                            Navigator.pushNamed(
                                context, Routers.battleMainScreen);
                          },
                          icon: 'assets/icons/assignment.svg',
                          title: 'game'.tr(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          colorBG: colorSystemYeloow,
                          onPress: () {
                            Navigator.pushNamed(
                                context, Routers.dataSheetGuestScreen);
                          },
                          icon: 'assets/icons/datesheet.svg',
                          title: 'history'.tr().toString(),
                        ),
                        HomeCard(
                          colorBG: Colors.purple,
                          onPress: () {
                            Navigator.pushNamed(
                                context, Routers.settingGuestScreen);
                          },
                          icon: 'assets/icons/event.svg',
                          title: 'setting'.tr(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
