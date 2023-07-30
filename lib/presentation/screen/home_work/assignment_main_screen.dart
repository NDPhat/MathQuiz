import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/pre_quiz_hw_response.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import 'package:math/main.dart';
import 'package:math/presentation/widget/item_card_hw.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../data/model/pre_join_homework.dart';
import '../../../data/remote/model/result_quiz_hw_req.dart';
import '../../routers/navigation.dart';
import '../../widget/line_item_content_card_home.dart';
import '../../widget/weak_widget.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class AssignmentMainScreen extends StatelessWidget {
  const AssignmentMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> createPreHW(PreQuizHWResAPIModel dataPre) async {
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
              lop: instance.get<UserGlobal>().lop.toString(),
              name: instance.get<UserGlobal>().fullName,
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
      Navigator.pushNamed(context, Routers.assignmentGameScreen,
          arguments: preJoinHW);
    }

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
            title: FittedBox(
              child: Text("${'ready hw'.tr()}?",
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  createPreHW(dataPre);
                },
                child: Text('go'.tr().toString(), style: s16f700ColorError),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('exit'.tr().toString(), style: s15f700ColorYellow),
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
            title: FittedBox(
              child: Text("${'review your answer'.tr()}?",
                  textAlign: TextAlign.center, style: kScoreLabelTextStyle),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.checkAnswerHW,
                      arguments: idResult);
                },
                child: Text('go'.tr().toString(), style: kDialogButtonsTS),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('exit'.tr().toString(), style: kDialogButtonsTS),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: MainPageHomePG(
          onBack: () {
            Navigator.pop(context);
          },
          colorTextAndIcon: Colors.black,
          textNow: 'home work'.tr().toString(),
          onPressHome: () {},
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              children: [
                Column(
                  children: [
                    LineContentItem(
                        colorBG: colorMainTealPri,
                        title: 'done'.tr().toString(),
                        icon: const Icon(Icons.check)),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 50.h,
                        child: FutureBuilder<List<ResultQuizHWAPIModel>?>(
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
                                      colorBorder: colorMainBlue,
                                      childRight: Center(
                                          child: Text(
                                        'view'.tr().toString(),
                                        style: GoogleFonts.aclonica(
                                            color: colorMainBlue, fontSize: 20),
                                      )),
                                      childLeft: WeakWidget(
                                        dataResult: snapshot.data![index],
                                        colorBorder: colorMainBlue,
                                      ),
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
                      height: 1.h,
                    ),
                    LineContentItem(
                        colorBG: colorErrorPrimary,
                        title: 'on schedule'.tr().toString(),
                        icon: const Icon(Icons.do_not_disturb)),
                    SingleChildScrollView(
                      child: SizedBox(
                          height: 20.h,
                          child: FutureBuilder<PreQuizHWResAPIModel?>(
                              future: instance
                                  .get<UserAPIRepo>()
                                  .getOnGoingPreHWandNotDO(
                                      instance.get<UserGlobal>().id.toString()),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SizedBox(
                                    height: 20.h,
                                    width: 50.w,
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
                                        colorBorder: colorErrorPrimary,
                                        childRight: Center(
                                            child: Text(
                                          "do".tr().toString(),
                                          style: GoogleFonts.aclonica(
                                              color: colorMainBlue,
                                              fontSize: 20),
                                        )),
                                        childLeft: WeakWidget(
                                          dataPre: snapshot.data,
                                          colorBorder: colorErrorPrimary,
                                        ),
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
          )),
    );
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
