import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/extension/to_get_model.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';
import 'package:sizer/sizer.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';

import '../../../application/utils/format.dart';
import '../../../application/utils/func.dart';
import '../../../domain/bloc/history/history_cubit.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/dot_page_indicator.dart';
import '../../widget/indicator.dart';
import '../../widget/pre_quiz_title.dart';

class HistoryPractice extends StatefulWidget {
  const HistoryPractice({Key? key}) : super(key: key);
  @override
  State<HistoryPractice> createState() => HistoryPracticeState();
}

class HistoryPracticeState extends State<HistoryPractice> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    context
        .read<HistoryCubit>()
        .getLengthQuizGame(formatDateInput.format(DateTime.now()));
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
        Navigator.pushNamed(context, Routers.detailQuizGame, arguments: id);
      },
      btnCancelOnPress: () {
        context.read<HistoryCubit>().deletePreQuiz(id);
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
            border: Border.all(color: colorMainTealPri, width: 2)),
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
                return previousState.timePraNow != state.timePraNow;
              }, builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'day'.tr(),
                      style: GoogleFonts.abel(
                          color: colorMainTealPri, fontSize: 18),
                    ),
                    SizedBox(
                      child: Text(
                        state.timePraNow,
                        style: GoogleFonts.abel(
                            color: colorMainTealPri, fontSize: 18),
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
                selectionColor: colorMainTealPri,
                onDateChange: (date) {
                  context.read<HistoryCubit>().datePraChanged(date);
                },
              );
            }),

            /// BLOC DATA
            BlocBuilder<HistoryCubit, HistoryState>(buildWhen: (pre, now) {
              return pre.timePraNow != now.timePraNow ||
                  pre.pagePraNow != now.pagePraNow ||
                  pre.lengthPra != now.lengthPra;
            }, builder: (context, state) {
              return Expanded(
                  child: StreamBuilder<List<PreQuizGameEntityData>>(
                stream: instance
                    .get<PreQuizGameRepo>()
                    .getAllPreQuizGameByDayWithPagination(
                        state.timePraNow.toString(), state.pagePraNow),
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
                          child:
                              PreQuizTitle(snapshot.data![index].toGetModel()),
                        ));
                      }))
                    ]);
                  } else {
                    return Center(
                      child: Text(
                        'NOTHING ADDED !!'.tr(),
                        style: GoogleFonts.abel(
                            color: colorMainTealPri, fontSize: 20),
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
                  return pre.pagePraNow != now.pagePraNow;
                }, builder: (context, state) {
                  return DotPageIndicator(
                    colorBorder: colorMainTealPri,
                    icon: SvgPicture.asset(
                      "assets/icon/back.svg",
                      color: colorMainTealPri,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      context.read<HistoryCubit>().pagePraMinus();
                    },
                  );
                }),
                SizedBox(
                  width: 2.w,
                ),
                BlocBuilder<HistoryCubit, HistoryState>(buildWhen: (pre, now) {
                  return pre.timePraNow != now.timePraNow ||
                      pre.lengthPra != now.lengthPra ||
                      pre.pagePraNow != now.pagePraNow;
                }, builder: (context, state) {
                  return DotIndicator(
                    totalPage: findLength(state.lengthPra).toString(),
                    colorBorder: colorMainTealPri,
                    pageIndex: state.pagePraNow.toString(),
                  );
                }),
                SizedBox(
                  width: 2.w,
                ),
                BlocBuilder<HistoryCubit, HistoryState>(buildWhen: (pre, now) {
                  return pre.pagePraNow != now.pagePraNow;
                }, builder: (context, state) {
                  return DotPageIndicator(
                    colorBorder: colorMainTealPri,
                    icon: SvgPicture.asset(
                      "assets/icon/next.svg",
                      color: colorMainTealPri,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      context.read<HistoryCubit>().pagePraPlus();
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
