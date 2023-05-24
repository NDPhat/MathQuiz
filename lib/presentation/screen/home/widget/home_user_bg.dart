import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math/application/cons/color.dart';

import '../../../../application/cons/text_style.dart';

class HomeUserBG extends StatelessWidget {
  HomeUserBG(
      {Key? key,
      required this.child,
      required this.onPress,
      required this.textNow,
      required this.size})
      : super(key: key);
  Widget child;
  GestureTapCallback? onPress;
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
              width: size.width * 0.75,
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.05),
                  child: Image.asset(
                    "assets/images/icon_app.png",
                  ),
                ),
                Text(textNow, style: s30f700ColorGreyPri),
              ]),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: colorMainBlue,
              child: SizedBox(
                  child: IconButton(
                onPressed: onPress,
                icon: const Icon(Icons.settings),
                color: colorSystemWhite,
              )),
            )
          ],
        ),
        child
      ],
    );
  }
}
