import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: MainPageHomePG(
          colorTextAndIcon: Colors.black,
          textNow: 'profile'.tr().toString(),
          onPressHome: () {},
          child: Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                sizedBox,
                Stack(
                  children: [
                    Container(
                        width: 22.w,
                        height: 10.h,
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
                SizedBox(height: 1.h),
                Text('Mr.P', style: Theme.of(context).textTheme.headline4),
                Text('Coding is my life',
                    style: Theme.of(context).textTheme.bodyText2),
                SizedBox(height: 2.h),

                /// -- MENU
                SingleChildScrollView(
                  child: ProfileMenuWidget(
                    title: 'myacc'.tr().toString(),
                    icon: LineAwesomeIcons.user_check,
                    onPress: () {
                      Navigator.pushNamed(context, Routers.updateProfileUser);
                    },
                  ),
                ),
                SizedBox(height: 3.h),

                ProfileMenuWidget(
                  title: "update pass".tr().toString(),
                  icon: LineAwesomeIcons.lock,
                  onPress: () {
                    Navigator.pushNamed(context, Routers.changePassScreen);
                  },
                ),
                SizedBox(height: 3.h),
                ProfileMenuWidget(
                  title: "record".tr().toString(),
                  icon: LineAwesomeIcons.record_vinyl,
                  onPress: () {},
                ),
                SizedBox(height: 3.h),
                ProfileMenuWidget(
                  title: "logout".tr().toString(),
                  icon: LineAwesomeIcons.alternate_sign_out,
                  onPress: () {
                    instance.get<AuthenRepository>().handleAutoLoginApp(false);
                    instance.get<UserGlobal>().onLogin = false;
                    Navigator.pushNamed(context, Routers.chooseOptionUseApp);
                  },
                ),
              ],
            ),
          ))),
    );
  }
}
