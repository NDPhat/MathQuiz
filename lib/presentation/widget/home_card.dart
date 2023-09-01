import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/constants.dart';
import '../../application/cons/text_style.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.title,
      required this.colorBorder})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  final Color colorBorder;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 15.h,
        decoration: BoxDecoration(
          color: colorSystemWhite,
          border: Border.all(color: colorBorder),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              color: colorBorder,
            ),
            Text(title,
                textAlign: TextAlign.center, style: GoogleFonts.aBeeZee(
                  color: colorBorder,fontSize: 15
                )),
          ],
        ),
      ),
    );
  }
}
