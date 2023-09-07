import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../data/remote/model/pre_hw_res.dart';
import '../../data/remote/model/result_hw_res.dart';

class WeakWidget extends StatelessWidget {
  const WeakWidget(
      {Key? key, this.dataResult, this.dataPre, required this.colorBorder})
      : super(key: key);
  final ResultHWAPIModel? dataResult;
  final PreHWAPIModel? dataPre;
  final Color colorBorder;

  @override
  Widget build(BuildContext context) {
    return dataResult != null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  '${'week'.tr()} ${dataResult == null ? dataPre!.week : dataResult!.week}',
                  style: GoogleFonts.saira(color: colorBorder, fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: (Text(
                  '${'score'.tr()} : ${dataResult!.score!} / ${dataResult!.numQ!}',
                  style:
                      GoogleFonts.songMyung(color: colorBorder, fontSize: 14),
                )),
              )
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 5.h,
                alignment: Alignment.center,
                child: (Text(
                  '${"from".tr()} : ${dataPre!.dstart!}\n${"to".tr()} : ${dataPre!.dend!}',
                  style:
                      GoogleFonts.songMyung(color: colorBorder, fontSize: 14),
                )),
              ),
              Container(
                alignment: Alignment.center,
                width: 40.w,
                height: 1.h,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: colorBorder),
                  ),
                ),
              ),
              Container(
                height: 5.h,
                alignment: Alignment.center,
                child: Text(
                  '${'week'.tr()} ${dataResult == null ? dataPre!.week : dataResult!.week}',
                  style: GoogleFonts.saira(color: colorBorder, fontSize: 20),
                ),
              ),
            ],
          );
  }
}
