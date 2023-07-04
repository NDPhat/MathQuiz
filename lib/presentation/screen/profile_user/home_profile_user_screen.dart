import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/remote/authen/authen.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../application/cons/color.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
import 'my_account/profile_menu_widget.dart';

class HomeProfileUserScreen extends StatelessWidget {
  HomeProfileUserScreen({Key? key, required this.size});
  Size size;

  @override
  Widget build(BuildContext context) {
    return HomeUserBG(
        textNow: 'Profile',
        size: size,
        child: Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      width: size.width * 0.22,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          border: Border.all(color: colorSystemYeloow),
                          color: colorSystemWhite),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(8), // Border radius
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
              SizedBox(height: size.height * 0.01),
              Text('Mr.P', style: Theme.of(context).textTheme.headline4),
              Text('Coding is my life',
                  style: Theme.of(context).textTheme.bodyText2),
              SizedBox(height: size.height * 0.02),

              /// -- MENU
              SingleChildScrollView(
                child: ProfileMenuWidget(
                  title: 'myacc'.tr().toString(),
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {
                    Navigator.pushNamed(context, Routers.updateProfileUser);
                  },
                  size: size,
                ),
              ),
              SizedBox(height: size.height * 0.02),

              ProfileMenuWidget(
                title: "setting".tr().toString(),
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Navigator.pushNamed(context, Routers.settingScreen);
                },
                size: size,
              ),
              SizedBox(height: size.height * 0.02),
              ProfileMenuWidget(
                title: "record".tr().toString(),
                icon: LineAwesomeIcons.record_vinyl,
                onPress: () {},
                size: size,
              ),
              SizedBox(height: size.height * 0.02),
              ProfileMenuWidget(
                title: "logout".tr().toString(),
                icon: LineAwesomeIcons.alternate_sign_out,
                onPress: () {
                  instance.get<AuthenRepository>().handleAutoLoginApp(false);
                  instance.get<UserGlobal>().onLogin = false;
                  Navigator.pushNamed(context, Routers.welcome);
                },
                size: size,
              ),
            ],
          ),
        )));
  }
}
