import 'package:flutter/material.dart';

import '../../cons/color.dart';
import '../../cons/text_style.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

class DuelScreen extends StatefulWidget {
  const DuelScreen({Key? key}) : super(key: key);

  @override
  State<DuelScreen> createState() => _DuelScreenState();
}

class _DuelScreenState extends State<DuelScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.school),
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.1,
            left: size.width * 0.1,
            right: size.width * 0.05,
            bottom: size.height * 0.1),
        child: Column(
          children: [
            const Text(
              'CHOOSE ONE MODE',
              style: s30f700colorAccBlue,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Column(
              children: [
                RoundedButton(
                  press: () {
                    Navigator.pushNamed(context, Routers.optionBot);
                  },
                  color: colorGreyDisable,
                  width: size.width * 0.8,
                  height: size.height * 0.25,
                  child: Image.asset('assets/images/robot.png'),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                RoundedButton(
                  press: () {
                    Navigator.pushNamed(context, Routers.battleHuman);
                  },
                  color: colorGreyDisable,
                  width: size.width * 0.8,
                  height: size.height * 0.25,
                  child: Image.asset(
                    'assets/images/hmbattle.png',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
