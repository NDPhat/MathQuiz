import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:math/application/extension/to_get_model.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';

import '../../cons/color.dart';
import '../../cons/text_style.dart';
import '../../domain/bloc/history/history_pra_cubit.dart';
import '../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';
import '../../widget/pre_quiz_title.dart';

class HistoryPractice extends StatelessWidget {
  const HistoryPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.school),
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.04,
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
              width: size.width,
              child: BlocBuilder<HistoryPraCubit, HistoryPraState>(
                  buildWhen: (previousState, state) {
                return previousState.timeNow != state.timeNow;
              }, builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: size.width * 0.03,
                      ),
                      child: const Text(
                        'DAY ',
                        style: s18f700ColorBlueMa,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        state.timeNow,
                        style: s18f700ColorBlueMa,
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            BlocBuilder<HistoryPraCubit, HistoryPraState>(
                builder: (context, state) {
              return DatePicker(
                DateTime.now().subtract(const Duration(days: 6)),
                height: size.height * 0.15,
                width: size.width * 0.115,
                initialSelectedDate: DateTime.now(),
                selectionColor: colorMainBlue,
                onDateChange: (date) {
                  context.read<HistoryPraCubit>().dateChanged(date);
                },
              );
            }),
            BlocBuilder<HistoryPraCubit, HistoryPraState>(
                buildWhen: (pre, now) {
              return pre.timeNow != now.timeNow;
            }, builder: (context, state) {
              return Expanded(
                  child: StreamBuilder<List<PreQuizEntityData>>(
                stream: instance
                    .get<PreQuizLocalRepo>()
                    .getAllPreQuizByDay(state.timeNow.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25)),
                                  ),
                                  builder: (_) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          bottom: size.height * 0.02,
                                          top: size.height * 0.02),
                                      height: size.height * 0.18,
                                      child:
                                          AnimationConfiguration.staggeredList(
                                              position: index,
                                              child: SlideAnimation(
                                                  child: Column(
                                                children: [
                                                  RoundedButton(
                                                    press: () {
                                                      context
                                                          .read<
                                                              HistoryPraCubit>()
                                                          .deletePreQuiz(
                                                              snapshot
                                                                  .data![index]
                                                                  .id);
                                                      Navigator.pop(context);
                                                    },
                                                    color: colorErrorPrimary,
                                                    width: size.width * 0.8,
                                                    height: size.height * 0.06,
                                                    child: const Text(
                                                      'DELETE',
                                                      style:
                                                          s16f500ColorSysWhite,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  RoundedButton(
                                                    press: () {
                                                      Navigator.pop(context);

                                                      Navigator.pushNamed(
                                                          context,
                                                          Routers.checkAnswer,
                                                          arguments: snapshot
                                                              .data![index].id);
                                                    },
                                                    color: colorGreyTetiary,
                                                    width: size.width * 0.8,
                                                    height: size.height * 0.06,
                                                    child: const Text(
                                                      'DETAIL',
                                                      style: s16f700ColorBlueMa,
                                                    ),
                                                  ),
                                                ],
                                              ))),
                                    );
                                  });
                            },
                            child: PreQuizTitle(
                                snapshot.data![index].toGetModel()),
                          ));
                        });
                  } else {
                    return const Center(
                      child: Text(
                        'NOTHING ADDED !!',
                        style: s20f700ColorMBlue,
                      ),
                    );
                  }
                },
              ));
            }),
            RoundedButton(
              press: () {
                Navigator.pop(context);
              },
              color: colorBlueQuaternery,
              width: size.width * 0.8,
              height: size.height * 0.06,
              child: const Text(
                'DETAIL',
                style: s20f700ColorErrorPro,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
