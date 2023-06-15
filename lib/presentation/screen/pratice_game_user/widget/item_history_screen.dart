import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:math/data/remote/model/pre_quiz_game_response.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';

import '../../../../application/cons/text_style.dart';

class PracticeMainScreenItemCard extends StatelessWidget {
  const PracticeMainScreenItemCard(
      {Key? key,
      required this.size,
      required this.dataResult,
      required this.index})
      : super(key: key);
  final Size size;
  final int index;
  final PreQuizGameAPIModel dataResult;

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
            'TASK $index',
            style: s15f700ColorYellow,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Container(
          alignment: Alignment.center,
          child: (Text(
            'SCORE : ${dataResult!.score!} / ${dataResult!.numQ!}',
            style: s14f500ColorMainTe,
          )),
        )
      ],
    );
  }
}
