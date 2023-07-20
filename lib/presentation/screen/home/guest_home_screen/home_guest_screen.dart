import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/user_local.dart';
import 'package:math/main.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/student_data.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/constants.dart';

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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          studentName:
                              instance.get<UserLocal>().name ?? 'Player 1',
                        ),
                        kHalfSizedBox,
                        const Row(
                          children: [
                            StudentClass(studentClass: 'Class 1'),
                            kHalfSizedBox,
                            StudentYear(studentYear: '2023-2024'),
                          ],
                        )
                      ],
                    ),
                    kHalfSizedBox,
                    StudentPicture(
                      picAddress: instance.get<UserLocal>().imageLink ??
                          'assets/images/profile.png',
                    ),
                  ],
                ),
                sizedBox,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                      title: 'Attendance',
                      value: '90.02%',
                    ),
                    StudentDataCard(
                      title: 'Score',
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
                          onPress: () {
                            Navigator.pushNamed(context, Routers.takeQuiz);
                          },
                          icon: 'assets/icons/quiz.svg',
                          title: 'Take Quiz',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/assignment.svg',
                          title: 'Assignments',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/result.svg',
                          title: 'Result',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/datesheet.svg',
                          title: 'DateSheet',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/event.svg',
                          title: 'Events',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(context, Routers.login);
                          },
                          icon: 'assets/icons/logout.svg',
                          title: 'Log In',
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

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 15.h,
        decoration: BoxDecoration(
          color: colorMainBlueChart,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              color: colorSystemWhite,
            ),
            Text(title,
                textAlign: TextAlign.center, style: s14f500colorSysWhite),
          ],
        ),
      ),
    );
  }
}
