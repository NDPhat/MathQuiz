import 'package:flutter/material.dart';

import '../../application/cons/text_style.dart';

class LineContentItem extends StatelessWidget {
  const LineContentItem({
    super.key,
    required this.size,
    required this.title,
    required this.icon,
  });

  final Size size;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.only(top: size.height * 0.02, bottom: size.height * 0.01),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: s18f700ColorGreyPri,
          ),
          icon
        ],
      ),
    );
  }
}
