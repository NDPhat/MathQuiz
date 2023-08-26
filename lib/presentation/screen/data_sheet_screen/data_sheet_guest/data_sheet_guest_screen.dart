import 'package:awesome_dialog/awesome_dialog.dart';
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
import '../../../../data/model/user_global.dart';
import '../../../../domain/bloc/history/history_cubit.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class DataSheetGuestScreen extends StatelessWidget {
  const DataSheetGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showPraSettingDialog(String day) {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        desc: "choose one".tr(),
        descTextStyle: s20GgBarColorMainTeal,
        btnOkText: "DELETE ALL".tr(),
        btnCancelText: "DELETE BY DAY".tr(),
        btnOkOnPress: () {
          context.read<HistoryCubit>().deleteAllPreQuiz();
        },
        btnCancelOnPress: () {
          context.read<HistoryCubit>().deletePreQuizByDay(day);
        },
      ).show();
    }

    showTestSettingDialog(String day) {
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        desc: "choose one".tr(),
        descTextStyle: s20GgBarColorMainTeal,
        btnOkText: "DELETE ALL".tr(),
        btnCancelText: "DELETE BY DAY".tr(),
        btnOkOnPress: () {
          context.read<HistoryCubit>().deleteAllPreTest();
        },
        btnCancelOnPress: () {
          context.read<HistoryCubit>().deletePreTestByDay(day);
        },
      ).show();
    }

    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
          onBack: () {
            Navigator.pushNamed(context, Routers.homeGuest);
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
                      child: BlocSelector<HistoryCubit, HistoryState, String>(
                          selector: (state) {
                        return state.timePraNow;
                      }, builder: (context, state) {
                        return LineContentItem(
                            title: "practice".tr().toString(),
                            icon: const Icon(Icons.settings),
                            iconOnTap: () {
                              showPraSettingDialog(state);
                            },
                            colorBG: colorMainTealPri);
                      })),
                  const HistoryPractice(),
                  Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: BlocSelector<HistoryCubit, HistoryState, String>(
                          selector: (state) {
                        return state.timeTestNow;
                      }, builder: (context, state) {
                        return LineContentItem(
                            title: "test".tr().toString(),
                            icon: const Icon(Icons.settings),
                            iconOnTap: () {
                              showTestSettingDialog(state);
                            },
                            colorBG: colorMainBlue);
                      })),
                  const HistoryTest(),
                ],
              ),
            ),
          )),
    );
  }
}
