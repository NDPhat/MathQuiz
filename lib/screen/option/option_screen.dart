import 'package:flutter/material.dart';
import 'package:math/data/model/option_quiz.dart';
import 'package:math/routers/navigation.dart';

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
        leading: const Icon(Icons.school),
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
      ),
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Padding(
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
              height: size.height * 0.12,
            ),
            Container(
              padding: const EdgeInsets.all(10),
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
                              Navigator.pushNamed(context, Routers.premake,
                                  arguments: OptionQuiz(
                                    sign: sign,
                                    optionQuiz: 'input'
                                  ));
                            },
                            color: colorGreyDisable,
                            width: size.width * 0.35,
                            height: size.height * 0.1,
                            child: Image.asset('assets/images/input.png'),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Text(
                            'INPUT ANSWER',
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
                              Navigator.pushNamed(context, Routers.premake,
                                  arguments: OptionQuiz(
                                      sign: sign,
                                      optionQuiz: 'truefalse'
                                  ));
                            },
                            color: colorGreyDisable,
                            width: size.width * 0.35,
                            height: size.height * 0.1,
                            child: Image.asset('assets/images/truefalse.png'),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Text(
                            'TRUE/FALSE',
                            style: s20f700ColorGreyte,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          RoundedButton(
                            press: () {
                              Navigator.pushNamed(context, Routers.premake,
                                  arguments: OptionQuiz(
                                      sign: sign,
                                      optionQuiz: 'missing'
                                  ));
                            },
                            color: colorGreyDisable,
                            width: size.width * 0.35,
                            height: size.height * 0.1,
                            child: Image.asset('assets/images/missing.png'),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Text(
                            'FIND MISSING',
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
                              Navigator.pushNamed(context, Routers.premake,
                                  arguments: OptionQuiz(
                                      sign: sign,
                                      optionQuiz: 'battle'
                                  ));
                            },
                            color: colorGreyDisable,
                            width: size.width * 0.35,
                            height: size.height * 0.1,
                            child: Image.asset('assets/images/battle.png'),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Text(
                            'DUEL',
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
