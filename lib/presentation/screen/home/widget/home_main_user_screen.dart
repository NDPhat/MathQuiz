import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';
import 'package:math/presentation/widget/card_data_item_home.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../application/cons/color.dart';
import '../../../../data/model/chart_data.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../../data/remote/model/detail_quiz_hw_response.dart';
import '../../../../data/remote/model/result_quiz_hw_response.dart';
import '../../../../main.dart';
import '../../../widget/child_right_item_card_home.dart';
import '../../../widget/line_item_content_card_home.dart';

class HomeMainUserScreen extends StatelessWidget {
  HomeMainUserScreen({Key? key, required this.size});
  Size size;

  @override
  Widget build(BuildContext context) {
    return HomeUserBG(
        textNow: 'Home',
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
                    title: 'Home works',
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
                        if (snapshot.hasData) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          double scoreAve = score / snapshot.data!.length;
                          return ItemAsyncDataPageHome(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routers.hwcardDetail);
                              },
                              size: size,
                              textTitle: 'HOME WORK',
                              scoreAve: scoreAve.toStringAsFixed(2).toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                size: size,
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  LineContentItem(
                    size: size,
                    title: 'Practices',
                    icon: const Icon(Icons.dashboard),
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
                        if (snapshot.hasData) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          double scoreAve = score / snapshot.data!.length;
                          return ItemAsyncDataPageHome(
                              size: size,
                              onTap: () {},
                              textTitle: 'ADDITION',
                              scoreAve: scoreAve.toStringAsFixed(2).toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                size: size,
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  SizedBox(
                    height: size.height * 0.02,
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
                        if (snapshot.hasData) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          double scoreAve = score / snapshot.data!.length;
                          return ItemAsyncDataPageHome(
                              size: size,
                              onTap: () {},
                              textTitle: 'SUBTRACTION',
                              scoreAve: scoreAve.toStringAsFixed(2).toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                size: size,
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  SizedBox(
                    height: size.height * 0.02,
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
                        if (snapshot.hasData) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          double scoreAve = score / snapshot.data!.length;
                          return ItemAsyncDataPageHome(
                              size: size,
                              onTap: () {},
                              textTitle: 'MULTIPLICATION',
                              scoreAve: scoreAve.toStringAsFixed(2).toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                size: size,
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  SizedBox(
                    height: size.height * 0.02,
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
                        if (snapshot.hasData) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          double scoreAve = score / snapshot.data!.length;
                          return ItemAsyncDataPageHome(
                              size: size,
                              onTap: () {},
                              textTitle: 'DIVISION',
                              scoreAve: scoreAve.toStringAsFixed(2).toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                size: size,
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  LineContentItem(
                    size: size,
                    title: 'Tests',
                    icon: const Icon(Icons.task),
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
                        if (snapshot.hasData) {
                          int totalQ = 0;
                          int score = 0;
                          for (var element in snapshot.data!) {
                            totalQ = totalQ + element.numQ!;
                            score = score + element.score!;
                          }
                          double scoreAve = score / snapshot.data!.length;
                          return ItemAsyncDataPageHome(
                              size: size,
                              onTap: () {},
                              textTitle: 'Tests',
                              scoreAve: scoreAve.toStringAsFixed(2).toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
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
