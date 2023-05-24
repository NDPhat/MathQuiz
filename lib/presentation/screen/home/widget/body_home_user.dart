import 'package:flutter/material.dart';
import 'package:math/presentation/screen/home/widget/home_hwork_user_screen.dart';
import 'package:math/presentation/screen/home/widget/home_profile_user_screen.dart';
import 'home_game_user_screen.dart';
import 'home_main_user_screen.dart';

class HomeBodyUser extends StatelessWidget {
  HomeBodyUser({Key? key, required this.myPage, required this.size})
      : super(key: key);
  final PageController myPage;
  Size size;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.height * 0.05),
      child: PageView(
          controller: myPage,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomeMainUserScreen(
              size: size,
            ),
            HomeGameUserScreen(size: size),
            HomeHWorkUserScreen(size: size),
            HomeProfileUserScreen(size: size),
            // HomeDetailBody(),
          ]),
    ); // Comment this if you need to use Swipe.
  }
}
