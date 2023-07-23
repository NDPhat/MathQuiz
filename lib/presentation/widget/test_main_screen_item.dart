import 'package:flutter/material.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:sizer/sizer.dart';
import '../../application/cons/text_style.dart';

class TestmainScreenItemCard extends StatelessWidget {
  const TestmainScreenItemCard(
      {Key? key, required this.dataResult, required this.index})
      : super(key: key);
  final int index;
  final PreTestAPIRes dataResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h),
        Container(
          alignment: Alignment.center,
          child: Text(
            'TASK $index',
            style: s15f700ColorYellow,
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          alignment: Alignment.center,
          child: (Text(
            'SCORE : ${dataResult.score!} / ${dataResult.sumQ!}',
            style: s14f500ColorMainTe,
          )),
        )
      ],
    );
  }
}
