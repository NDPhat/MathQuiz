import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/extension/to_get_test_model.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/presentation/widget/pre_test_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/utils/format.dart';
import '../../../application/utils/func.dart';
import '../../../data/local/repo/pre_test/pre_test__local_repo.dart';
import '../../../domain/bloc/history/history_cubit.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/dot_page_indicator.dart';
import '../../widget/indicator.dart';

class HistoryTest extends StatefulWidget {
  const HistoryTest({Key? key}) : super(key: key);
  @override
  State<HistoryTest> createState() => HistoryTestState();
}

class HistoryTestState extends State<HistoryTest> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    context
        .read<HistoryCubit>()
        .getLengthTest(formatDateInput.format(DateTime.now()));
  }

  showInfoDialog(int id) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      desc: "choose one".tr(),
      descTextStyle: s20GgBarColorMainTeal,
      btnOkText: "view".tr(),
      btnCancelText: "delete".tr(),
      btnOkOnPress: () {
        Navigator.pushNamed(context, Routers.detailTest, arguments: id);
      },
      btnCancelOnPress: () {
        context.read<HistoryCubit>().deletePreTest(id);
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w, bottom: 2.h),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: colorMainBlue, width: 2)),
        child: Column(
          children: [
            /// LINE CONTENT
            Container(
              padding: EdgeInsets.only(
                left: 3.w,
              ),
              height: 4.h,
              width: 100.w,
              child: BlocBuilder<HistoryCubit, HistoryState>(
                  buildWhen: (previousState, state) {
                return previousState.timeTestNow != state.timeTestNow;
              }, builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'day'.tr(),
                      style: GoogleFonts.abel(
                          color: colorMainBlue, fontSize: 18),
                    ),
                    SizedBox(
                      child: Text(
                        state.timeTestNow,
                        style: GoogleFonts.abel(
                            color: colorMainBlue, fontSize: 18),
                      ),
                    ),
                  ],
                );
              }),
            ),

            ///BLOC DAY
            BlocBuilder<HistoryCubit, HistoryState>(builder: (context, state) {
              return DatePicker(
                DateTime.now().subtract(const Duration(days: 6)),
                height: 10.h,
                width: 11.5.w,
                dateTextStyle: const TextStyle(fontSize: 12),
                dayTextStyle: const TextStyle(fontSize: 10),
                monthTextStyle: const TextStyle(fontSize: 12),
                initialSelectedDate: DateTime.now(),
                selectionColor: colorMainBlue,
                onDateChange: (date) {
                  context.read<HistoryCubit>().dateTestChanged(date);
                },
              );
            }),

            /// BLOC DATA
            BlocBuilder<HistoryCubit, HistoryState>(buildWhen: (pre, now) {
              return pre.timeTestNow != now.timeTestNow ||
                  pre.pageTestNow != now.pageTestNow ||
                  pre.lengthTest != now.lengthTest;
            }, builder: (context, state) {
              return Expanded(
                  child: StreamBuilder<List<PreTestLocalEntityData>>(
                stream: instance
                    .get<PreTestLocalRepo>()
                    .getAllPreTestByDayWithPagination(
                        state.timeTestNow.toString(), state.pageTestNow),
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
                            showInfoDialog(snapshot.data![index].id);
                          },
                          child: PreTestTitle(
                              snapshot.data![index].toGetTestModel()),
                        ));
                      }))
                    ]);
                  } else {
                    return Center(
                      child: Text(
                        'NOTHING ADDED !!'.tr(),
                        style: GoogleFonts.abel(
                            color: colorMainBlue, fontSize: 20),
                      ),
                    );
                  }
                },
              ));
            }),
            Container(
              padding: EdgeInsets.only(right: 5.w),
              width: 100.w,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                BlocBuilder<HistoryCubit, HistoryState>(buildWhen: (pre, now) {
                  return pre.pageTestNow != now.pageTestNow;
                }, builder: (context, state) {
                  return DotPageIndicator(
                    colorBorder: colorMainBlue,
                    icon: SvgPicture.asset(
                      "assets/icon/back.svg",
                      color: colorMainBlue,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      context.read<HistoryCubit>().pageTestMinus();
                    },
                  );
                }),
                SizedBox(
                  width: 2.w,
                ),
                BlocBuilder<HistoryCubit, HistoryState>(buildWhen: (pre, now) {
                  return pre.timeTestNow != now.timeTestNow ||
                      pre.lengthTest != now.lengthTest ||
                      pre.pageTestNow != now.pageTestNow;
                }, builder: (context, state) {
                  return DotIndicator(
                    totalPage: findLength(state.lengthTest).toString(),
                    colorBorder: colorMainBlue,
                    pageIndex: state.pageTestNow.toString(),
                  );
                }),
                SizedBox(
                  width: 2.w,
                ),
                BlocBuilder<HistoryCubit, HistoryState>(buildWhen: (pre, now) {
                  return pre.pageTestNow != now.pageTestNow;
                }, builder: (context, state) {
                  return DotPageIndicator(
                    colorBorder: colorMainBlue,
                    icon: SvgPicture.asset(
                      "assets/icon/next.svg",
                      color: colorMainBlue,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      context.read<HistoryCubit>().pageTestPlus();
                    },
                  );
                })
              ]),
            )
          ],
        ),
      ),
    );
  }
}
