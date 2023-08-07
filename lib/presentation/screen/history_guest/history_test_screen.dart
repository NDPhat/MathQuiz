import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:math/application/extension/to_get_test_model.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../domain/bloc/history/history_cubit.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';
import '../../widget/pre_test_widget.dart';

class HistoryTest extends StatelessWidget {
  const HistoryTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w, bottom: 2.h),
        child: Column(
          children: [
            SizedBox(
              height: 04.h,
              width: 100.w,
              child: BlocBuilder<HistoryCubit, HistoryState>(
                  buildWhen: (previousState, state) {
                return previousState.timeTestNow != state.timeTestNow;
              }, builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 3.w,
                      ),
                      child: Text(
                        'day'.tr(),
                        style: s18f700ColorBlueMa,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        state.timeTestNow,
                        style: s18f700ColorBlueMa,
                      ),
                    ),
                  ],
                );
              }),
            ),
            BlocBuilder<HistoryCubit, HistoryState>(builder: (context, state) {
              return DatePicker(
                DateTime.now().subtract(const Duration(days: 6)),
                height: 10.h,
                width: 11.5.w,
                initialSelectedDate: DateTime.now(),
                selectionColor: colorMainBlue,
                onDateChange: (date) {
                  context.read<HistoryCubit>().dateTestChanged(date);
                },
              );
            }),
            BlocBuilder<HistoryCubit, HistoryState>(buildWhen: (pre, now) {
              return pre.timeTestNow != now.timeTestNow;
            }, builder: (context, state) {
              return Expanded(
                  child: StreamBuilder<List<PreTestEntityData>>(
                stream: instance
                    .get<PreTestLocalRepo>()
                    .getAllPreTestByDay(state.timeTestNow.toString()),
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
                                    padding:
                                        EdgeInsets.only(bottom: 2.h, top: 2.h),
                                    height: 18.h,
                                    child: AnimationConfiguration.staggeredList(
                                        position: index,
                                        child: SlideAnimation(
                                            child: Column(
                                          children: [
                                            RoundedButton(
                                              press: () {
                                                context
                                                    .read<HistoryCubit>()
                                                    .deletePreTest(snapshot
                                                        .data![index].id);
                                                Navigator.pop(context);
                                              },
                                              color: colorErrorPrimary,
                                              width: 80.w,
                                              height: 6.h,
                                              child:  Text(
                                                'delete'.tr(),
                                                style: s16f500ColorSysWhite,
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                            RoundedButton(
                                              press: () {
                                                Navigator.pop(context);

                                                Navigator.pushNamed(
                                                    context, Routers.detailTest,
                                                    arguments: snapshot
                                                        .data![index].id);
                                              },
                                              color: colorGreyTetiary,
                                              width: 80.w,
                                              height: 6.h,
                                              child:  Text(
                                                'view'.tr(),
                                                style: s16f700ColorBlueMa,
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
                    return  Center(
                      child: Text(
                        '${'NOTHING ADDED'.tr()} !',
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
    );
  }
}
