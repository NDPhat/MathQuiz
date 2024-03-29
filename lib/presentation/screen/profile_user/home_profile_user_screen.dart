import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/constants.dart';
import 'package:math/data/remote/authen/authen.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';
import 'my_account/profile_menu_widget.dart';

class HomeProfileUserScreen extends StatelessWidget {
  const HomeProfileUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/setting_bg.jpg"),
                fit: BoxFit.fill),
            color: colorSystemWhite,
          ),
          child: MainPageHomePG(
              onBack: () {
                Navigator.pushNamed(context, Routers.homeUser);
              },
              colorTextAndIcon: Colors.black,
              textNow: 'profile'.tr().toString(),
              onPressHome: () {
                if (instance.get<UserGlobal>().onLogin == true) {
                  Navigator.pushNamed(context, Routers.homeUser);
                } else {
                  Navigator.pushNamed(context, Routers.homeGuest);
                }
              },
              child: Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    sizedBox,
                    Stack(
                      children: [
                        SizedBox(
                            width: 22.w,
                            height: 10.h,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: colorSystemYeloow,
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(8), // Border radius
                                child: ClipOval(
                                    child: Image.network(
                                  instance.get<UserGlobal>().linkImage != null
                                      ? instance.get<UserGlobal>().linkImage!
                                      : "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                )),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      instance.get<UserGlobal>().fullName!,
                      style: GoogleFonts.abel(
                          color: colorSystemYeloow,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'It\'s never too late to learn',
                      style: GoogleFonts.abel(
                          color: colorSystemYeloow,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                    SizedBox(height: 2.h),

                    /// -- MENU
                    SingleChildScrollView(
                      child: ProfileMenuWidget(
                        title: 'myacc'.tr().toString(),
                        icon: LineAwesomeIcons.user_check,
                        textColor: colorMainBlue,
                        onPress: () {
                          Navigator.pushNamed(
                              context, Routers.updateProfileUser);
                        },
                      ),
                    ),
                    SizedBox(height: 3.h),

                    ProfileMenuWidget(
                      title: "update password".tr().toString(),
                      icon: LineAwesomeIcons.lock,
                      textColor: colorErrorPrimary,
                      onPress: () {
                        Navigator.pushNamed(context, Routers.changePassScreen);
                      },
                    ),
                    SizedBox(height: 3.h),
                    ProfileMenuWidget(
                      title: "logout".tr().toString(),
                      textColor: colorSystemPurple,
                      icon: LineAwesomeIcons.alternate_sign_out,
                      onPress: () {
                        instance
                            .get<AuthenRepository>()
                            .handleAutoLoginApp(false);
                        instance.get<UserGlobal>().onLogin = false;
                        Navigator.pushNamed(
                            context, Routers.chooseOptionUseApp);
                      },
                    ),
                  ],
                ),
              ))),
        ),
      ),
    );
  }
}
