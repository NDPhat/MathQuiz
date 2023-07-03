import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../setting/widget/setting_widget.dart';

class LightThemeScreen extends StatelessWidget {
  const LightThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SettingMenuWidget(
            title: "Light Mode",
            widget: const Icon(
              LineAwesomeIcons.traffic_light,
              size: 30,
              color: colorSystemYeloow,
            ),
            size: size,
            textStyle: s16f700ColorGreyTe,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
