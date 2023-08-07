import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../application/cons/color.dart';
import '../../data/model/chart_data.dart';
import '../../data/model/chart_data_datasheet.dart';
import '../../data/model/user_global.dart';
import '../../data/remote/api/Repo/api_user_repo.dart';
import '../../data/remote/model/result_quiz_hw_response.dart';
import '../../main.dart';

class ChildRightHW extends StatelessWidget {
  ChildRightHW({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 46.w,
        height: 9.h,
        child: type == "hw"
            ? FutureBuilder<List<ResultQuizHWAPIModel>?>(
                future: instance.get<UserAPIRepo>().getALlResultQuizHWByUserID(
                    instance.get<UserGlobal>().id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChartDataSheet> dataList = [];
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      dataList.add(ChartDataSheet(
                          i + 1,
                          snapshot.data![i].score!,
                          snapshot.data![i].numQ! - snapshot.data![i].score!));
                    }

                    return SfCartesianChart(
                        plotAreaBorderColor: colorMainBlue,
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of x-axis
                        ),
                        primaryYAxis: NumericAxis(
                            isVisible: false,
                            //Hide the gridlines of y-axis
                            majorGridLines: const MajorGridLines(width: 0),
                            maximum: 10
                            //Hide the axis line of y-axis
                            ),
                        series: <ColumnSeries<ChartDataSheet, String>>[
                          ColumnSeries<ChartDataSheet, String>(
                            color: colorMainBlue,
                            dataSource: dataList,
                            xValueMapper: (ChartDataSheet chart, _) =>
                                chart.x.toString(),
                            yValueMapper: (ChartDataSheet chart, _) => chart.t,
                            dataLabelSettings: DataLabelSettings(
                                showZeroValue: true,
                                isVisible: true,
                                textStyle: GoogleFonts.abel(fontSize: 13)),
                          ),
                          ColumnSeries<ChartDataSheet, String>(
                            color: colorErrorPrimary,
                            dataSource: dataList,
                            xValueMapper: (ChartDataSheet chart, _) =>
                                chart.x.toString(),
                            yValueMapper: (ChartDataSheet chart, _) => chart.f,
                            dataLabelSettings: DataLabelSettings(
                                showZeroValue: true,
                                isVisible: true,
                                textStyle: GoogleFonts.abel(fontSize: 13)),
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
                    List<ChartDataSheet> dataListPre = [];
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      dataListPre.add(ChartDataSheet(
                          i + 1,
                          snapshot.data![i].score!,
                          snapshot.data![i].sumQ! - snapshot.data![i].score!));
                    }

                    return SfCartesianChart(
                        plotAreaBorderColor: colorMainBlue,
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of x-axis
                        ),
                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                          isVisible: false,
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of y-axis
                        ),
                        series: <ColumnSeries<ChartDataSheet, String>>[
                          ColumnSeries<ChartDataSheet, String>(
                            color: colorMainBlue,
                            dataSource: dataListPre,
                            xValueMapper: (ChartDataSheet chart, _) =>
                                chart.x.toString(),
                            yValueMapper: (ChartDataSheet chart, _) => chart.t,
                            dataLabelSettings: DataLabelSettings(
                                showZeroValue: true,
                                isVisible: true,
                                textStyle: GoogleFonts.abel(fontSize: 13)),
                          ),
                          ColumnSeries<ChartDataSheet, String>(
                            color: colorErrorPrimary,
                            dataSource: dataListPre,
                            xValueMapper: (ChartDataSheet chart, _) =>
                                chart.x.toString(),
                            yValueMapper: (ChartDataSheet chart, _) => chart.f,
                            dataLabelSettings: DataLabelSettings(
                                showZeroValue: true,
                                isVisible: true,
                                textStyle: GoogleFonts.abel(fontSize: 13)),
                          ),
                        ]);
                  } else {
                    return Container();
                  }
                }));
  }
}
