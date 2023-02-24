import 'package:flutter/material.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'dart:math' as math;

import 'package:math/domain/home_repo.dart';
import '../../cons/color.dart';
import '../../cons/text_style.dart';
import '../../data/model/test_model.dart';
import '../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeRepo homeRepo =
      HomeRepo(preTestLocalRepo: instance.get<PreTestLocalRepo>());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.school),
          backgroundColor: colorMainBlueChart,
          title: const Text('Math Quiz', style: s30f500colorSysWhite),
        ),
        backgroundColor: colorSystemWhite,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.13),
                child: Transform.rotate(
                    angle: math.pi / 4.5,
                    child: Image.asset(
                      "assets/images/mathtime.png",
                      width: size.width * 0.6,
                    )),
              ),
              Positioned(
                  top: 0,
                  right: 1,
                  child: Transform.rotate(
                    angle: -math.pi / 3,
                    child: const Icon(
                      Icons.calculate,
                      color: colorMainBlue,
                      size: 200,
                    ),
                  )),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                RoundedButton(
                                  press: () {
                                    Navigator.pushNamed(
                                        context, Routers.chooseSign);
                                  },
                                  color: colorSystemPurpleTertiary,
                                  width: size.width * 0.8,
                                  height: size.height * 0.07,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.05,
                                        right: size.width * 0.05,
                                        top: size.width * 0.02,
                                        bottom: size.width * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/practice.png'),
                                        const Text(
                                          'PRACTICE',
                                          style: s16f700ColorBlueMa,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Column(
                              children: [
                                RoundedButton(
                                  press: () {},
                                  color: colorSystemPurpleTertiary,
                                  width: size.width * 0.8,
                                  height: size.height * 0.07,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.05,
                                        right: size.width * 0.05,
                                        top: size.width * 0.02,
                                        bottom: size.width * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/homework.png'),
                                        const Text(
                                          'HOMEWORK',
                                          style: s16f700ColorBlueMa,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Column(
                              children: [
                                RoundedButton(
                                  press: () {
                                    homeRepo.insertPreTest();
                                    Navigator.pushNamed(context, Routers.doTest,
                                        arguments: homeRepo.getLatestPreTest());
                                  },
                                  color: colorSystemPurpleTertiary,
                                  width: size.width * 0.8,
                                  height: size.height * 0.07,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.05,
                                        right: size.width * 0.05,
                                        top: size.width * 0.02,
                                        bottom: size.width * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            'assets/images/testing.png'),
                                        const Text(
                                          'TESTING',
                                          style: s16f700ColorBlueMa,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Column(
                              children: [
                                RoundedButton(
                                  press: () {
                                    Navigator.pushNamed(
                                        context, Routers.battle);
                                  },
                                  color: colorSystemPurpleTertiary,
                                  width: size.width * 0.8,
                                  height: size.height * 0.07,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.05,
                                        right: size.width * 0.05,
                                        top: size.width * 0.02,
                                        bottom: size.width * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset('assets/images/battle.png'),
                                        const Text(
                                          'DUAL',
                                          style: s16f700ColorBlueMa,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
