import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainPageHomePG extends StatelessWidget {
  MainPageHomePG({
    Key? key,
    required this.child,
    this.iconRight,
    this.textNow,
    this.onPressHome,
    required this.onBack,
    required this.colorTextAndIcon,
  }) : super(key: key);
  Widget child;
  Widget? iconRight;
  VoidCallback? onPressHome;
  VoidCallback onBack;
  String? textNow;
  Color colorTextAndIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10.h,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 3.w, right: 5.w, top: 2.h),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 100.w,
                child: IconButton(
                    onPressed: onBack,
                    icon: Icon(
                      Icons.keyboard_backspace,
                      size: 30,
                      color: colorTextAndIcon,
                    )),
              ),
              Container(
                width: 100.w,
                alignment: Alignment.center,
                child: Text(textNow ?? "",
                    style: TextStyle(
                        color: colorTextAndIcon,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
              GestureDetector(
                onTap: onPressHome,
                child: Container(
                    alignment: Alignment.centerRight,
                    width: 100.w,
                    child: iconRight),
              )
            ],
          ),
        ),
        child,
      ],
    );
  }
}
