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
                      child: Image.asset(
                        "assets/images/profile.png",
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: colorSystemYeloow),
                      child: const Icon(
                        LineAwesomeIcons.retro_camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
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
                  title: "My account",
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {
                    Navigator.pushNamed(context, Routers.updateProfileUser);
                  },
                  size: size,
                ),
              ),
              SizedBox(height: size.height * 0.02),

              ProfileMenuWidget(
                title: "Setting",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
                size: size,
              ),
              SizedBox(height: size.height * 0.02),

              ProfileMenuWidget(
                title: "Local Notification",
                icon: LineAwesomeIcons.bell,
                onPress: () {},
                size: size,
              ),
              SizedBox(height: size.height * 0.02),
              ProfileMenuWidget(
                title: "Record",
                icon: LineAwesomeIcons.record_vinyl,
                onPress: () {},
                size: size,
              ),
              SizedBox(height: size.height * 0.02),
              ProfileMenuWidget(
                title: "Logout",
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
