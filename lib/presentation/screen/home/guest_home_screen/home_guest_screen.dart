import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/model/user_local.dart';
import 'package:math/main.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/student_data.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/utils/func.dart';
import '../../../widget/home_card.dart';

class HomeGuestMainScreen extends StatelessWidget {
  const HomeGuestMainScreen({Key? key}) : super(key: key);

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
                          picAddress: instance.get<UserLocal>().imageLink!),
                    ],
                  ),
                  sizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StudentDataCard(
                        title: 'attendance'.tr(),
                        value: instance.get<UserLocal>().join.toString(),
                      ),
                      StudentDataCard(
                        title: 'score'.tr(),
                        value: findScoreLocal(instance.get<UserLocal>().score!)
                            .toString(),
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
                height: 50.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/home_guest.png',
                      ),
                      fit: BoxFit.cover),
                  color: colorSystemWhite,
                  borderRadius: kTopBorderRadius,
                ),
                child: SingleChildScrollView(
                  //for padding
                  child: Column(
                    children: [
                      kHalfSizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            colorBorder: colorMainTealPri,
                            onPress: () {
                              Navigator.pushNamed(context, Routers.takeQuiz);
                            },
                            icon: 'assets/icons/quiz.svg',
                            title: 'take quiz'.tr(),
                          ),
                          HomeCard(
                            colorBorder: colorErrorPrimary,
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
                            colorBorder: colorSystemYeloow,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Routers.dataSheetGuestScreen);
                            },
                            icon: 'assets/icons/datesheet.svg',
                            title: 'history'.tr().toString(),
                          ),
                          HomeCard(
                            colorBorder: Colors.purple,
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
      ),
    );
  }
}
