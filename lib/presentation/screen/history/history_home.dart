import 'package:flutter/material.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';

import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

class HistoryHome extends StatelessWidget {
  const HistoryHome({Key? key}) : super(key: key);

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
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/history.jpg'),
            SizedBox(
              height: size.height * 0.16,
            ),
            RoundedButton(
              press: () {
                Navigator.pushNamed(context, Routers.historyPra);
              },
              color: colorBlueQuaternery,
              width: size.width * 0.8,
              height: size.height * 0.06,
              child: const Text(
                'PRACTICE HISTORY',
                style: s20f700ColorErrorPro,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              press: () {
                Navigator.pushNamed(context, Routers.historyTest);
              },
              color: colorBlueQuaternery,
              width: size.width * 0.8,
              height: size.height * 0.06,
              child: const Text(
                'TEST HISTORY',
                style: s20f700ColorErrorPro,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              press: () {
                Navigator.pop(context);
              },
              color: colorBlueQuaternery,
              width: size.width * 0.8,
              height: size.height * 0.06,
              child: const Text(
                'BACK',
                style: s20f700ColorErrorPro,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
