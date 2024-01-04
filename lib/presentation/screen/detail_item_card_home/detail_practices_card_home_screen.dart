import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/application/utils/func.dart';
import 'package:math/data/model/chart_data_week.dart';
import 'package:math/data/remote/api/Repo/quiz_pra_repo.dart';
import 'package:math/domain/bloc/detail_practices/detail_practices_cubit.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:multiselect/multiselect.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../application/cons/color.dart';
import '../../../application/utils/count_sign.dart';
import '../../../data/remote/model/quiz_pra_res.dart';
import '../../../main.dart';
import '../../widget/async_data_detail.dart';
import '../../widget/dot_page_indicator.dart';
import '../../widget/indicator.dart';
import 'chart/chart_season_prac.dart';

class DetailItemCardPractices extends StatefulWidget {
  const DetailItemCardPractices({Key? key}) : super(key: key);

  @override
  State<DetailItemCardPractices> createState() =>
      _DetailItemCardPracticesState();
}

class _DetailItemCardPracticesState extends State<DetailItemCardPractices> {
  String type = "";
  @override
  void initState() {
    super.initState();
    initPageData();
  }

  void initPageData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String args = ModalRoute.of(context)!.settings.arguments as String;
      setState(() {
        type = args;
      });
      context.read<DetailPracticesCubit>().initPage(type);
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
        context.read<DetailPracticesCubit>().deleteALlPrePraByUidAndType(type);
        Navigator.pushNamed(context, Routers.practicecardDetail,
            arguments: type);
      },
      btnOkOnPress: () {
        context.read<DetailPracticesCubit>().deleteLowScore(type);
        Navigator.pushNamed(context, Routers.practicecardDetail,
            arguments: type);
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: SingleChildScrollView(
        child: MainPageHomePG(
          onBack: () {
            Navigator.pushNamed(context, Routers.dataSheetScreen);
          },
          textNow: "${'practice'.tr()} ${'data sheet'.tr().toLowerCase()}",
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
            child: Column(
              children: [
                Column(
                  children: [
                    ChartSeasonPra(
                      typeGame: type,
                    ),
                    Center(
                        child: Text(
                      "detailed data".tr(),
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
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 5.h,
                  width: 100.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 48.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            renderSortText(),
                            BlocBuilder<DetailPracticesCubit,
                                DetailPracticesState>(buildWhen: (pre, now) {
                              return pre.scoreChoose != now.scoreChoose;
                            }, builder: (context, state) {
                              return renderScoreChoose(context, state);
                            }),
                            BlocBuilder<DetailPracticesCubit,
                                DetailPracticesState>(buildWhen: (pre, now) {
                              return pre.dayChoose != now.dayChoose;
                            }, builder: (context, state) {
                              return renderDayChoose(context, state);
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            renderFilterText(),
                            SizedBox(
                                width: 25.w,
                                height: 3.h,
                                child: BlocBuilder<DetailPracticesCubit,
                                    DetailPracticesState>(buildWhen: (pre, now) {
                                  return pre.signFilter != now.signFilter;
                                }, builder: (context, state) {
                                  return renderFilter(state, context);
                                })),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// LIST DATA
                BlocBuilder<DetailPracticesCubit, DetailPracticesState>(
                    buildWhen: (pre, now) {
                  return pre.pageNow != now.pageNow ||
                      pre.posts != now.posts ||
                      pre.dayChoose != now.dayChoose ||
                      pre.scoreChoose != now.scoreChoose;
                }, builder: (context, state) {
                  return renderListData(state);
                }),

                /// DOT INDICATOR
                Container(
                  padding: EdgeInsets.only(right: 5.w),
                  width: 100.w,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    /// MINUS
                    BlocBuilder<DetailPracticesCubit, DetailPracticesState>(
                        buildWhen: (pre, now) {
                      return pre.pageNow != now.pageNow;
                    }, builder: (context, state) {
                      return renderMinusPage(context);
                    }),
                    SizedBox(
                      width: 2.w,
                    ),

                    /// VALUE
                    BlocBuilder<DetailPracticesCubit, DetailPracticesState>(
                        buildWhen: (pre, now) {
                      return pre.pageNow != now.pageNow || pre.posts != now.posts;
                    }, builder: (context, state) {
                      return renderPageValue(state);
                    }),
                    SizedBox(
                      width: 2.w,
                    ),

                    ///PLUS
                    BlocBuilder<DetailPracticesCubit, DetailPracticesState>(
                        buildWhen: (pre, now) {
                      return pre.pageNow != now.pageNow;
                    }, builder: (context, state) {
                      return renderPlusPage(context);
                    }),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox renderFilterText() {
    return SizedBox(
      width: 15.w,
      height: 5.h,
      child: Center(
        child: Text(
          "${"filter".tr()} :",
          style: GoogleFonts.aclonica(
            color: colorSystemYeloow,
            decorationColor: colorSystemYeloow,
            decorationThickness: 7,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  SizedBox renderSortText() {
    return SizedBox(
      width: 18.w,
      height: 5.h,
      child: Center(
        child: Text(
          "${"sort".tr()}  :",
          style: GoogleFonts.aclonica(
            color: colorSystemYeloow,
            decorationColor: colorSystemYeloow,
            decorationThickness: 7,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  DotPageIndicator renderPlusPage(BuildContext context) {
    return DotPageIndicator(
      colorBorder: colorMainBlue,
      icon: SvgPicture.asset(
        "assets/icon/next.svg",
        color: colorMainBlue,
        fit: BoxFit.cover,
      ),
      onTap: () {
        context.read<DetailPracticesCubit>().pagePlus(type);
      },
    );
  }

  DotIndicator renderPageValue(DetailPracticesState state) {
    return DotIndicator(
      totalPage: findLength(state.lengthNow).toString(),
      colorBorder: colorErrorPrimary,
      pageIndex: state.pageNow.toString(),
    );
  }

  DotPageIndicator renderMinusPage(BuildContext context) {
    return DotPageIndicator(
      colorBorder: colorMainBlue,
      icon: SvgPicture.asset(
        "assets/icon/back.svg",
        color: colorMainBlue,
        fit: BoxFit.cover,
      ),
      onTap: () {
        context.read<DetailPracticesCubit>().pageMinus(type);
      },
    );
  }

  SizedBox renderListData(DetailPracticesState state) {
    return SizedBox(
        height: 45.h,
        child: state.posts!.isNotEmpty
            ? CustomScrollView(slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: state.posts!.length,
                  (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                      child: ItemAsyncDataDetail(
                        totalQuiz: state.posts![index].numQ.toString(),
                        score: state.posts![index].score.toString(),
                        colorBorder: colorSystemYeloow,
                        textTitle:
                            "${'task'.tr()} ${index + 1 + (state.pageNow - 1) * 5}",
                        childRight: SizedBox(
                          height: 20.h,
                          width: 45.w,
                          child: FutureBuilder<List<QuizPraAPIModel>?>(
                              future: instance
                                  .get<QuizPraRepo>()
                                  .getALlQuizGameByPreGameID(
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
                                      i < snapshotChild.data!.length;
                                      i++) {
                                    int sign = getSign(
                                        quiz: snapshotChild.data![i].quiz!);
                                    if (snapshotChild.data![i].infoQuiz ==
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
                                        "+", signAddTrue, signAddFalse),
                                    ChartDataWeek(
                                        "-", signSubTrue, signSubFalse),
                                    ChartDataWeek(
                                        "x", signMulTrue, signMulFalse),
                                    ChartDataWeek(
                                        "/", signDiviTrue, signDiviFalse),
                                  ];
                                  return SfCartesianChart(
                                      plotAreaBorderColor: colorMainBlue,
                                      plotAreaBorderWidth: 0,
                                      primaryXAxis: CategoryAxis(
                                        majorGridLines:
                                            const MajorGridLines(width: 0),
                                        //Hide the axis line of x-axis
                                      ),
                                      primaryYAxis: NumericAxis(
                                        //Hide the gridlines of y-axis
                                        majorGridLines:
                                            const MajorGridLines(width: 0),
                                        //Hide the axis line of y-axis
                                      ),
                                      series: <CartesianSeries<ChartDataWeek,
                                          String>>[
                                        ColumnSeries<ChartDataWeek, String>(
                                          color: colorMainBlue,
                                          dataSource: dataList,
                                          xValueMapper:
                                              (ChartDataWeek chart, _) =>
                                                  chart.x,
                                          yValueMapper:
                                              (ChartDataWeek chart, _) =>
                                                  chart.y,
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  color: colorMainBlue,
                                                  textStyle:
                                                      TextStyle(fontSize: 2)),
                                        ),
                                        ColumnSeries<ChartDataWeek, String>(
                                          color: colorErrorPrimary,
                                          dataSource: dataList,
                                          xValueMapper:
                                              (ChartDataWeek chart, _) =>
                                                  chart.x,
                                          yValueMapper:
                                              (ChartDataWeek chart, _) =>
                                                  chart.y1,
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  color: colorMainBlue,
                                                  textStyle:
                                                      TextStyle(fontSize: 2)),
                                        ),
                                      ]);
                                } else {
                                  return Container();
                                }
                              }),
                        ),
                        timeSave: "${state.posts![index].dateSave} ",
                        onPress: () {
                          Navigator.pushNamed(
                              context, Routers.checkAnswerPracUserGame,
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
                  style:
                      GoogleFonts.abel(color: colorMainTealPri, fontSize: 20),
                ),
              )

        ///
        );
  }

  DropDownMultiSelect<String> renderFilter(
      DetailPracticesState state, BuildContext context) {
    return DropDownMultiSelect(
      readOnly: true,
      options: const ["+", "-", "x", "/"],
      selectedValues: state.signFilter,
      selected_values_style: const TextStyle(
          color: colorSystemYeloow, fontSize: 12, fontWeight: FontWeight.w700),
      onChanged: (value) {
        context.read<DetailPracticesCubit>().signChange(value, type);
      },
    );
  }

  Center renderDayChoose(BuildContext context, DetailPracticesState state) {
    return Center(
      child: RoundedButton(
        press: () {
          context.read<DetailPracticesCubit>().dayChoose(type);
        },
        colorBorder: state.dayChoose ? colorErrorPrimary : colorSystemYeloow,
        color: colorSystemWhite,
        width: 15.w,
        height: 3.h,
        child: Text(
          "day".tr(),
          style: GoogleFonts.cabin(
            color: state.dayChoose ? colorErrorPrimary : colorSystemYeloow,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Center renderScoreChoose(BuildContext context, DetailPracticesState state) {
    return Center(
      child: RoundedButton(
        press: () {
          context.read<DetailPracticesCubit>().scoreChoose(type);
        },
        colorBorder: state.scoreChoose ? colorErrorPrimary : colorSystemYeloow,
        color: colorSystemWhite,
        width: 15.w,
        height: 3.h,
        child: Text(
          "score".tr(),
          style: GoogleFonts.cabin(
            color: state.scoreChoose ? colorErrorPrimary : colorSystemYeloow,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
