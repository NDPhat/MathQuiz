import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/screen/home/widget/body_home_user.dart';
import 'package:math/presentation/screen/home/widget/bottom_navi_home_user.dart';

import '../../../application/cons/color.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({Key? key}) : super(key: key);

  @override
  State<HomeUserScreen> createState() => _HomeScreentState();
}

class _HomeScreentState extends State<HomeUserScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController _myPage = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: HomeBodyUser(
        myPage: _myPage,
        size: size,
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: BottomAppIcon(
                pathImage: "assets/images/home.png",
                text: 'home'.tr().toString(),
                size: size,
                color: _selectedIndex == 0 ? colorMainBlue : colorGrayBG,
              ),
              onTap: () {
                _onItemTapped(0);
                _myPage.jumpToPage(0);
              },
            ),
            GestureDetector(
              child: BottomAppIcon(
                  pathImage: "assets/images/icons_game_home.png",
                  text: 'game'.tr().toString(),
                  size: size,
                  color: _selectedIndex == 1 ? colorMainBlue : colorGrayBG),
              onTap: () {
                _onItemTapped(1);
                _myPage.jumpToPage(1);
              },
            ),
            GestureDetector(
              child: BottomAppIcon(
                  pathImage: "assets/images/icons_homework_home.png",
                  text: 'home work'.tr().toString(),
                  size: size,
                  color: _selectedIndex == 2 ? colorMainBlue : colorGrayBG),
              onTap: () {
                _onItemTapped(2);
                _myPage.jumpToPage(2);
              },
            ),
            GestureDetector(
              child: BottomAppIcon(
                  pathImage: "assets/images/profile.png",
                  text: 'profile'.tr().toString(),
                  size: size,
                  color: _selectedIndex == 3 ? colorMainBlue : colorGrayBG),
              onTap: () {
                _onItemTapped(3);
                _myPage.jumpToPage(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
