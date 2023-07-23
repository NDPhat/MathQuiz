import 'package:flutter/material.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../application/cons/color.dart';
import '../../data/model/chart_data.dart';
import '../../data/model/user_global.dart';
import '../../data/remote/api/Repo/api_user_repo.dart';
import '../../data/remote/model/result_quiz_hw_response.dart';
import '../../main.dart';

class ChildRightHW extends StatelessWidget {
  ChildRightHW({
    Key? key,
    required this.type,
    this.deTail,
  }) : super(key: key);
  bool? deTail;
  final String type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: deTail == null ? 46.w : 10.w,
        height: deTail == null ? 9.h : 30.h,
        child: type == "hw"
            ? FutureBuilder<List<ResultQuizHWAPIModel>?>(
                future: instance.get<UserAPIRepo>().getALlResultQuizHWByUserID(
                    instance.get<UserGlobal>().id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChartData> dataList = [
                      ChartData(1, 0),
                      ChartData(2, 0),
                      ChartData(3, 0),
                      ChartData(4, 0),
                      ChartData(5, 0),
                      ChartData(6, 0),
                      ChartData(7, 0),
                      ChartData(8, 0),
                      ChartData(9, 0),
                      ChartData(10, 0),
                      ChartData(11, 0),
                      ChartData(12, 0),
                      ChartData(13, 0),
                      ChartData(14, 0)
                    ];
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      String week = snapshot.data![i].week!;
                      dataList[int.parse(week) - 1].y =
                          snapshot.data![i].score!;
                    }
                    return SfCartesianChart(
                        plotAreaBorderColor: colorMainBlue,
                        plotAreaBorderWidth: 0,
                        tooltipBehavior: TooltipBehavior(
                            enable: deTail == null ? false : true),
                        primaryXAxis: CategoryAxis(
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of x-axis
                        ),
                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of y-axis
                        ),
                        series: deTail == null
                            ? <ColumnSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                  color: colorMainBlue,
                                  dataSource: dataList,
                                  xValueMapper: (ChartData chart, _) =>
                                      chart.x.toString(),
                                  yValueMapper: (ChartData chart, _) => chart.y,
                                  dataLabelSettings: const DataLabelSettings(
                                      showZeroValue: true,
                                      color: colorMainBlue,
                                      textStyle: TextStyle(fontSize: 2)),
                                )
                              ]
                            : <ChartSeries<ChartData, String>>[
                                LineSeries<ChartData, String>(
                                  color: colorMainBlue,
                                  isVisible: true,
                                  dataSource: dataList,
                                  xValueMapper: (ChartData chart, _) =>
                                      chart.x.toString(),
                                  yValueMapper: (ChartData chart, _) => chart.y,
                                  dataLabelSettings: const DataLabelSettings(
                                      color: colorMainBlue,
                                      textStyle: TextStyle(fontSize: 2)),
                                )
                              ]);
                  } else {
                    return Container();
                  }
                })
            : FutureBuilder<List<PreTestAPIRes>?>(
                future: instance.get<UserAPIRepo>().getALlPreQuizTestByUid(
                    instance.get<UserGlobal>().id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChartData> dataListPre = [];
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      dataListPre
                          .add(ChartData(i + 1, snapshot.data![i].score!));
                    }
                    if (dataListPre.length == 1) {
                      for (int i = 2; i <= 5; i++) {
                        dataListPre.add(ChartData(i, 0));
                      }
                    }

                    return SfCartesianChart(
                        plotAreaBorderColor: colorMainBlue,
                        plotAreaBorderWidth: 0,
                        tooltipBehavior: TooltipBehavior(
                            enable: deTail == null ? false : true),
                        primaryXAxis: CategoryAxis(
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of x-axis
                        ),
                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of y-axis
                        ),
                        series: deTail == null
                            ? <ColumnSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                  color: colorMainBlue,
                                  dataSource: dataListPre,
                                  xValueMapper: (ChartData chart, _) =>
                                      chart.x.toString(),
                                  yValueMapper: (ChartData chart, _) => chart.y,
                                  dataLabelSettings: const DataLabelSettings(
                                      showZeroValue: true,
                                      color: colorMainBlue,
                                      textStyle: TextStyle(fontSize: 2)),
                                )
                              ]
                            : <ChartSeries<ChartData, String>>[
                                LineSeries<ChartData, String>(
                                  color: colorMainBlue,
                                  isVisible: true,
                                  dataSource: dataListPre,
                                  xValueMapper: (ChartData chart, _) =>
                                      chart.x.toString(),
                                  yValueMapper: (ChartData chart, _) => chart.y,
                                  dataLabelSettings: const DataLabelSettings(
                                      color: colorMainBlue,
                                      textStyle: TextStyle(fontSize: 2)),
                                )
                              ]);
                  } else {
                    return Container();
                  }
                }));
  }
}
