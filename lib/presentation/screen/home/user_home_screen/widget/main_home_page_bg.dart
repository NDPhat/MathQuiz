import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/main.dart';
import 'package:sizer/sizer.dart';

import '../../../../../application/cons/constants.dart';
import '../../../../../application/cons/text_style.dart';

class MainPageHomePG extends StatelessWidget {
  MainPageHomePG({
    Key? key,
    required this.child,
    required this.textNow,
    required this.onPressHome,
    required this.colorTextAndIcon,
  }) : super(key: key);
  Widget child;
  VoidCallback onPressHome;
  String textNow;
  Color colorTextAndIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10.h,
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 32.w,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.keyboard_backspace,
                      size: 30,
                      color: colorTextAndIcon,
                    )),
              ),
              Text(textNow,
                  style: TextStyle(
                      color: colorTextAndIcon,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        child,
      ],
    );
  }
}