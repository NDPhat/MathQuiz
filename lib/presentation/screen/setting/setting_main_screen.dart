import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/constants.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/setting/widget/setting_widget.dart';
import 'package:sizer/sizer.dart';
import '../../routers/navigation.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class SettingMainScreen extends StatelessWidget {
  const SettingMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPageHomePG(
        onBack: () {
          Navigator.pop(context);
        },
        colorTextAndIcon: Colors.black,
        textNow: 'setting'.tr().toString(),
        onPressHome: () {},
        child: Column(
          children: [
            sizedBox,
            SettingMenuWidget(
              title: "mode".tr().toString(),
              widget: const Icon(
                LineAwesomeIcons.modx,
                size: 30,
                color: colorSystemYeloow,
              ),
              textStyle: s16f700ColorGreyTe,
              onPress: () {},
            ),
            SizedBox(height: 5.h),
            SettingMenuWidget(
              title: "localnotifi".tr().toString(),
              widget: const Icon(
                LineAwesomeIcons.bell,
                size: 30,
                color: colorErrorPrimary,
              ),
              onPress: () {
                Navigator.pushNamed(context, Routers.notifiScreen);
              },
              textStyle: s16f700ColorGreyTe,
            ),
            SizedBox(height: 5.h),
            SettingMenuWidget(
              title: "language".tr().toString(),
              widget: const Icon(
                LineAwesomeIcons.language,
                size: 30,
                color: colorMainBlue,
              ),
              onPress: () {
                Navigator.pushNamed(context, Routers.languageScreen);
              },
              textStyle: s16f700ColorGreyTe,
            )
          ],
        ),
      ),
    );
  }
}
