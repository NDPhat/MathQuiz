import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:math/data/model/option_quiz.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';

import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

class DualMainScreen extends StatelessWidget {
  const DualMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMainBlueChart,
        title: const Text('CHOOSE GAME MODE', style: s22f700ColorGreyPri),
      ),
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.05,
            left: size.width * 0.02,
            right: size.width * 0.02,
            bottom: size.height * 0.05),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/choose.jpg",
                width: size.width * 0.6,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Bounce(
                    duration: Duration(milliseconds: 200),
                    onPressed: () {},
                    child: Image.asset(
                      "assets/images/gamemode.png",
                      width: size.width * 0.3,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: colorSystemPurpleTertiary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: RoundedButton(
                            press: () {
                              Navigator.pushNamed(
                                context,
                                Routers.optionBot,
                              );
                            },
                            color: colorSystemPurpleTertiary,
                            width: size.width * 0.55,
                            height: size.height * 0.15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/robot.png'),
                                const Text(
                                  'ROBOT',
                                  style: s16f700ColorBlueMa,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: colorSystemPurpleTertiary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              RoundedButton(
                                press: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routers.battleHuman,
                                  );
                                },
                                color: colorSystemPurpleTertiary,
                                width: size.width * 0.55,
                                height: size.height * 0.15,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/hmbattle.png'),
                                    const Text(
                                      'PLAYER BATTLE',
                                      style: s16f700ColorBlueMa,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
