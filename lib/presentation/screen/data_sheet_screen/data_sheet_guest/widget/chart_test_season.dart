import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../application/cons/color.dart';
import '../../../../../application/cons/text_style.dart';
import '../../../../../application/utils/func.dart';
import '../../../../../data/model/chart_prac_week_guest.dart';
import '../../../../../main.dart';

class ChartTestSeason extends StatelessWidget {
  const ChartTestSeason({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder<List<PreTestEntityData>?>(
          stream: instance.get<PreTestLocalRepo>().getAllPreTest(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              List<ChartDataPraWeek> dataList = [
                ChartDataPraWeek("A", 0, 0, 0, 0),
                ChartDataPraWeek("B", 0, 0, 0, 0),
                ChartDataPraWeek("C", 0, 0, 0, 0),
                ChartDataPraWeek("D", 0, 0, 0, 0),
              ];

              for (int i = 0; i < snapshot.data!.length; i++) {
                String dataBack = findAveScoreTest(
                    snapshot.data![i].score!, snapshot.data![i].sumQuiz!);
                if (dataBack == "D") {
                  dataList[3].y++;
                } else if (dataBack == "C") {
                  dataList[2].y1++;
                } else if (dataBack == "B") {
                  dataList[1].y2++;
                } else {
                  dataList[0].y3++;
                }
              }

              return Column(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 30.h,
                    child: SfCartesianChart(
                        plotAreaBorderColor: colorMainBlue,
                        plotAreaBorderWidth: 0,
                        legend: Legend(isVisible: true, width: '20'),
                        tooltipBehavior: TooltipBehavior(),
                        primaryXAxis: CategoryAxis(
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of x-axis
                        ),
                        primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                          majorGridLines: const MajorGridLines(width: 0),
                          //Hide the axis line of y-axis
                        ),
                        series: <ChartSeries<ChartDataPraWeek, String>>[
                          ColumnSeries<ChartDataPraWeek, String>(
                            color: colorErrorPrimary,
                            isVisible: true,
                            name: "D",
                            dataSource: dataList,
                            xValueMapper: (ChartDataPraWeek chart, _) =>
                                chart.x.toString(),
                            yValueMapper: (ChartDataPraWeek chart, _) =>
                                chart.y,
                            width: 1,
                            // Spacing between the columns
                            spacing: 0.2,
                            dataLabelSettings: const DataLabelSettings(
                                color: colorErrorPrimary,
                                textStyle: TextStyle(fontSize: 2)),
                          ),
                          ColumnSeries<ChartDataPraWeek, String>(
                            color: colorSystemYeloow,
                            isVisible: true,
                            name: "C",
                            dataSource: dataList,
                            xValueMapper: (ChartDataPraWeek chart, _) =>
                                chart.x.toString(),
                            yValueMapper: (ChartDataPraWeek chart, _) =>
                                chart.y1,
                            width: 1,
                            // Spacing between the columns
                            spacing: 0.2,
                            dataLabelSettings: const DataLabelSettings(
                                color: colorSystemYeloow,
                                textStyle: TextStyle(fontSize: 2)),
                          ),
                          ColumnSeries<ChartDataPraWeek, String>(
                            color: Colors.green,
                            isVisible: true,
                            name: "B",
                            dataSource: dataList,
                            xValueMapper: (ChartDataPraWeek chart, _) =>
                                chart.x.toString(),
                            yValueMapper: (ChartDataPraWeek chart, _) =>
                                chart.y2,
                            width: 1,
                            // Spacing between the columns
                            spacing: 0.2,
                            dataLabelSettings: const DataLabelSettings(
                                color: Colors.green,
                                textStyle: TextStyle(fontSize: 2)),
                          ),
                          ColumnSeries<ChartDataPraWeek, String>(
                            color: colorMainBlue,
                            isVisible: true,
                            dataSource: dataList,
                            name: "A",
                            xValueMapper: (ChartDataPraWeek chart, _) =>
                                chart.x.toString(),
                            yValueMapper: (ChartDataPraWeek chart, _) =>
                                chart.y3,
                            width: 1,
                            // Spacing between the columns
                            spacing: 0.2,
                            dataLabelSettings: const DataLabelSettings(
                                color: colorMainBlue,
                                textStyle: TextStyle(fontSize: 2)),
                          ),
                        ]),
                  ),
                  const Center(
                    child: Text(
                      'Data practice by week ',
                      style: s12f400ColorGreyTe,
                    ),
                  ),
                ],
              );
            } else {
              return  SizedBox(
                height: 30.h,
              );
            }
          }),
    );
  }
}
