import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:math/application/extension/to_get_test_model.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/domain/bloc/history/history_test_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/button_custom.dart';
import '../../widget/pre_test_widget.dart';

class HistoryTest extends StatelessWidget {
  const HistoryTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: Column(
        children: [
          AppBarWidget(
            bgColor: colorSystemWhite,
            onBack: () {
              Navigator.pop(context);
            },
            childSetting: const Icon(
              Icons.settings,
              color: colorSystemYeloow,
              size: 30,
            ),
            onSetting: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  builder: (_) {
                    return BlocProvider.value(
                      value: BlocProvider.of<HistoryTestCubit>(context),
                      child: BlocBuilder<HistoryTestCubit, HistoryTestState>(
                          buildWhen: (pre, now) {
                        return pre.timeNow != now.timeNow;
                      }, builder: (context, state) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 2.h, top: 2.h),
                          height: 18.h,
                          child: AnimationConfiguration.synchronized(
                            child: SlideAnimation(
                                child: Column(
                              children: [
                                RoundedButton(
                                  press: () {
                                    context
                                        .read<HistoryTestCubit>()
                                        .deletePreTestByDay(state.timeNow);
                                    Navigator.pop(context);
                                  },
                                  color: colorErrorPrimary,
                                  width: 80.w,
                                  height: 6.h,
                                  child: const Text(
                                    'DELETE BY DAY',
                                    style: s16f500ColorSysWhite,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                RoundedButton(
                                  press: () {
                                    context
                                        .read<HistoryTestCubit>()
                                        .deleteAllPreTest();
                                    Navigator.pop(context);
                                  },
                                  color: colorGreyTetiary,
                                  width: 80.w,
                                  height: 6.h,
                                  child: const Text(
                                    'DELETE ALL',
                                    style: s16f700ColorBlueMa,
                                  ),
                                ),
                              ],
                            )),
                          ),
                        );
                      }),
                    );
                  });
            },
          ),
          SizedBox(
            height: 80.h,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w, bottom: 4.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 04.h,
                    width: 100.w,
                    child: BlocBuilder<HistoryTestCubit, HistoryTestState>(
                        buildWhen: (previousState, state) {
                      return previousState.timeNow != state.timeNow;
                    }, builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 3.w,
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
                    height: 2.h,
                  ),
                  BlocBuilder<HistoryTestCubit, HistoryTestState>(
                      builder: (context, state) {
                    return Container(
                      child: DatePicker(
                        DateTime.now().subtract(const Duration(days: 6)),
                        height: 15.h,
                        width: 11.5.w,
                        initialSelectedDate: DateTime.now(),
                        selectionColor: colorMainBlue,
                        onDateChange: (date) {
                          context.read<HistoryTestCubit>().dateChanged(date);
                        },
                      ),
                    );
                  }),
                  BlocBuilder<HistoryTestCubit, HistoryTestState>(
                      buildWhen: (pre, now) {
                    return pre.timeNow != now.timeNow;
                  }, builder: (context, state) {
                    return Expanded(
                        child: StreamBuilder<List<PreTestEntityData>>(
                      stream: instance
                          .get<PreTestLocalRepo>()
                          .getAllPreTestByDay(state.timeNow.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return CustomScrollView(slivers: [
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    childCount: snapshot.data!.length,
                                    (context, index) {
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
                                              bottom: 2.h, top: 2.h),
                                          height: 18.h,
                                          child: AnimationConfiguration
                                              .staggeredList(
                                                  position: index,
                                                  child: SlideAnimation(
                                                      child: Column(
                                                    children: [
                                                      RoundedButton(
                                                        press: () {
                                                          context
                                                              .read<
                                                                  HistoryTestCubit>()
                                                              .deletePreTest(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .id);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        color:
                                                            colorErrorPrimary,
                                                        width: 80.w,
                                                        height: 6.h,
                                                        child: const Text(
                                                          'DELETE',
                                                          style:
                                                              s16f500ColorSysWhite,
                                                        ),
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      RoundedButton(
                                                        press: () {
                                                          Navigator.pop(
                                                              context);

                                                          Navigator.pushNamed(
                                                              context,
                                                              Routers
                                                                  .detailTest,
                                                              arguments:
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .id);
                                                        },
                                                        color: colorGreyTetiary,
                                                        width: 80.w,
                                                        height: 6.h,
                                                        child: const Text(
                                                          'DETAIL',
                                                          style:
                                                              s16f700ColorBlueMa,
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        );
                                      });
                                },
                                child: PreTestTitle(
                                    snapshot.data![index].toGetTestModel()),
                              ));
                            }))
                          ]);
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
