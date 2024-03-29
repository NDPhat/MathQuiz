import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class ItemAsyncDataPageHome extends StatelessWidget {
  const ItemAsyncDataPageHome({
    Key? key,
    required this.textTitle,
    required this.totalQ,
    required this.trueAve,
    required this.childRight,
    required this.timeNow,
    required this.onTap,
    required this.colorBorder,
  }) : super(key: key);
  final String textTitle;
  final String totalQ;
  final String timeNow;
  final String trueAve;
  final Widget childRight;
  final Color colorBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: colorSystemWhite,
            border: Border.all(color: colorBorder),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h),
        width: 90.w,
        height: 20.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 30.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textTitle,
                      style: s16f500ColorGreyTe,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${'total quiz'.tr()} : $totalQ",
                      style: s16f500ColorError,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${'average'.tr()} : $trueAve%",
                      style: s14f500ColorMainTe,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 05.h,
                    child: Text(
                      timeNow,
                      style: s12f400ColorGreyTe,
                    ),
                  ),
                  SizedBox(height: 13.h, child: childRight)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
