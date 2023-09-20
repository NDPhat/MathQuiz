import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/di/event_local.dart';
import 'package:math/data/model/user_local.dart';
import 'package:math/main.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';

import '../../../application/utils/func.dart';

class RecordGuestScreen extends StatefulWidget {
  const RecordGuestScreen({Key? key}) : super(key: key);

  @override
  State<RecordGuestScreen> createState() => _RecordGuestScreenApp();
}

class _RecordGuestScreenApp extends State<RecordGuestScreen> {
  @override
  void initState() {
    super.initState();
    UserEventLocal.getScoreAndJoinForLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPageHomePG(
        textNow: "your trophy".tr(),
        colorTextAndIcon: colorBlackSys,
        onBack: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 5.h),
          width: 100.w,
          height: 90.h,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/trophy_top.png",
                    height: 10.h,
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/trophy_bottom.png",
                    height: 10.h,
                  )),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/trophy_top_right.png",
                    height: 10.h,
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/trophy_bottom_right.png",
                    height: 10.h,
                  )),
              Container(
                height: 70.h,
                width: 100.w,
                padding: EdgeInsets.only(top: 10.h),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/crown.png",
                      height: 20.h,
                    ),
                    Center(
                      child: Container(
                        height: 40.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.w),
                                topRight: Radius.circular(5.w)),
                            border:
                                Border.all(color: colorSystemYeloow, width: 2)),
                        child: Column(
                          children: [
                            Container(
                              width: 90.w,
                              height: 10.h,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: colorSystemYeloow),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "your trophy".tr(),
                                  style: GoogleFonts.abel(
                                      color: colorSystemYeloow,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 2, color: colorSystemYeloow),
                                    ),
                                  ),
                                  width: 44.w,
                                  height: 29.h,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 44.w,
                                        height: 10.h,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 2,
                                                color: colorSystemYeloow),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            instance.get<UserLocal>().name!,
                                            style: GoogleFonts.abel(
                                                color: colorSystemYeloow,
                                                fontSize: 20),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 44.w,
                                        height: 10.h,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 2,
                                                color: colorSystemYeloow),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            findScoreLocal(instance
                                                    .get<UserLocal>()
                                                    .score!)
                                                .toString(),
                                            style: GoogleFonts.abel(
                                                color: colorSystemYeloow,
                                                fontSize: 20),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 44.w,
                                        height: 9.h,
                                        child: Center(
                                          child: Text(
                                            instance
                                                .get<UserLocal>()
                                                .participate
                                                .toString(),
                                            style: GoogleFonts.abel(
                                                color: colorSystemYeloow,
                                                fontSize: 20),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 44.w,
                                  child: instance
                                          .get<UserLocal>()
                                          .imageLink!
                                          .isNotEmpty
                                      ? Image.asset(
                                          instance.get<UserLocal>().imageLink!,
                                          height: 25.h,
                                        )
                                      : Image.asset(
                                          'assets/images/profile.png',
                                          color: colorErrorPrimary,
                                          height: 25.h,
                                        ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
