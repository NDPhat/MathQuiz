import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/data/remote/api/Repo/pre_pra_repo.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../application/cons/color.dart';
import '../../data/model/chart_data_datasheet.dart';
import '../../data/model/user_global.dart';
import '../../data/remote/model/pre_pra_res.dart';
import '../../main.dart';

class ChildRightHomePractice extends StatelessWidget {
  ChildRightHomePractice({
    Key? key,
    this.deTail,
    required this.typeGame,
  }) : super(key: key);
  final String typeGame;
  bool? deTail;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: deTail == null ? 46.w : 100.w,
        height: deTail == null ? 9.h : 30.h,
        child: FutureBuilder<List<PrePraAPIModel>?>(
            future: instance
                .get<PrePraRepo>()
                .getALlPreQuizGameByUidandOptionGame(
                    instance.get<UserGlobal>().id.toString(), typeGame),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ChartDataSheet> dataList = [];
                for (int i = 0; i < snapshot.data!.length; i++) {
                  dataList.add(ChartDataSheet(i + 1, snapshot.data![i].score!,
                      snapshot.data![i].numQ! - snapshot.data![i].score!));
                }

                return SfCartesianChart(
                    plotAreaBorderColor: colorMainBlue,
                    plotAreaBorderWidth: 0,
                    tooltipBehavior:
                        TooltipBehavior(enable: deTail == null ? false : true),
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      //Hide the axis line of x-axis
                    ),
                    primaryYAxis: NumericAxis(
                      isVisible: false,
                      //Hide the gridlines of y-axis
                      majorGridLines: const MajorGridLines(width: 0),
                      //Hide the axis line of y-axis
                    ),
                    series: deTail == null
                        ? <ColumnSeries<ChartDataSheet, String>>[
                            ColumnSeries<ChartDataSheet, String>(
                              color: colorMainBlue,
                              dataSource: dataList,
                              xValueMapper: (ChartDataSheet chart, _) =>
                                  chart.x.toString(),
                              yValueMapper: (ChartDataSheet chart, _) =>
                                  chart.t,
                            ),
                            ColumnSeries<ChartDataSheet, String>(
                              color: colorErrorPrimary,
                              dataSource: dataList,
                              xValueMapper: (ChartDataSheet chart, _) =>
                                  chart.x.toString(),
                              yValueMapper: (ChartDataSheet chart, _) =>
                                  chart.f,
                            )
                          ]
                        : <ChartSeries<ChartDataSheet, String>>[
                            LineSeries<ChartDataSheet, String>(
                              color: colorMainBlue,
                              isVisible: true,
                              dataSource: dataList,
                              xValueMapper: (ChartDataSheet chart, _) =>
                                  chart.x.toString(),
                              yValueMapper: (ChartDataSheet chart, _) =>
                                  chart.t,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  textStyle: GoogleFonts.abel(fontSize: 13)),
                            )
                          ]);
              } else {
                return Container();
              }
            }));
  }
}
