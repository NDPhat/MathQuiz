import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/model/user_local.dart';
import 'package:sizer/sizer.dart';
import '../../../../../application/cons/constants.dart';
import '../../../../../data/model/user_global.dart';
import '../../../../../main.dart';

class StudentName extends StatelessWidget {
  const StudentName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${'hi'.tr()} ", style: s16f700ColorSysWhite),
        Text(
            instance.get<UserGlobal>().onLogin == true
                ? instance.get<UserGlobal>().fullName!
                : instance.get<UserLocal>().name!,
            style: s16f700ColorSysWhite),
      ],
    );
  }
}

class StudentClass extends StatelessWidget {
  const StudentClass({Key? key, required this.studentClass}) : super(key: key);
  final String studentClass;
  @override
  Widget build(BuildContext context) {
    return Text(
        instance.get<UserGlobal>().onLogin == true
            ? "${"class".tr()} ${instance.get<UserGlobal>().lop!}"
            : studentClass,
        style: s16f700ColorSysWhite);
  }
}

class StudentYear extends StatelessWidget {
  const StudentYear({Key? key, required this.studentYear}) : super(key: key);

  final String studentYear;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: SizerUtil.deviceType == DeviceType.tablet ? 4.h : 3.h,
      child: Center(
        child: Text(studentYear, style: s16f700ColorSysWhite),
      ),
    );
  }
}

class StudentPicture extends StatelessWidget {
  StudentPicture({Key? key, required this.picAddress}) : super(key: key);
  final String? picAddress;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorSystemWhite,
      radius: SizerUtil.deviceType == DeviceType.tablet ? 10.w : 12.w,
      child: Padding(
        padding: const EdgeInsets.all(8), // Border radius
        child: ClipOval(
            child: instance.get<UserGlobal>().onLogin == true
                ? (picAddress != null
                    ? Image.network(
                        instance.get<UserGlobal>().linkImage!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/profile.png",
                        fit: BoxFit.cover,
                      ))
                : Image.asset(
                    picAddress!,
                    fit: BoxFit.cover,
                  )),
      ),
    );
  }
}

class StudentDataCard extends StatelessWidget {
  const StudentDataCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 12.h,
      decoration: BoxDecoration(
        color: colorSystemWhite,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black,
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
