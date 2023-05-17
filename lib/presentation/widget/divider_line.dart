import 'package:flutter/material.dart';

import '../../application/cons/color.dart';

class DivideLine extends StatelessWidget {
  const DivideLine({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Divider(
        color: colorMainBlueChart,
        height: size.height * 0.05,
      ),
    );
  }
}
