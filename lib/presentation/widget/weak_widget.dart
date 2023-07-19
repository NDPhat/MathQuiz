import 'package:flutter/material.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import '../../application/cons/text_style.dart';
import '../../data/remote/model/pre_quiz_hw_response.dart';


class WeakWidget extends StatelessWidget {
  const WeakWidget(
      {Key? key, required this.size, this.dataResult, this.dataPre})
      : super(key: key);
  final Size size;
  final ResultQuizHWAPIModel? dataResult;
  final PreQuizHWResAPIModel? dataPre;

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
            'WEEK ${dataResult == null ? dataPre!.week : dataResult!.week}',
            style: s15f700ColorYellow,
          ),
        ),
        SizedBox(height: size.height * 0.02),
        dataResult != null
            ? Container(
                alignment: Alignment.center,
                child: (Text(
                  'SCORE : ${dataResult!.score!} / ${dataResult!.numQ!}',
                  style: s14f500ColorMainTe,
                )),
              )
            : Container(),
      ],
    );
  }
}
