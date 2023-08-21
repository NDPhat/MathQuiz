import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/model/user_local.dart';
import 'package:math/main.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:sizer/sizer.dart';

import '../../../application/cons/constants.dart';
import '../restart_app/restart_app_widget.dart';

class RecordGuestScreen extends StatelessWidget {
  const RecordGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/bg10.jpg',
              ),
              fit: BoxFit.fill),
        ),
        child: MainPageHomePG(
          textNow: "",
          colorTextAndIcon: colorErrorPrimary,
          onBack: () {
            Navigator.pop(context);
          },
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
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
                      border: Border.all(color: colorSystemWhite)),
                  child: Column(
                    children: [
                      Container(
                        width: 90.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: 2, color: colorSystemWhite),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            instance.get<UserLocal>().name!.toUpperCase(),
                            style: GoogleFonts.abel(
                                color: colorSystemWhite,
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
                                    width: 2, color: colorSystemWhite),
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
                                          width: 2, color: colorSystemWhite),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      instance.get<UserLocal>().name!,
                                      style: GoogleFonts.abel(
                                          color: colorSystemWhite,
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
                                          width: 2, color: colorSystemWhite),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      instance.get<UserLocal>().name!,
                                      style: GoogleFonts.abel(
                                          color: colorSystemWhite,
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
                                      instance.get<UserLocal>().name!,
                                      style: GoogleFonts.abel(
                                          color: colorSystemWhite,
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
                            child:
                                instance.get<UserLocal>().imageLink!.isNotEmpty
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
      ),
    );
  }
}
