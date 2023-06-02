import 'package:flutter/material.dart';
import 'package:math/data/remote/model/pre_quiz_game_response.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../application/cons/color.dart';
import '../../data/model/chart_data.dart';
import '../../data/model/user_global.dart';
import '../../data/remote/api/Repo/api_user_repo.dart';
import '../../data/remote/model/result_quiz_hw_response.dart';
import '../../main.dart';

class ChildRightHomeInput extends StatelessWidget {
  ChildRightHomeInput({
    Key? key,
    required this.size,
    this.deTail, required this.typeGame,

  }) : super(key: key);
  final Size size;
  final String typeGame;
  bool? deTail;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: deTail == null ? size.width * 0.46 : size.width,
        height: deTail == null ? size.height * 0.09 : size.height * 0.3,
        child: FutureBuilder<List<PreQuizGameAPIModel>?>(
            future: instance
                .get<UserAPIRepo>()
                .getALlPreQuizGameByUidandOptionGame(
                    instance.get<UserGlobal>().id.toString(), typeGame),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ChartData> dataList = [];
                for (int i = 0; i < snapshot.data!.length; i++) {
                  dataList.add(ChartData(i + 1, snapshot.data![i].score!));
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
            }));
  }
}
