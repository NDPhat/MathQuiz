import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math/application/cons/color.dart';

import '../../../../application/cons/text_style.dart';

class HomeUserBG extends StatelessWidget {
  HomeUserBG(
      {Key? key,
      required this.child,
      required this.textNow,
      required this.size})
      : super(key: key);
  Widget child;
  String textNow;
  Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.6,
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.1),
                  child: Image.asset(
                    "assets/images/icon_app.png",
                  ),
                ),
                Text(textNow, style: s26f700ColorGreyPri),
              ]),
            ),
            CircleAvatar(
              backgroundColor: colorMainBlue,
              radius: 30,
              child: CircleAvatar(
                backgroundColor: colorSystemWhite,
                radius: 25,
                child: Padding(
                  padding: const EdgeInsets.all(8), // Border radius
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/profile.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        child
      ],
    );
  }
}
