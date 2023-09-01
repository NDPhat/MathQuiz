import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/application/cons/constants.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/setting/widget/setting_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../domain/bloc/setting/setting_cubit.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class SettingGuestMainScreen extends StatelessWidget {
  const SettingGuestMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> showVolumeDialog() {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext contextBuild) {
          return BlocProvider.value(
            value: BlocProvider.of<SettingCubit>(context),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.w))),
              title: Text(
                'sound'.tr(),
                style: GoogleFonts.aBeeZee(color: colorErrorPrimary),
              ),
              content: BlocBuilder<SettingCubit, SettingState>(
                  builder: (BuildContext context, state) {
                return SizedBox(
                  width: 100.w,
                  height: 10.h,
                  child: Slider(
                    value: state.volume!,
                    max: 100,
                    min: 0,
                    activeColor: colorMainBlue,
                    inactiveColor: colorSystemWhite,
                    divisions: 20,
                    label: state.volume.round().toString(),
                    onChanged: (double values) {
                      context.read<SettingCubit>().volumeChanged(values);
                    },
                  ),
                );
              }),
              actions: <Widget>[
                RoundedButton(
                    press: () {
                      Navigator.pop(context);
                    },
                    color: colorSystemWhite,
                    colorBorder: colorMainBlue,
                    width: 80.w,
                    height: 6.h,
                    child: Text(
                      "go".tr(),
                      style: GoogleFonts.aBeeZee(
                          color: colorMainBlue, fontSize: 20),
                    ))
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home_user.jpg"),
              fit: BoxFit.cover),
          color: colorSystemWhite,
        ),
        child: MainPageHomePG(
          onBack: () {
            Navigator.pushNamed(context, Routers.homeGuest);
          },
          colorTextAndIcon: Colors.black,
          textNow: 'setting'.tr().toString(),
          onPressHome: () {},
          child: Column(
            children: [
              sizedBox,
              SettingMenuWidget(
                title: "language".tr().toString(),
                widget: const Icon(
                  LineAwesomeIcons.language,
                  size: 30,
                  color: colorMainBlue,
                ),
                onPress: () {
                  Navigator.pushNamed(context, Routers.languageScreen);
                },
                textStyle: s16f700ColorGreyTe,
              ),
              SizedBox(height: 5.h),
              SettingMenuWidget(
                title: "sound".tr().toString(),
                widget: const Icon(
                  Icons.volume_down_outlined,
                  size: 30,
                  color: colorErrorPrimary,
                ),
                onPress: () {
                  showVolumeDialog();
                },
                textStyle: s16f700ColorGreyTe,
              ),
              SizedBox(height: 5.h),
              SettingMenuWidget(
                title: "character".tr().toString(),
                widget: const Icon(
                  LineAwesomeIcons.user,
                  size: 30,
                  color: colorMainBlue,
                ),
                onPress: () {
                  Navigator.pushNamed(context, Routers.recordGuest);
                },
                textStyle: s16f700ColorGreyTe,
              ),
              SizedBox(height: 5.h),
              SettingMenuWidget(
                title: "login".tr().toString(),
                widget: const Icon(
                  LineAwesomeIcons.lock,
                  size: 30,
                  color: colorMainTealPri,
                ),
                onPress: () {
                  Navigator.pushNamed(context, Routers.login);
                },
                textStyle: s16f700ColorGreyTe,
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
