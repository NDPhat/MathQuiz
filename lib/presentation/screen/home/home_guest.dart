import 'package:flutter/material.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/domain/home_repo.dart';
import 'package:math/main.dart';
import 'dart:math' as math;
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

class HomeGuestScreen extends StatefulWidget {
  HomeGuestScreen({Key? key}) : super(key: key);

  @override
  State<HomeGuestScreen> createState() => _HomeGuestScreenState();
}

class _HomeGuestScreenState extends State<HomeGuestScreen> {
  bool clickingGame = false;
  bool clickingHis = false;
  late PreTestRepo homeRepo;
  @override
  void initState() {
    super.initState();
    homeRepo = PreTestRepo(
        preTestLocalRepo: instance.get<PreTestLocalRepo>(),
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                        width: size.width * 0.5,
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
                    padding: EdgeInsets.only(top: size.height * 0.2),
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
                              RoundedButton(
                                press: () {
                                  setState(() {
                                    if (clickingGame == false) {
                                      setState(() {
                                        clickingGame = true;
                                      });
                                    } else if (clickingGame == true) {
                                      setState(() {
                                        clickingGame = false;
                                      });
                                    }
                                  });
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
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/game_math.png'),
                                          SizedBox(
                                            width: size.width * 0.04,
                                          ),
                                          const Text(
                                            'GAME',
                                            style: s16f700ColorBlueMa,
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        clickingGame
                                            ? Icons.arrow_drop_down_outlined
                                            : Icons.navigate_next,
                                        color: colorMainBlue,
                                        size: 35,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * 0.01,
                                  left: size.width * 0.11,
                                  right: size.width * 0.11,
                                ),
                                child: Visibility(
                                  visible: clickingGame,
                                  child: Center(
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RoundedButton(
                                            press: () {
                                              Navigator.pushNamed(
                                                  context, Routers.chooseSign);
                                            },
                                            color: colorGreyDisable,
                                            width: size.width * 0.36,
                                            height: size.height * 0.05,
                                            child: Image.asset(
                                                'assets/images/practice.png'),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.05,
                                          ),
                                          RoundedButton(
                                            press: () {
                                              Navigator.pushNamed(
                                                  context, Routers.battleMainScreen);
                                            },
                                            color: colorGreyDisable,
                                            width: size.width * 0.36,
                                            height: size.height * 0.05,
                                            child: Image.asset(
                                              'assets/images/battle.png',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              RoundedButton(
                                press: () {
                                  homeRepo.insertPreTest();
                                  Navigator.pushNamed(
                                      context, Routers.doTestPra,
                                      arguments: homeRepo
                                          .getLatestPreTest());
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
                                      Image.asset('assets/images/testing.png'),
                                      const Text(
                                        'TESTING',
                                        style: s16f700ColorBlueMa,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Column(
                                children: [
                                  RoundedButton(
                                    press: () {
                                      setState(() {
                                        if (clickingHis == false) {
                                          setState(() {
                                            clickingHis = true;
                                          });
                                        } else if (clickingHis == true) {
                                          setState(() {
                                            clickingHis = false;
                                          });
                                        }
                                      });
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
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/look_up.png'),
                                              SizedBox(
                                                width: size.width * 0.04,
                                              ),
                                              const Text(
                                                'HISTORY',
                                                style: s16f700ColorBlueMa,
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            clickingHis
                                                ? Icons.arrow_drop_down_outlined
                                                : Icons.navigate_next,
                                            color: colorMainBlue,
                                            size: 35,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: clickingHis,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: size.height * 0.01,
                                          left: size.width * 0.1,
                                          right: size.width * 0.1,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RoundedButton(
                                              press: () {
                                                Navigator.pushNamed(context,
                                                    Routers.historyPra);
                                              },
                                              color: colorGreyDisable,
                                              width: size.width * 0.36,
                                              height: size.height * 0.05,
                                              child: Image.asset(
                                                  'assets/images/practice.png'),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.05,
                                            ),
                                            RoundedButton(
                                              press: () {
                                                Navigator.pushNamed(context,
                                                    Routers.historyTest);
                                              },
                                              color: colorGreyDisable,
                                              width: size.width * 0.36,
                                              height: size.height * 0.05,
                                              child: Image.asset(
                                                'assets/images/testing.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
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
          )),
    );
  }
}
