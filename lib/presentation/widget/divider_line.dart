import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';

class DivideLine extends StatelessWidget {
  const DivideLine({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Divider(
        color: colorMainBlueChart,
        height: 5.h,
      ),
    );
  }
}
