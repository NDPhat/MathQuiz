import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../application/cons/color.dart';
import '../../../../data/model/chart_data_datasheet.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../../main.dart';

class ChartSeasonTest extends StatelessWidget {
  const ChartSeasonTest({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        height: 30.h,
        child: FutureBuilder<List<PreTestAPIRes>?>(
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
                    legend: Legend(isVisible: true, width: '20'),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      //Hide the axis line of x-axis
                    ),
                    primaryYAxis: NumericAxis(
                      isVisible: true,
                      minimum: 0,
                      //Hide the gridlines of y-axis
                      majorGridLines: const MajorGridLines(width: 0),
                      //Hide the axis line of y-axis
                    ),
                    series: <ChartSeries<ChartDataSheet, String>>[
                      LineSeries<ChartDataSheet, String>(
                        color: colorMainBlue,
                        isVisible: true,
                        name: "true".tr(),
                        dataSource: dataListPre,
                        xValueMapper: (ChartDataSheet chart, _) =>
                            chart.x.toString(),
                        yValueMapper: (ChartDataSheet chart, _) => chart.t,
                        dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: GoogleFonts.abel(fontSize: 13)),
                      ),
                      LineSeries<ChartDataSheet, String>(
                        color: colorErrorPrimary,
                        isVisible: true,
                        name: "false".tr(),
                        dataSource: dataListPre,
                        xValueMapper: (ChartDataSheet chart, _) =>
                            chart.x.toString(),
                        yValueMapper: (ChartDataSheet chart, _) => chart.f,
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
