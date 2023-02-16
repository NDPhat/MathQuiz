import 'package:flutter/material.dart';
import 'package:math/cons/color.dart';
import 'package:math/cons/text_style.dart';
import 'package:math/routers/navigation.dart';
import 'package:math/widget/button_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.1,
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/mathquiz.png'),
             SizedBox(
              height: size.height*0.15,
            ),
            RoundedButton(
                text: 'HISTORY',
                press: () {},
                color: colorBlueQuaternery,
                width: size.width * 0.8,
                height: size.height * 0.06,
                textStyle: s20f700ColorErrorPro),
            SizedBox(
              height: size.height*0.03,
            ),
            RoundedButton(
                text: 'PRACTICE',
                press: () {
                  Navigator.pushNamed(context, Routers.chooseSign);
                },
                color: colorBlueQuaternery,
                width: size.width * 0.8,
                height: size.height * 0.06,
                textStyle: s20f700ColorErrorPro),  SizedBox(
              height: size.height*0.03,
            ),
            RoundedButton(
                text: 'DO TEST',
                press: () {
                  Navigator.pushNamed(context, Routers.doTest);
                },
                color: colorBlueQuaternery,
                width: size.width * 0.8,
                height: size.height * 0.06,
                textStyle: s20f700ColorErrorPro),
          ],
        ),
      ),
    );
  }
}
