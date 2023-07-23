import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/widget/card_data_item_home.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/color.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../../data/remote/model/pre_quiz_game_response.dart';
import '../../../../data/remote/model/result_quiz_hw_response.dart';
import '../../../../main.dart';
import '../../../widget/child_right_home_practices_input.dart';
import '../../../widget/child_right_item_card_home.dart';
import '../../../widget/line_item_content_card_home.dart';
import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class DataSheetUserScreen extends StatelessWidget {
  const DataSheetUserScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MainPageHomePG(
        colorTextAndIcon: Colors.black,
        textNow: 'home'.tr().toString(),
        onPressHome: () {},
        child: Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  LineContentItem(
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
                            height: 30.h,
                            width: 30.w,
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
                              textTitle: 'HOME WORK',
                              totalQ: totalQ.toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                type: "hw",
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        } else {
                          return Container();
                        }
                      }),
                  LineContentItem(
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
                            height: 30.h,
                            width: 30.w,
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
                                  context, Routers.practicecardDetail,
                                  arguments: "input");
                            },
                            textTitle: 'INPUT',
                            totalQ: totalQ.toString(),
                            trueAve:
                                ((score / totalQ) * 100).toStringAsFixed(2),
                            childRight: ChildRightHomeInput(
                              typeGame: "input",
                            ),
                            timeNow: DateFormat.yMMMEd().format(DateTime.now()),
                          );
                        }
                        return Container();
                      }),
                  SizedBox(
                    height: 2.h,
                  ),
                  FutureBuilder<List<PreQuizGameAPIModel>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlPreQuizGameByUidandOptionGame(
                              instance.get<UserGlobal>().id.toString(),
                              "true/false"),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: 30.h,
                            width: 30.w,
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
                                    context, Routers.practicecardDetail,
                                    arguments: "true/false");
                              },
                              textTitle: 'TRUE FALSE',
                              totalQ: totalQ.toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHomeInput(
                                typeGame: "true/false",
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  SizedBox(
                    height: 2.h,
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
                            height: 30.h,
                            width: 30.w,
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
                                    context, Routers.practicecardDetail,
                                    arguments: "missing");
                              },
                              textTitle: 'MISSING',
                              totalQ: totalQ.toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHomeInput(
                                typeGame: "missing",
                              ),
                              timeNow:
                                  DateFormat.yMMMEd().format(DateTime.now()));
                        }
                        return Container();
                      }),
                  LineContentItem(
                    title: 'take_hard'.tr().toString(),
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
                            height: 30.h,
                            width: 30.w,
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
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routers.testDetail);
                              },
                              textTitle: 'Tests',
                              totalQ: totalQ.toString(),
                              trueAve:
                                  ((score / totalQ) * 100).toStringAsFixed(2),
                              childRight: ChildRightHW(
                                type: "take_hard",
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
