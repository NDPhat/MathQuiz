import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/color.dart';
import 'package:sizer/sizer.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress,
      this.textColor,
        this.iconColor
      })
      : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor,iconColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? colorSystemYeloow : colorBlueQuaternery;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colorSystemYeloow),
        ),
        width: 80.w,
        height: 8.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: iconColor.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: textColor),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.apply(color: textColor)),
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
