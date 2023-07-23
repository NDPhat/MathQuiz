import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class ItemAsyncDataDetailHW extends StatelessWidget {
  const ItemAsyncDataDetailHW({
    Key? key,
    required this.textTitle,
    required this.childRight,
    required this.timeHW,
    this.listSIgn,
    required this.type,
    this.scoreAve,
  }) : super(key: key);
  final String textTitle;
  final String timeHW;
  final String? listSIgn;
  final String? scoreAve;
  final Widget childRight;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorBGInput,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
        height: 90.h,
        width: 20.w,
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
                  type == "hw"
                      ? Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sign : $listSIgn',
                            style: s16f500ColorError,
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Average : $scoreAve',
                            style: s16f500ColorError,
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
                    height: 5.w,
                    child: Text(
                      timeHW,
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
