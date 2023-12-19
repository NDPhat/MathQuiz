import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/application/utils/func.dart';
import 'package:math/data/model/chart_data_week.dart';
import 'package:math/data/remote/api/Repo/quiz_test_repo.dart';
import 'package:math/data/remote/model/quiz_test_res.dart';
import 'package:math/domain/bloc/detail_test/detail_test_cubit.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/detail_item_card_home/chart/chart_season_test.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../application/cons/color.dart';
import '../../../application/utils/count_sign.dart';
import '../../../main.dart';
import '../../widget/async_data_detail.dart';
import '../../widget/button_custom.dart';
import '../../widget/dot_page_indicator.dart';
import '../../widget/indicator.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class DetailMixGameScreen extends StatefulWidget {
  const DetailMixGameScreen({Key? key}) : super(key: key);

  @override
  State<DetailMixGameScreen> createState() => _DetailMixGameScreenState();
}

class _DetailMixGameScreenState extends State<DetailMixGameScreen> {
  @override
  void initState() {
    super.initState();
    initPageData();
  }

  void initPageData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DetailTestCubit>().initPage();
    });
  }

  showSettingDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      title: "DELETE",
      descTextStyle: s20GgBarColorMainTeal,
      btnCancelText: "ALL".tr(),
      btnOkText: "LOW SCORE".tr(),
      btnCancelOnPress: () {
        context.read<DetailTestCubit>().deleteAllPreTest();
        Navigator.pushNamed(context, Routers.testDetail);
      },
      btnOkOnPress: () {
        context.read<DetailTestCubit>().deleteAllPreTestLowScore();
        Navigator.pushNamed(context, Routers.testDetail);
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorSystemWhite,
        body: MainPageHomePG(
            onBack: () {
              Navigator.pushNamed(context, Routers.dataSheetScreen);
            },
            textNow: "${'test'.tr()} ${'data sheet'.tr().toLowerCase()}",
            onPressHome: () {
              showSettingDialog();
            },
            iconRight: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            colorTextAndIcon: Colors.black,
            child: Container(
              height: 90.h,
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Column(children: [
                Column(
                  children: [
                    const ChartSeasonTest(),
                    Center(
                        child: Text(
                      "detailed test data".tr(),
                      style: s14f500ColorMainTe,
                    ))
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: colorGrayBG),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                SizedBox(
                  height: 5.h,
                  width: 100.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 90.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            renderSortText(),
                            BlocBuilder<DetailTestCubit, DetailTestState>(
                                buildWhen: (pre, now) {
                              return pre.scoreChoose != now.scoreChoose;
                            }, builder: (context, state) {
                              return renderScoreChoose(context, state);
                            }),
                            BlocBuilder<DetailTestCubit, DetailTestState>(
                                buildWhen: (pre, now) {
                              return pre.dayChoose != now.dayChoose;
                            }, builder: (context, state) {
                              return renderDayChoose(context, state);
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<DetailTestCubit, DetailTestState>(
                    buildWhen: (pre, now) {
                  return pre.pageNow != now.pageNow ||
                      pre.posts != now.posts ||
                      pre.dayChoose != now.dayChoose ||
                      pre.scoreChoose != now.scoreChoose;
                }, builder: (context, state) {
                  return SizedBox(
                      height: 45.h,
                      child: state.posts!.isNotEmpty
                          ? CustomScrollView(slivers: [
                              SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                childCount: state.posts!.length,
                                (context, index) {
                                  int totalQ = 0;
                                  int score = 0;
                                  for (var element in state.posts!) {
                                    totalQ = totalQ + element.numQ!;
                                    score = score + element.score!;
                                  }
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.5.h, bottom: 0.5.h),
                                    child: ItemAsyncDataDetail(
                                      totalQuiz: state.posts![index].numQ.toString(),
                                      score: state.posts![index].score.toString(),
                                      colorBorder: colorSystemYeloow,
                                      textTitle:
                                          "${'task'.tr()} ${index + 1 + (state.pageNow - 1) * 5}",
                                      childRight: SizedBox(
                                        width: 45.w,
                                        child: FutureBuilder<
                                                List<QuizTestAPIModel>?>(
                                            future: instance
                                                .get<QuizTestRepo>()
                                                .getALlQuizTestByPreTestID(
                                                    state.posts![index].key!),
                                            builder: (context, snapshotChild) {
                                              if (snapshotChild.hasData) {
                                                int signAddTrue = 0;
                                                int signSubTrue = 0;
                                                int signMulTrue = 0;
                                                int signDiviTrue = 0;
                                                int signAddFalse = 0;
                                                int signSubFalse = 0;
                                                int signMulFalse = 0;
                                                int signDiviFalse = 0;
                                                for (int i = 0;
                                                    i <
                                                        snapshotChild
                                                            .data!.length;
                                                    i++) {
                                                  int sign = getSign(
                                                      quiz: snapshotChild
                                                          .data![i].quiz!);
                                                  if (snapshotChild
                                                          .data![i].infoQuiz ==
                                                      true) {
                                                    switch (sign) {
                                                      case 0:
                                                        signAddTrue++;
                                                        break;
                                                      case 1:
                                                        signSubTrue++;
                                                        break;
                                                      case 2:
                                                        signMulTrue++;
                                                        break;
                                                      case 3:
                                                        signDiviTrue++;
                                                        break;
                                                    }
                                                  } else {
                                                    switch (sign) {
                                                      case 0:
                                                        signAddFalse++;
                                                        break;
                                                      case 1:
                                                        signSubFalse++;
                                                        break;
                                                      case 2:
                                                        signMulFalse++;
                                                        break;
                                                      case 3:
                                                        signDiviFalse++;
                                                        break;
                                                    }
                                                  }
                                                }
                                                List<ChartDataWeek> dataList = [
                                                  ChartDataWeek(
                                                      "+",
                                                      signAddTrue,
                                                      signAddFalse),
                                                  ChartDataWeek(
                                                      "-",
                                                      signSubTrue,
                                                      signSubFalse),
                                                  ChartDataWeek(
                                                      "x",
                                                      signMulTrue,
                                                      signMulFalse),
                                                  ChartDataWeek(
                                                      "/",
                                                      signDiviTrue,
                                                      signDiviFalse),
                                                ];
                                                return SfCartesianChart(
                                                    plotAreaBorderColor:
                                                        colorMainBlue,
                                                    plotAreaBorderWidth: 0,
                                                    primaryXAxis: CategoryAxis(
                                                      majorGridLines:
                                                          const MajorGridLines(
                                                              width: 0),
                                                      //Hide the axis line of x-axis
                                                    ),
                                                    primaryYAxis: NumericAxis(
                                                      //Hide the gridlines of y-axis
                                                      majorGridLines:
                                                          const MajorGridLines(
                                                              width: 0),
                                                      //Hide the axis line of y-axis
                                                    ),
                                                    series: <CartesianSeries<
                                                        ChartDataWeek, String>>[
                                                      ColumnSeries<
                                                          ChartDataWeek,
                                                          String>(
                                                        color: colorMainBlue,
                                                        dataSource: dataList,
                                                        xValueMapper:
                                                            (ChartDataWeek
                                                                        chart,
                                                                    _) =>
                                                                chart.x,
                                                        yValueMapper:
                                                            (ChartDataWeek
                                                                        chart,
                                                                    _) =>
                                                                chart.y,
                                                        dataLabelSettings:
                                                            const DataLabelSettings(
                                                                color:
                                                                    colorMainBlue,
                                                                textStyle:
                                                                    TextStyle(
                                                                        fontSize:
                                                                            2)),
                                                      ),
                                                      ColumnSeries<
                                                          ChartDataWeek,
                                                          String>(
                                                        color:
                                                            colorErrorPrimary,
                                                        dataSource: dataList,
                                                        xValueMapper:
                                                            (ChartDataWeek
                                                                        chart,
                                                                    _) =>
                                                                chart.x,
                                                        yValueMapper:
                                                            (ChartDataWeek
                                                                        chart,
                                                                    _) =>
                                                                chart.y1,
                                                        dataLabelSettings:
                                                            const DataLabelSettings(
                                                                color:
                                                                    colorMainBlue,
                                                                textStyle:
                                                                    TextStyle(
                                                                        fontSize:
                                                                            2)),
                                                      ),
                                                    ]);
                                              } else {
                                                return Container();
                                              }
                                            }),
                                      ),
                                      timeSave:
                                          "${state.posts![index].dateSave}",
                                      onPress: () {
                                        Navigator.pushNamed(
                                            context, Routers.checkAnswerTest,
                                            arguments: state.posts![index].key);
                                      },
                                    ),
                                  );
                                },
                              ))
                            ])
                          : Center(
                              child: Text(
                                'NOTHING ADDED !!'.tr(),
                                style: GoogleFonts.abel(
                                    color: colorMainTealPri, fontSize: 20),
                              ),
                            ));
                }),
                Container(
                  padding: EdgeInsets.only(right: 5.w),
                  width: 100.w,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    BlocBuilder<DetailTestCubit, DetailTestState>(
                        buildWhen: (pre, now) {
                      return pre.pageNow != now.pageNow;
                    }, builder: (context, state) {
                      return DotPageIndicator(
                        colorBorder: colorMainBlue,
                        icon: SvgPicture.asset(
                          "assets/icon/back.svg",
                          color: colorMainBlue,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          context.read<DetailTestCubit>().pageMinus();
                        },
                      );
                    }),
                    SizedBox(
                      width: 2.w,
                    ),
                    BlocBuilder<DetailTestCubit, DetailTestState>(
                        buildWhen: (pre, now) {
                      return pre.pageNow != now.pageNow ||
                          pre.posts != now.posts;
                    }, builder: (context, state) {
                      return DotIndicator(
                        totalPage: findLength(state.lengthNow).toString(),
                        colorBorder: colorErrorPrimary,
                        pageIndex: state.pageNow.toString(),
                      );
                    }),
                    SizedBox(
                      width: 2.w,
                    ),
                    BlocBuilder<DetailTestCubit, DetailTestState>(
                        buildWhen: (pre, now) {
                      return pre.pageNow != now.pageNow;
                    }, builder: (context, state) {
                      return DotPageIndicator(
                        colorBorder: colorMainBlue,
                        icon: SvgPicture.asset(
                          "assets/icon/next.svg",
                          color: colorMainBlue,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          context.read<DetailTestCubit>().pagePlus();
                        },
                      );
                    })
                  ]),
                )
              ]),
            )));
  }

  Text renderSortText() {
    return Text(
      "${"sort".tr()} :",
      style: GoogleFonts.aclonica(
        color: colorSystemYeloow,
        decoration: TextDecoration.underline,
        decorationColor: colorSystemYeloow,
        decorationThickness: 7,
        fontSize: 16,
      ),
    );
  }

  RoundedButton renderDayChoose(BuildContext context, DetailTestState state) {
    return RoundedButton(
      press: () {
        context.read<DetailTestCubit>().dayChoose();
      },
      colorBorder: state.dayChoose ? colorErrorPrimary : colorSystemYeloow,
      color: colorSystemWhite,
      width: 30.w,
      height: 3.h,
      child: Text(
        "day".tr(),
        style: GoogleFonts.cabin(
          color: state.dayChoose ? colorErrorPrimary : colorSystemYeloow,
          fontSize: 14,
        ),
      ),
    );
  }

  RoundedButton renderScoreChoose(BuildContext context, DetailTestState state) {
    return RoundedButton(
      press: () {
        context.read<DetailTestCubit>().scoreChoose();
      },
      colorBorder: state.scoreChoose ? colorErrorPrimary : colorSystemYeloow,
      color: colorSystemWhite,
      width: 30.w,
      height: 3.h,
      child: Text(
        "score".tr(),
        style: GoogleFonts.cabin(
          color: state.scoreChoose ? colorErrorPrimary : colorSystemYeloow,
          fontSize: 14,
        ),
      ),
    );
  }
}
