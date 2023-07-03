import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SettingMenuWidget extends StatelessWidget {
  const SettingMenuWidget(
      {Key? key,
      required this.title,
      required this.widget,
      required this.onPress,
      required this.textStyle,
      required this.size})
      : super(key: key);

  final String title;
  final Widget widget;
  final VoidCallback onPress;
  final TextStyle textStyle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 200),
      onPressed: onPress,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        height: size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: size.width * 0.5,
                child: Row(
                  children: [
                    widget,
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(title, style: textStyle),
                  ],
                )),
            const Icon(LineAwesomeIcons.angle_right,
                size: 30.0, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
