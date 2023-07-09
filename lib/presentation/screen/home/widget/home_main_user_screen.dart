import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';
import 'package:math/presentation/widget/card_data_item_home.dart';
import '../../../../application/cons/color.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../../data/remote/model/pre_quiz_game_response.dart';
import '../../../../data/remote/model/result_quiz_hw_response.dart';
import '../../../../main.dart';
import '../../../widget/child_right_home_practices_input.dart';
import '../../../widget/child_right_item_card_home.dart';
import '../../../widget/line_item_content_card_home.dart';

class HomeMainUserScreen extends StatelessWidget {
  HomeMainUserScreen({Key? key, required this.size});
  Size size;

  @override
  Widget build(BuildContext context) {
    return HomeUserBG(
        textNow: 'home'.tr().toString(),
        size: size,
        child: Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          bottom: size.height * 0.02,
                          right: size.height * 0.03,
                          left: size.height * 0.03),
                      height: size.height * 0.2,
                      width: size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/bg_card_home.png"),
                              fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Always remember :",
                                  style: s18f700ColorWhiteSys)),
                          Container(
                              padding: EdgeInsets.only(top: size.height * 0.02),
                              width: size.width,
                              child: const Text(
                                  "Without mathematics, there’s nothing you can do.\nEverything around you is mathematics.\nEverything around you is numbers.",
                                  style: s15f700ColorErrorPri)),
                        ],
                      )),
                  LineContentItem(
                    size: size,
                    title: 'home work'.tr().toString(),
                    icon: const Icon(LineAwesomeIcons.book),
                  ),
                  FutureBuilder<List<ResultQuizHWAPIModel>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlResultQuizHWByUserID(
                              instance.get<UserGlobal>().id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.3,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: colorMainBlue,
                                strokeWidth: 5,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          return ItemAsyncDataPageHome(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routers.hwcardDetail);
                              },
                              size: size,
                              textTitle: 'HOME WORK',
                              totalQ: totalQ.toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                type: "hw",
                                size: size,
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        } else {
                          return Container();
                        }
                      }),
                  LineContentItem(
                    size: size,
                    title: 'practice'.tr().toString(),
                    icon: const Icon(Icons.dashboard),
                  ),
                  FutureBuilder<List<PreQuizGameAPIModel>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlPreQuizGameByUidandOptionGame(
                              instance.get<UserGlobal>().id.toString(),
                              "input"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.3,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: colorMainBlue,
                                strokeWidth: 5,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          return ItemAsyncDataPageHome(
                            size: size,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routers.practicecardDetail,
                                  arguments: "input");
                            },
                            textTitle: 'INPUT',
                            totalQ: totalQ.toString(),
                            trueAve:
                                ((score / totalQ) * 100).toStringAsFixed(2),
                            childRight: ChildRightHomeInput(
                              size: size,
                              typeGame: "input",
                            ),
                            timeNow: DateFormat.yMMMEd().format(DateTime.now()),
                          );
                        }
                        return Container();
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  FutureBuilder<List<PreQuizGameAPIModel>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlPreQuizGameByUidandOptionGame(
                              instance.get<UserGlobal>().id.toString(),
                              "truefalse"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.3,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: colorMainBlue,
                                strokeWidth: 5,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          return ItemAsyncDataPageHome(
                              size: size,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routers.practicecardDetail,
                                    arguments: "truefalse");
                              },
                              textTitle: 'TRUE FALSE',
                              totalQ: totalQ.toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHomeInput(
                                size: size,
                                typeGame: "truefalse",
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  FutureBuilder<List<PreQuizGameAPIModel>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlPreQuizGameByUidandOptionGame(
                              instance.get<UserGlobal>().id.toString(),
                              "missing"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.3,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: colorMainBlue,
                                strokeWidth: 5,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          return ItemAsyncDataPageHome(
                              size: size,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routers.practicecardDetail,
                                    arguments: "missing");
                              },
                              textTitle: 'MISSING',
                              totalQ: totalQ.toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHomeInput(
                                size: size,
                                typeGame: "missing",
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  LineContentItem(
                    size: size,
                    title: 'test'.tr().toString(),
                    icon: const Icon(Icons.task),
                  ),
                  FutureBuilder<List<PreTestAPIRes>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlPreQuizTestByUid(
                              instance.get<UserGlobal>().id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.3,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: colorMainBlue,
                                strokeWidth: 5,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.sumQ!;
                            score = score + element.score!;
                          }
                          return ItemAsyncDataPageHome(
                              size: size,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routers.testDetail);
                              },
                              textTitle: 'Tests',
                              totalQ: totalQ.toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                type: "test",
                                size: size,
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                ],
              ),
            ],
          ),
        )));
  }
}
