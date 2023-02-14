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
      appBar: AppBar(
        leading: const Icon(Icons.school),
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: size.height * 0.1,
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.1),
        child: Column(
          children: [
            const Text(
              'Choose any one',
              style: s30f700colorAccBlue,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedButton(
                  text: '+',
                  press: () {
                    Navigator.pushNamed(context, Routers.premake,arguments:'+' );
                  },
                  color: colorBlueQuaternery,
                  textColor: colorSystemWhite,
                  width: size.width * 0.4,
                  height: size.height * 0.15,
                  textStyle: s60BoldColorSysWhite,
                ),
                RoundedButton(
                    text: '-',
                    press: () {
                      Navigator.pushNamed(context, Routers.premake,arguments:'-' );

                    },
                    color: colorBlueQuaternery,
                    textColor: colorSystemWhite,
                    width: size.width * 0.4,
                    height: size.height * 0.15,
                    textStyle: s60BoldColorSysWhite),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedButton(
                  text: 'x',
                  press: () {
                    Navigator.pushNamed(context, Routers.premake,arguments:'x' );

                  },
                  color: colorBlueQuaternery,
                  textColor: colorSystemWhite,
                  width: size.width * 0.4,
                  height: size.height * 0.15,
                  textStyle: s60BoldColorSysWhite,
                ),
                RoundedButton(
                    text: '/',
                    press: () {
                      Navigator.pushNamed(context, Routers.premake,arguments:'/' );

                    },
                    color: colorBlueQuaternery,
                    textColor: colorSystemWhite,
                    width: size.width * 0.4,
                    height: size.height * 0.15,
                    textStyle: s60BoldColorSysWhite),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            RoundedButton(
                text: ' Back',
                press: () {},
                color: colorBlueQuaternery,
                textColor: colorSystemWhite,
                width: size.width * 0.4,
                height: size.height * 0.06,
                textStyle: s30f700colorAccBlue),
          ],
        ),
      ),
    );
  }
}
