import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../application/cons/text_style.dart';
import '../../../../data/remote/model/pre_pra_res.dart';

class PracticeMainScreenItemCard extends StatelessWidget {
  const PracticeMainScreenItemCard(
      {Key? key,
      required this.size,
      required this.dataResult,
      required this.index})
      : super(key: key);
  final Size size;
  final int index;
  final PrePraAPIModel dataResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          child: Text(
            "${'task'.tr()} $index",
            style: s15f700ColorYellow,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          alignment: Alignment.center,
          child: (Text(
            '${'score'.tr()} : ${dataResult!.score!} / ${dataResult!.numQ!}',
            style: s14f500ColorMainTe,
          )),
        )
      ],
    );
  }
}
