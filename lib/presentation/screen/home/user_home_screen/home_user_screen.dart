import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/student_data.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/constants.dart';
import '../../../widget/home_card.dart';

class HomeUserScreen extends StatelessWidget {
  const HomeUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: colorSystemYeloow,
        body: Column(
          children: [
            //we will divide the screen into two parts
            //fixed height for first half
            Container(
              width: 100.w,
              height: 35.h,
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const StudentName(),
                          kHalfSizedBox,
                          Row(
                            children: [
                              StudentClass(studentClass: '${'class'.tr()} 1A'),
                              kHalfSizedBox,
                              const StudentYear(studentYear: '2023-2024'),
                            ],
                          )
                        ],
                      ),
                      kHalfSizedBox,
                      StudentPicture(
                        picAddress: 'assets/images/profile.png',
                      ),
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
                padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                width: 100.w,
                height: 65.h,
                decoration:  const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/home_user.jpg',
                      ),
                      fit: BoxFit.fill),
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
                            title: 'take quiz'.tr().toString(),
                            colorBorder: colorMainBlueChart,
                          ),
                          HomeCard(
                            colorBorder: colorErrorPrimary,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Routers.assignmentMainScreen);
                            },
                            icon: 'assets/icons/assignment.svg',
                            title: 'assignment'.tr().toString(),
                          ),
                        ],
                      ),
                      sizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            colorBorder: colorMainTealPri,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Routers.battleMainScreen);
                            },
                            icon: 'assets/icons/result.svg',
                            title: 'game'.tr().toString(),
                          ),
                          HomeCard(
                            colorBorder: colorSystemYeloow,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Routers.dataSheetScreen);
                            },
                            icon: 'assets/icons/datesheet.svg',
                            title: 'data sheet'.tr().toString(),
                          ),
                        ],
                      ),
                      sizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            colorBorder: Colors.pink,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Routers.settingScreen);
                            },
                            icon: 'assets/icons/event.svg',
                            title: 'setting'.tr().toString(),
                          ),
                          HomeCard(
                            colorBorder: Colors.orange,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Routers.profileScreen);
                            },
                            icon: 'assets/icons/resume.svg',
                            title: 'profile'.tr().toString(),
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
      ),
    );
  }
}
