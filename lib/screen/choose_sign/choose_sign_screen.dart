import 'package:flutter/material.dart';
import 'package:math/cons/color.dart';
import 'package:math/cons/text_style.dart';
import 'package:math/routers/navigation.dart';
import 'package:math/widget/button_custom.dart';

class ChooseSignScreen extends StatelessWidget {
  const ChooseSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            bottom: size.height * 0.05),
        child: Column(
          children: [
            const Text(
              'CHOOSE ONE SIGN',
              style: s30f700colorAccBlue,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 10),
              decoration: const BoxDecoration(
                  color: colorSystemPurpleTertiary,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          RoundedButton(
                            press: () {
                              Navigator.pushNamed(context, Routers.chooseOption,
                                  arguments: '+');
                            },
                            color: colorGreyDisable,
                            width: size.width * 0.35,
                            height: size.height * 0.1,
                            child: Icon(
                              Icons.add_box,
                              size: 60,
                              color: colorMainBlueChart,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          const Text(
                            'ADDITION',
                            style: s20f700ColorGreyte,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Column(
                        children: [
                          RoundedButton(
                            press: () {
                              Navigator.pushNamed(context, Routers.chooseOption,
                                  arguments: '-');
                            },
                            color: colorGreyDisable,
                            width: size.width * 0.35,
                            height: size.height * 0.1,
                            child: Icon(
                              Icons.remove_circle,
                              size: 60,
                              color: colorMainBlueChart,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          const Text(
                            'SUBTRACTION',
                            style: s20f700ColorGreyte,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          RoundedButton(
                            press: () {
                              Navigator.pushNamed(context, Routers.chooseOption,
                                  arguments: 'x');
                            },
                            color: colorGreyDisable,
                            width: size.width * 0.35,
                            height: size.height * 0.1,
                            child: Icon(
                              Icons.close,
                              size: 60,
                              color: colorMainBlueChart,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          const Text(
                            'MULTIPLICATION',
                            style: s20f700ColorGreyte,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Column(
                        children: [
                          RoundedButton(
                            press: () {
                              Navigator.pushNamed(context, Routers.chooseOption,
                                  arguments: '/');
                            },
                            color: colorGreyDisable,
                            width: size.width * 0.35,
                            height: size.height * 0.1,
                            child: Image.asset('assets/images/division.png'),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          const Text(
                            'DIVISION',
                            style: s20f700ColorGreyte,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
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
