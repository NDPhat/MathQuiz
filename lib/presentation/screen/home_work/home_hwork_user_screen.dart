import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/pre_quiz_hw_response.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import 'package:math/main.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';
import 'package:math/presentation/widget/item_card_hw.dart';
import 'dart:math' as math;

import '../../../application/cons/color.dart';

import '../../../application/cons/constants.dart';
import '../../../data/model/check_model.dart';
import '../../../data/model/pre_join_homework.dart';
import '../../../data/remote/model/result_quiz_hw_req.dart';
import '../../routers/navigation.dart';
import '../../widget/line_item_content_card_home.dart';
import '../../widget/weak_widget.dart';

class HomeHWorkUserScreen extends StatelessWidget {
  HomeHWorkUserScreen({Key? key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    Future<void> showJoinHWDialog(PreQuizHWResAPIModel dataPre) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              25,
            )),
            backgroundColor: const Color(0xff1542bf),
            title: const FittedBox(
              child: Text('READY FOR YOUR HOME WORK ?',
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  PreQuizHWResAPIModel? preQuiz = await instance
                      .get<UserAPIRepo>()
                      .getPreQuizHWByWeek(dataPre.week.toString());
                  ResultQuizHWAPIModel? data = await instance
                      .get<UserAPIRepo>()
                      .createResultHomeWorkWeek(ResultQuizHWAPIReq(
                          week: dataPre.week.toString(),
                          numQ: dataPre.numQ,
                          trueQ: 0,
                          falseQ: 0,
                          score: 0,
                          userId: instance.get<UserGlobal>().id));
                  PreJoinQuizHW preJoinHW = PreJoinQuizHW(
                    resultID: data!.key,
                    week: preQuiz!.week,
                    numQ: preQuiz.numQ,
                    sign: preQuiz.sign,
                    sNum: preQuiz.sNum,
                    eNum: preQuiz.eNum,
                    dend: preQuiz.dend,
                    dstart: preQuiz.dstart,
                  );
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeworkGame,
                      arguments: preJoinHW);
                },
                child: const Text('GO', style: s16f700ColorError),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('EXIT', style: s15f700ColorYellow),
              ),
            ],
          );
        },
      );
    }

    Future<void> showDoneDialog(String idResult) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              25,
            )),
            backgroundColor: const Color(0xff1542bf),
            title: const FittedBox(
              child: Text('REVIEW YOUR ANSWER?',
                  textAlign: TextAlign.center, style: s30f700colorSysWhite),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.checkAnswerHW,
                      arguments: CheckAnswerModel(id: idResult, type: "hw"));
                },
                child: const Text('GO', style: s16f700ColorError),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('EXIT', style: s15f700ColorYellow),
              ),
            ],
          );
        },
      );
    }

    return HomeUserBG(
        textNow: 'Home work',
        size: size,
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.02, right: size.width * 0.02),
          child: Column(
            children: [
              Column(
                children: [
                  LineContentItem(
                      size: size,
                      title: 'DONE',
                      icon: const Icon(Icons.check)),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: size.height * 0.4,
                      child: FutureBuilder<List<ResultQuizHWAPIModel>?>(
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
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  snapshot.data!.sort(
                                      (a, b) => a.week!.compareTo(b.week!));
                                  return ItemCardHW(
                                    onTap: () {
                                      showDoneDialog(
                                          snapshot.data![index].key!);
                                    },
                                    size: size,
                                    backgroundColor: colorMainBlue,
                                    childRight: const Center(
                                        child: Text(
                                      'DONE',
                                      style: s20f700ColorSysWhite,
                                    )),
                                    childLeft: WeakWidget(
                                        size: size,
                                        dataResult: snapshot.data![index]),
                                  );
                                },
                              );
                            }

                            return Container();
                          }),
                    ),
                  ),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: colorGrayBG),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  LineContentItem(
                      size: size,
                      title: 'ON SCHEDULE',
                      icon: const Icon(Icons.do_not_disturb)),
                  SingleChildScrollView(
                    child: SizedBox(
                        height: size.height * 0.2,
                        child: FutureBuilder<PreQuizHWResAPIModel?>(
                            future: instance
                                .get<UserAPIRepo>()
                                .getOnGoingPreHWandNotDO(instance.get<UserGlobal>().id.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return SizedBox(
                                  height: size.height * 0.2,
                                  width: size.width * 0.5,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: colorMainBlue,
                                      strokeWidth: 5,
                                    ),
                                  ),
                                );
                              }
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return ItemCardHW(
                                      size: size,
                                      backgroundColor: colorErrorPrimary,
                                      childRight: const Center(
                                          child: Text(
                                        'DO',
                                        style: s20f700ColorGreyte,
                                      )),
                                      childLeft: WeakWidget(
                                          size: size, dataPre: snapshot.data),
                                      onTap: () {
                                        showJoinHWDialog(snapshot.data!);
                                      },
                                    );
                                  },
                                );
                              } else {
                                return Container();
                              }
                            })),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Expanded buildDivider() {
    return Expanded(
      child: Transform.rotate(
        angle: math.pi / 2,
        child: const Divider(
          color: colorGreyDisable,
          height: 5,
        ),
      ),
    );
  }
}
