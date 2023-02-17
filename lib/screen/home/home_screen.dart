import 'package:flutter/material.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';

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
        body: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.06,
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/mathquiz.png'),
              SizedBox(
                height: size.height * 0.06,
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
                                Navigator.pushNamed(
                                    context, Routers.historyHome);
                              },
                              color: colorGreyDisable,
                              width: size.width * 0.32,
                              height: size.height * 0.1,
                              child: Image.asset('assets/images/history.png'),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              'HISTORY',
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
                                Navigator.pushNamed(
                                    context, Routers.chooseSign);
                              },
                              color: colorGreyDisable,
                              width: size.width * 0.32,
                              height: size.height * 0.1,
                              child: Image.asset('assets/images/practice.png'),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              'PRACTICE',
                              style: s20f700ColorGreyte,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            RoundedButton(
                              press: () {},
                              color: colorGreyDisable,
                              width: size.width * 0.32,
                              height: size.height * 0.1,
                              child: Image.asset('assets/images/homework.png'),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              'HOMEWORK',
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
                                homeRepo.insertPreTest();
                                Navigator.pushNamed(context, Routers.doTest,
                                    arguments: homeRepo.getLatestPreTest());
                              },
                              color: colorGreyDisable,
                              width: size.width * 0.32,
                              height: size.height * 0.1,
                              child: Image.asset('assets/images/testing.png'),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            const Text(
                              'TESTING',
                              style: s20f700ColorGreyte,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
