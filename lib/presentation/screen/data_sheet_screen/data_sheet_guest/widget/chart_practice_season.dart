import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../application/cons/color.dart';
import '../../../../../application/cons/text_style.dart';
import '../../../../../application/utils/func.dart';
import '../../../../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../../../../data/model/chart_prac_week_guest.dart';
import '../../../../../main.dart';

class ChartPracSeason extends StatelessWidget {
  const ChartPracSeason({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder<List<PreQuizGameEntityData>?>(
          stream: instance.get<PreQuizGameRepo>().getAllPreQuizGame(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              List<ChartDataPraWeek> dataList = [
                ChartDataPraWeek("+", 0, 0, 0, 0),
                ChartDataPraWeek("-", 0, 0, 0, 0),
                ChartDataPraWeek("x", 0, 0, 0, 0),
                ChartDataPraWeek("/", 0, 0, 0, 0),
              ];

              for (int i = 0; i < snapshot.data!.length; i++) {
                String sign = snapshot.data![i].sign;
                String dataBack = findAveScorePra(
                    snapshot.data![i].score!, snapshot.data![i].numQ);
                if (dataBack == "YEU") {
                  dataList[findPos(sign)].y++;
                } else if (dataBack == "TRUNG BINH") {
                  dataList[findPos(sign)].y1++;
                } else if (dataBack == "KHA") {
                  dataList[findPos(sign)].y2++;
                } else {
                  dataList[findPos(sign)].y3++;
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
              return SizedBox(
                height: 30.h,
              );
            }
          }),
    );
  }
}
