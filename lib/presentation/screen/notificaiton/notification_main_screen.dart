import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/setting/widget/setting_widget.dart';
import 'package:math/presentation/widget/app_bar.dart';

class LocalNotifiMainScreen extends StatelessWidget {
  const LocalNotifiMainScreen({Key? key}) : super(key: key);

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
            textTitle: 'Notification',
          ),
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.05,
                right: size.width * 0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ENABLE",
                      style: s16f500ColorGreyTe,
                    ),
                    FlutterSwitch(
                      value: true,
                      onToggle: (value) {},
                    ),
                  ],
                ),
                const Visibility(
                    visible: true,
                    child: Column(
                      children: [],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
