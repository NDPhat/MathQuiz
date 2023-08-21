import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/chart_data_week.dart';
import 'package:math/data/remote/model/detail_quiz_hw_response.dart';
import 'package:math/data/remote/model/result_quiz_hw_res_pagi.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/widget/line_item_content_card_home.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../application/cons/color.dart';
import '../../../application/utils/count_sign.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../main.dart';
import '../../widget/async_data_detail.dart';
import '../../widget/dot_page_indicator.dart';
import '../../widget/indicator.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';
import 'chart/chart_season_hw.dart';

class DetailItemCardHomeWork extends StatefulWidget {
  @override
  State<DetailItemCardHomeWork> createState() => _DetailItemCardHomeWorkState();
}

class _DetailItemCardHomeWorkState extends State<DetailItemCardHomeWork> {
  int page = 1;
  bool isFirstLoadRunning = false;
  bool hasNextPage = true;
  int length = 1;
  List<ResultQuizHWAPIModel>? posts = [];
  ResultQuizHWResPagi? data;

  @override
  void initState() {
    firstLoad();
    super.initState();
  }

  void getMore() async {
    posts!.clear();
    data = await instance.get<UserAPIRepo>().getALlResultQuizHWByUserIDWithPagi(
        instance.get<UserGlobal>().id.toString(), page);
    final List<ResultQuizHWAPIModel>? fetchedPosts = data!.data;
    if (fetchedPosts!.isNotEmpty) {
      setState(() {
        posts!.addAll(fetchedPosts);
      });
    } else {
      setState(() {
        hasNextPage = false;
      });
    }
  }

  void firstLoad() async {
    setState(() {
      isFirstLoadRunning = true;
    });
    data = await instance.get<UserAPIRepo>().getALlResultQuizHWByUserIDWithPagi(
        instance.get<UserGlobal>().id.toString(), page);
    final List<ResultQuizHWAPIModel>? fetchedPosts = data!.data;
    length = data!.total!;
    if (length % 5 > 0) {
      length = length ~/ 5 + 1;
    } else {
      length = length ~/ 5;
    }
    if (fetchedPosts!.isNotEmpty) {
      setState(() {
        posts!.addAll(fetchedPosts);
      });
    }
    //search list
    setState(() {
      isFirstLoadRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
        onBack: () {
          Navigator.pop(context);
        },
        textNow: "${'home work'.tr()} ${'data sheet'.tr().toLowerCase()}",
        onPressHome: () {},
        colorTextAndIcon: Colors.black,
        child: Container(
          height: 90.h,
          padding: EdgeInsets.only(left: 05.w, right: 5.w),
          child: Column(
            children: [
              LineContentItem(
                title: "data season".tr().toString(),
                icon: const Icon(Icons.calendar_month),
                colorBG: colorMainBlue,
              ),
               Column(
                children: [
                  const ChartSeasonHW(),
                  Center(
                      child: Text(
                    "detailed homework data".tr(),
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
              LineContentItem(
                  colorBG: colorErrorPrimary,
                  title: "weekly data".tr().toString(),
                  icon: const Icon(Icons.calendar_view_week)),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                  height: 40.h,
                  child: isFirstLoadRunning
                      ? SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: colorMainBlue,
                              strokeWidth: 5,
                            ),
                          ),
                        )
                      : CustomScrollView(slivers: [
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                            childCount: posts!.length,
                            (context, index) {
                              posts!.sort((a, b) => a.week!.compareTo(b.week!));
                              return Padding(
                                padding:
                                    EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                                child: ItemAsyncDataDetail(
                                  colorBorder: colorErrorPrimary,
                                  textTitle:
                                      "${'week'.tr()} ${posts![index].week!}",
                                  childRight: SizedBox(
                                    height: 20.h,
                                    width: 45.w,
                                    child: FutureBuilder<
                                            List<DetailQuizHWAPIModel>?>(
                                        future: instance
                                            .get<UserAPIRepo>()
                                            .getALlQuizDetailByUserIDAndWeek(
                                                instance
                                                    .get<UserGlobal>()
                                                    .id!
                                                    .toString(),
                                                posts![index].week!),
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
                                              ChartDataWeek("+", signAddTrue,
                                                  signAddFalse),
                                              ChartDataWeek("-", signSubTrue,
                                                  signSubFalse),
                                              ChartDataWeek("x", signMulTrue,
                                                  signMulFalse),
                                              ChartDataWeek("/", signDiviTrue,
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
                                                  ColumnSeries<ChartDataWeek,
                                                      String>(
                                                    color: colorMainBlue,
                                                    dataSource: dataList,
                                                    xValueMapper:
                                                        (ChartDataWeek chart,
                                                                _) =>
                                                            chart.x,
                                                    yValueMapper:
                                                        (ChartDataWeek chart,
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
                                                  ColumnSeries<ChartDataWeek,
                                                      String>(
                                                    color: colorErrorPrimary,
                                                    dataSource: dataList,
                                                    xValueMapper:
                                                        (ChartDataWeek chart,
                                                                _) =>
                                                            chart.x,
                                                    yValueMapper:
                                                        (ChartDataWeek chart,
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
                                  timeSave: posts![index].dateSave!,
                                  onPress: () {
                                    Navigator.pushNamed(
                                        context, Routers.checkAnswerHW,
                                        arguments: posts![index].key);
                                  },
                                ),
                              );
                            },
                          ))
                        ])

                  ///
                  ),

              /// Stop
              Container(
                padding: EdgeInsets.only(right: 5.w),
                width: 100.w,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  DotPageIndicator(
                    colorBorder: colorMainBlue,
                    icon: SvgPicture.asset(
                      "assets/icon/back.svg",
                      color: colorMainBlue,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      if (page == 1) {
                      } else {
                        setState(() {
                          page--;
                          getMore();
                        });
                      }
                    },
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  DotIndicator(                      totalPage: length.toString(),

                    colorBorder: colorErrorPrimary,
                    pageIndex: page.toString(),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  DotPageIndicator(
                    colorBorder: colorMainBlue,
                    icon: SvgPicture.asset(
                      "assets/icon/next.svg",
                      color: colorMainBlue,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      if (page < length) {
                        setState(() {
                          page++;
                          getMore();
                        });
                      }
                    },
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
