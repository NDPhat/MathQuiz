import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/data_sheet_screen/data_sheet_guest/widget/chart_practice_season.dart';
import 'package:math/presentation/screen/data_sheet_screen/data_sheet_guest/widget/chart_test_season.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:math/presentation/widget/line_item_content_card_home.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/color.dart';
import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class DataSheetGuestScreen extends StatelessWidget {
  const DataSheetGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
          onBack: () {
            Navigator.pop(context);
          },
          colorTextAndIcon: Colors.black,
          textNow: 'data sheet'.tr().toString(),
          onPressHome: () {},
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LineContentItem(
                        title: "practice".tr().toString(),
                        icon: const Icon(LineAwesomeIcons.clock),
                        colorBG: colorMainTealPri),
                    const ChartPracSeason(),
                    RoundedButton(
                        press: () {
                          Navigator.pushNamed(context, Routers.historyPra);
                        },
                        color: colorMainTealPri,
                        width: 90.w,
                        height: 8.h,
                        child: const Text('Detail')),
                    LineContentItem(
                        title: "test".tr().toString(),
                        icon: const Icon(Icons.home_work),
                        colorBG: colorMainBlue),
                    const ChartTestSeason(),
                    RoundedButton(
                        press: () {
                          Navigator.pushNamed(context, Routers.historyTest);
                        },
                        color: colorMainBlue,
                        width: 90.w,
                        height: 8.h,
                        child: const Text('Detail')),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
