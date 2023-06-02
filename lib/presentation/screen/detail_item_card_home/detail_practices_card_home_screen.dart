import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/chart_data_week.dart';
import 'package:math/data/remote/model/detail_quiz_hw_response.dart';
import 'package:math/data/remote/model/pre_quiz_game_response.dart';
import 'package:math/data/remote/model/quiz_game_response.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/child_right_home_practices_input.dart';
import 'package:math/presentation/widget/line_item_content_card_home.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../application/cons/color.dart';
import '../../../application/utils/count_sign.dart';
import '../../../data/model/chart_data.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/model/pre_quiz_hw_response.dart';
import '../../../data/remote/model/result_quiz_hw_response.dart';
import '../../../main.dart';
import '../../widget/async_data_detail_hw.dart';
import '../../widget/card_data_item_home.dart';
import '../../widget/child_right_item_card_home.dart';

class DetailItemCardPractices extends StatelessWidget {
  DetailItemCardPractices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String type = ModalRoute.of(context)!.settings.arguments as String;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(
              size: size,
              onBack: () {
                Navigator.pop(context);
              },
              textTitle: 'Detail Input',
            ),
            Container(
              height: size.height * 0.9,
              padding: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.05),
              child: Column(
                children: [
                  LineContentItem(
                      size: size,
                      title: 'DATA SESSION',
                      icon: const Icon(Icons.calendar_month)),
                  Column(
                    children: [
                      ChildRightHomeInput(
                        size: size,
                        deTail: true,
                        typeGame: type,
                      ),
                      Center(
                          child: Text(
                        'Data $type result',
                        style: s14f500ColorMainTe,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
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
                    height: size.height * 0.01,
                  ),
                  LineContentItem(
                      size: size,
                      title: 'DATA WEEKLY',
                      icon: const Icon(Icons.calendar_view_week)),
                  SizedBox(
                    height: size.height * 0.4,
                    child: FutureBuilder<List<PreQuizGameAPIModel>?>(
                        future: instance
                            .get<UserAPIRepo>()
                            .getALlPreQuizGameByUidandOptionGame(
                                instance.get<UserGlobal>().id.toString(), type),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              height: size.height * 0.3,
                              width: size.width * 0.3,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: colorMainBlue,
                                  strokeWidth: 5,
                                ),
                              ),
                            );
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return ItemAsyncDataDetailHW(
                                  size: size,
                                  textTitle: 'Task ${index + 1}',
                                  listSIgn: '${snapshot.data![index].sign}',
                                  childRight: SizedBox(
                                    width: size.width * 0.45,
                                    child: FutureBuilder<
                                            List<QuizGameAPIModel>?>(
                                        future: instance
                                            .get<UserAPIRepo>()
                                            .getALlQuizGameByPreGameID(
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
                                  timeHW: "${snapshot.data![index].dateSave} ",
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
