import 'package:flutter/material.dart';
import 'package:math/data/model/option_quiz.dart';
import 'package:math/routers/navigation.dart';
import 'dart:math' as math;

import '../../cons/color.dart';
import '../../cons/text_style.dart';
import '../../widget/button_custom.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sign = ModalRoute.of(context)!.settings.arguments as String;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
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
                  Image.asset(
                    "assets/images/gamemode.png",
                    width: size.width * 0.3,
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
                              Navigator.pushNamed(context, Routers.premake,
                                  arguments: OptionQuiz(
                                      sign: sign, optionQuiz: 'input'));
                            },
                            color: colorSystemPurpleTertiary,
                            width: size.width * 0.55,
                            height: size.height * 0.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/input.png'),
                                const Text(
                                  'INPUT ANSWER',
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
                                  Navigator.pushNamed(context, Routers.premake,
                                      arguments: OptionQuiz(
                                          sign: sign, optionQuiz: 'truefalse'));
                                },
                                color: colorSystemPurpleTertiary,
                                width: size.width * 0.55,
                                height: size.height * 0.06,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/truefalse.png'),
                                    const Text(
                                      'TRUE/FALSE',
                                      style: s16f700ColorBlueMa,
                                    )
                                  ],
                                ),
                              ),
                            ],
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
                                  Navigator.pushNamed(context, Routers.premake,
                                      arguments: OptionQuiz(
                                          sign: sign, optionQuiz: 'missing'));
                                },
                                color: colorSystemPurpleTertiary,
                                width: size.width * 0.55,
                                height: size.height * 0.06,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/missing.png'),
                                    const Text(
                                      'FIND MISSING',
                                      style: s16f700ColorBlueMa,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )), SizedBox(
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

                                },
                                color: colorSystemPurpleTertiary,
                                width: size.width * 0.55,
                                height: size.height * 0.06,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.sync_problem,size: 40,color: colorMainBlue,),
                                    Text(
                                      'LOGIC MATH',
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
