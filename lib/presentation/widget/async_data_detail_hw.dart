import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class ItemAsyncDataDetailHW extends StatelessWidget {
  const ItemAsyncDataDetailHW({
    Key? key,
    required this.size,
    required this.textTitle,
    required this.childRight,
    required this.timeHW,
    this.listSIgn,
    required this.type,
    this.scoreAve,
  }) : super(key: key);
  final Size size;
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
        padding: EdgeInsets.only(
            left: size.width * 0.02,
            right: size.width * 0.02,
            top: size.height * 0.01,
            bottom: size.height * 0.01),
        width: size.width * 0.9,
        height: size.height * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.3,
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
                    height: size.height * 0.05,
                    child: Text(
                      timeHW,
                      style: s12f400ColorGreyTe,
                    ),
                  ),
                  SizedBox(height: size.height * 0.13, child: childRight)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
