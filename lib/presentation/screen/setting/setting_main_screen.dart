import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/setting/widget/setting_widget.dart';
import 'package:math/presentation/widget/app_bar.dart';

import '../../routers/navigation.dart';
import '../profile_user/my_account/profile_menu_widget.dart';

class SettingMainScreen extends StatelessWidget {
  const SettingMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: 'setting'.tr().toString(),
          ),
          SizedBox(height: size.height * 0.1),
          SettingMenuWidget(
            title: "mode".tr().toString(),
            widget: const Icon(
              LineAwesomeIcons.modx,
              size: 30,
              color: colorSystemYeloow,
            ),
            size: size,
            textStyle: s16f700ColorGreyTe,
            onPress: () {},
          ),
          SizedBox(height: size.height * 0.03),
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
            size: size,
            textStyle: s16f700ColorGreyTe,
          ),
          SizedBox(height: size.height * 0.03),
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
            size: size,
            textStyle: s16f700ColorGreyTe,
          )
        ],
      ),
    );
  }
}
