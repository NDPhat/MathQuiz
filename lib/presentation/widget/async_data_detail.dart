import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/text_style.dart';

class ItemAsyncDataDetail extends StatelessWidget {
  const ItemAsyncDataDetail({
    Key? key,
    required this.textTitle,
    required this.childRight,
    required this.timeSave,
    required this.colorBorder,
    required this.onPress,
    required this.score,
    required this.totalQuiz,
  }) : super(key: key);
  final String textTitle;
  final String score;
  final String totalQuiz;
  final String timeSave;
  final Widget childRight;
  final Color colorBorder;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
        height: 18.h,
        width: 20.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 15.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textTitle,
                      style: GoogleFonts.abel(color: colorBorder, fontSize: 18),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "${"score".tr()} :",
                          style: GoogleFonts.abel(color: colorBorder, fontSize: 18),
                        ),  Text(
                          "$score / $totalQuiz",
                          style: GoogleFonts.abel(color: colorBorder, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10.h,
              width: 5.w,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 2, color: colorBorder),
                ),
              ),
            ),
            SizedBox(
              width: 65.w,
              height: 16.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 5.w),
                    alignment: Alignment.centerRight,
                    height: 3.w,
                    width: 65.w,
                    child: Text(
                      timeSave,
                      style: s12f400ColorGreyTe,
                    ),
                  ),
                  SizedBox(height: 13.h, width: 60.w, child: childRight)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
