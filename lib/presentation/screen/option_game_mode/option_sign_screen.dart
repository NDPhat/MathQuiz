import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:math/data/model/option_quiz.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';

import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/button_custom.dart';

class OptionSignScreen extends StatelessWidget {
  const OptionSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBarWidget(
              size: size,
              onBack: () {
                Navigator.pop(context);
              }),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.02,
              right: size.width * 0.02,
            ),
            child: Center(
              child: Column(
                children: [

                  Image.asset(
                    "assets/images/picone.png",
                    width: size.width * 0.6,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bounce(
                          duration: const Duration(milliseconds: 200),
                          onPressed: () {},
                          child: const Icon(
                            Icons.calculate_outlined,
                            color: colorMainBlue,
                            size: 120,
                          )),
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
                                  Navigator.pushNamed(context, Routers.chooseOption,
                                      arguments: '+');
                                },
                                color: colorSystemPurpleTertiary,
                                width: size.width * 0.55,
                                height: size.height * 0.06,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Icon(
                                        Icons.add,
                                        color: colorMainBlue,
                                        size: 28,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        'ADDITION',
                                        style: s16f700ColorBlueMa,
                                      ),
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
                                          context, Routers.chooseOption,
                                          arguments: '-');
                                    },
                                    color: colorSystemPurpleTertiary,
                                    width: size.width * 0.55,
                                    height: size.height * 0.06,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.remove,
                                          color: colorMainBlue,
                                          size: 28,
                                        ),
                                        Text(
                                          'SUBTRACTION',
                                          style: s16f700ColorBlueMa,
                                        ),
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
                                      Navigator.pushNamed(
                                          context, Routers.chooseOption,
                                          arguments: 'x');
                                    },
                                    color: colorSystemPurpleTertiary,
                                    width: size.width * 0.55,
                                    height: size.height * 0.06,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.close,
                                          color: colorMainBlue,
                                          size: 28,
                                        ),
                                        Text(
                                          'ADDITION',
                                          style: s16f700ColorBlueMa,
                                        ),
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
                                      Navigator.pushNamed(
                                          context, Routers.chooseOption,
                                          arguments: '/');
                                    },
                                    color: colorSystemPurpleTertiary,
                                    width: size.width * 0.55,
                                    height: size.height * 0.06,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset("assets/images/divide.png"),
                                        const Text(
                                          'DIVISION',
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
        ],
      ),
    );
  }
}
