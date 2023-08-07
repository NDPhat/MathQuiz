import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:math/presentation/screen/history_guest/history_pratice_screen.dart';
import 'package:math/presentation/screen/history_guest/history_test_screen.dart';
import 'package:math/presentation/widget/button_custom.dart';
import 'package:math/presentation/widget/line_item_content_card_home.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/text_style.dart';
import '../../../../domain/bloc/history/history_cubit.dart';
import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class DataSheetGuestScreen extends StatelessWidget {
  const DataSheetGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showModelBottomSettingTest() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<HistoryCubit>(context),
              child: BlocBuilder<HistoryCubit, HistoryState>(
                  buildWhen: (pre, now) {
                return pre.timeTestNow != now.timeTestNow;
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
                                .read<HistoryCubit>()
                                .deletePreTestByDay(state.timeTestNow);
                            Navigator.pop(context);
                          },
                          color: colorErrorPrimary,
                          width: 80.w,
                          height: 6.h,
                          child:  Text(
                            "DELETE BY DAY".tr(),
                            style: s16f500ColorSysWhite,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        RoundedButton(
                          press: () {
                            context.read<HistoryCubit>().deleteAllPreTest();
                            Navigator.pop(context);
                          },
                          color: colorGreyTetiary,
                          width: 80.w,
                          height: 6.h,
                          child:  Text(
                            "DELETE ALL".tr(),
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
    }

    void showModelBottomSettingPra() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          builder: (_) {
            return BlocProvider.value(
              value: BlocProvider.of<HistoryCubit>(context),
              child: BlocBuilder<HistoryCubit, HistoryState>(
                  buildWhen: (pre, now) {
                return pre.timePraNow != now.timePraNow;
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
                                .read<HistoryCubit>()
                                .deletePreQuizByDay(state.timePraNow);
                            Navigator.pop(context);
                          },
                          color: colorErrorPrimary,
                          width: 80.w,
                          height: 6.h,
                          child:  Text(
                            "DELETE BY DAY".tr(),
                            style: s16f500ColorSysWhite,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        RoundedButton(
                          press: () {
                            context.read<HistoryCubit>().deleteAllPreQuiz();
                            Navigator.pop(context);
                          },
                          color: colorGreyTetiary,
                          width: 80.w,
                          height: 6.h,
                          child:  Text(
                            "DELETE ALL".tr(),
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
    }

    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
          onBack: () {
            Navigator.pop(context);
          },
          colorTextAndIcon: Colors.black,
          textNow: 'history'.tr().toString(),
          onPressHome: () {},
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: LineContentItem(
                        title: "practice".tr().toString(),
                        icon: const Icon(Icons.settings),
                        iconOnTap: () {
                          showModelBottomSettingPra();
                        },
                        colorBG: colorMainTealPri),
                  ),
                  const HistoryPractice(),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: LineContentItem(
                        title: "test".tr().toString(),
                        icon: const Icon(Icons.settings),
                        iconOnTap: () {
                          showModelBottomSettingTest();
                        },
                        colorBG: colorMainBlue),
                  ),
                  const HistoryTest(),
                ],
              ),
            ),
          )),
    );
  }
}
