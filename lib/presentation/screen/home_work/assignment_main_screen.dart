import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/result_hw_repo.dart';

import 'package:math/main.dart';
import 'package:math/presentation/widget/item_card_hw.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/utils/format.dart';
import '../../../data/model/pre_join_homework.dart';
import '../../../data/remote/model/pre_hw_res.dart';
import '../../../data/remote/model/result_hw_req.dart';
import '../../../data/remote/model/result_hw_res.dart';
import '../../routers/navigation.dart';
import '../../widget/bg_list_view.dart';
import '../../widget/line_item_content_card_home.dart';
import '../../widget/weak_widget.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class AssignmentMainScreen extends StatelessWidget {
  const AssignmentMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> createPreHW(PreHWAPIModel dataPre) async {
      PreHWAPIModel? preQuiz = await instance
          .get<ResultHWRepo>()
          .getPreQuizHWByWeek(dataPre.week.toString());

      ResultHWAPIModel? data = await instance
          .get<ResultHWRepo>()
          .createResultHomeWorkWeek(ResultHWAPIReq(
              week: dataPre.week.toString(),
              numQ: dataPre.numQ,
              trueQ: 0,
              falseQ: 0,
              dateSave: formatDateInput.format(DateTime.now()),
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
      Navigator.pushNamed(context, Routers.assignmentGameScreen,
          arguments: preJoinHW);
    }

    showReadyToJoinHWDialog(PreHWAPIModel dataPre) {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.question,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        dismissOnTouchOutside: false,
        desc: '${"are you ready".tr()} ?',
        descTextStyle: s20GgBarColorMainTeal,
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          createPreHW(dataPre);
        },
      ).show();
    }

    showReviewHWDialog(String idResult) {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.question,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        dismissOnTouchOutside: false,
        desc: '${'review your answer'.tr()} ?',
        descTextStyle: s20GgBarColorMainTeal,
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.pushNamed(context, Routers.checkAnswerHW,
              arguments: idResult);
        },
      ).show();
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: MainPageHomePG(
            onBack: () {
              Navigator.pushNamed(context, Routers.homeUser);
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
                      sizedBox,
                      BackGroundListView(
                        colorBG: colorMainTealPri,
                        width: 100.w,
                        height: 50.h,
                        content: 'history'.tr(),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(top: 10.h),
                              height: 50.h,
                              width: 85.w,
                              child: FutureBuilder<List<ResultHWAPIModel>?>(
                                  future: instance
                                      .get<ResultHWRepo>()
                                      .getALlResultQuizHWByUserID(instance
                                          .get<UserGlobal>()
                                          .id
                                          .toString()),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SizedBox(
                                        height: 30.h,
                                        width: 30.w,
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: colorMainTealPri,
                                            strokeWidth: 5,
                                          ),
                                        ),
                                      );
                                    }
                                    if (snapshot.hasData) {
                                      return CustomScrollView(slivers: [
                                        SliverList(
                                            delegate:
                                                SliverChildBuilderDelegate(
                                          childCount: snapshot.data!.length,
                                          (context, index) {
                                            snapshot.data!.sort((a, b) =>
                                                a.week!.compareTo(b.week!));
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.5.h, bottom: 0.5.h),
                                              child: ItemCardHW(
                                                onTap: () {
                                                  showReviewHWDialog(snapshot
                                                      .data![index].key!);
                                                },
                                                colorBorder: colorMainTealPri,
                                                childRight: Center(
                                                    child: Text(
                                                  'view'.tr().toString(),
                                                  style: GoogleFonts.aBeeZee(
                                                      color: colorMainTealPri,
                                                      fontSize: 20),
                                                )),
                                                childLeft: WeakWidget(
                                                  dataResult:
                                                      snapshot.data![index],
                                                  colorBorder: colorMainTealPri,
                                                ),
                                              ),
                                            );
                                          },
                                        ))
                                      ]);
                                    }

                                    return Container();
                                  }),
                            ),
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
                            height: 15.h,
                            child: FutureBuilder<PreHWAPIModel?>(
                                future: instance
                                    .get<ResultHWRepo>()
                                    .getOnGoingPreHWandNotDO(instance
                                        .get<UserGlobal>()
                                        .id
                                        .toString()),
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
                                    return Padding(
                                      padding: EdgeInsets.only(top: 0.5.h),
                                      child: ItemCardHW(
                                        colorBorder: colorErrorPrimary,
                                        childRight: Center(
                                            child: Text(
                                          "do".tr().toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(
                                              color: colorErrorPrimary,
                                              fontSize: 20),
                                        )),
                                        childLeft: WeakWidget(
                                          dataPre: snapshot.data,
                                          colorBorder: colorErrorPrimary,
                                        ),
                                        onTap: () {
                                          showReadyToJoinHWDialog(
                                              snapshot.data!);
                                        },
                                      ),
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
      ),
    );
  }
}
