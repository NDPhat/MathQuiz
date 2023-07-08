import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/presentation/widget/app_bar.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../setting/widget/setting_widget.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            size: size,
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: "language".tr().toString(),
          ),
          SettingMenuWidget(
            title: "vietnamese".tr().toString(),
            widget: const Icon(
              LineAwesomeIcons.language,
              size: 30,
              color: colorSystemYeloow,
            ),
            size: size,
            textStyle: s16f700ColorGreyTe,
            onPress: () {
              setState(() {
                EasyLocalization.of(context)!
                    .setLocale(Locale("vi", "VI"));              });
            },
          ),
          SettingMenuWidget(
            title: "english".tr().toString(),
            widget: const Icon(
              LineAwesomeIcons.language,
              size: 30,
              color: colorSystemYeloow,
            ),
            size: size,
            textStyle: s16f700ColorGreyTe,
            onPress: () {
              EasyLocalization.of(context)!
                  .setLocale(Locale("en", "EN"));            },
          ),
        ],
      ),
    );
  }
}
