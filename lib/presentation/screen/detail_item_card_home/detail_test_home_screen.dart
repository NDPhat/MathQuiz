import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/chart_data_week.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/data/remote/model/quiz_test_res.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/line_item_content_card_home.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../application/cons/color.dart';
import '../../../application/utils/count_sign.dart';
import '../../../data/model/check_model.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../main.dart';
import '../../widget/async_data_detail.dart';
import '../../widget/child_right_item_card_home.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class DetailTestHomeWork extends StatelessWidget {
  const DetailTestHomeWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
        textNow: "${'test'.tr()} ${'data sheet'.tr().toLowerCase()}",
        onPressHome: () {},
        colorTextAndIcon: Colors.black,
        child: Container(
          height: 90.h,
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: Column(
            children: [
              LineContentItem(
                  colorBG: colorMainBlue,
                  title: 'data season'.tr().toString(),
                  icon: const Icon(Icons.calendar_month)),
              Column(
                children: [
                  ChildRightHW(
                    type: "test",
                    deTail: true,
                  ),
                  const Center(
                      child: Text(
                    'Data test result ',
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
              LineContentItem(
                  colorBG: colorSystemYeloow,
                  title: 'data detail'.tr().toString(),
                  icon: const Icon(Icons.calendar_view_week)),
              SizedBox(height: 1.h),

              SizedBox(
                height: 40.h,
                child: FutureBuilder<List<PreTestAPIRes>?>(
                    future: instance
                        .get<UserAPIRepo>()
                        .getALlPreQuizTestByUid(instance.get<UserGlobal>().id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                      } else if (snapshot.hasData) {
                        return CustomScrollView(slivers: [
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                            childCount: snapshot.data!.length,
                            (context, index) {
                              int totalQ = 0;
                              int score = 0;
                              for (var element in snapshot.data!) {
                                totalQ = totalQ + element.sumQ!;
                                score = score + element.score!;
                              }
                              return ItemAsyncDataDetail(
                                colorBorder: colorSystemYeloow,
                                textTitle: "${'task'.tr()} ${index + 1}",
                                childRight: SizedBox(
                                  width: 45.w,
                                  child: FutureBuilder<List<QuizTestAPIRes>?>(
                                      future: instance
                                          .get<UserAPIRepo>()
                                          .getALlQuizTestByPreTestID(
                                              snapshot.data![index].key!),
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
                                            ChartDataWeek(
                                                "+", signAddTrue, signAddFalse),
                                            ChartDataWeek(
                                                "-", signSubTrue, signSubFalse),
                                            ChartDataWeek(
                                                "x", signMulTrue, signMulFalse),
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
                                                          color: colorMainBlue,
                                                          textStyle: TextStyle(
                                                              fontSize: 2)),
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
                                                          color: colorMainBlue,
                                                          textStyle: TextStyle(
                                                              fontSize: 2)),
                                                ),
                                              ]);
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ),
                                timeSave: "${snapshot.data![index].dateSave}",
                                onPress: () {
                                  Navigator.pushNamed(
                                      context, Routers.checkAnswerHWAndTest,
                                      arguments: CheckAnswerModel(
                                          id: snapshot.data![index].key));
                                },
                              );
                            },
                          ))
                        ]);
                      } else {
                        return Container();
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
