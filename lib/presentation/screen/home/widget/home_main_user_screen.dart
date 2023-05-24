import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';

import '../../../../application/cons/color.dart';

class HomeMainUserScreen extends StatelessWidget {
  HomeMainUserScreen({Key? key, required this.size});
  Size size;

  @override
  Widget build(BuildContext context) {
    return HomeUserBG(
        onPress: () {},
        textNow: 'Home',
        size: size,
        child: Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          bottom: size.height * 0.02,
                          right: size.height * 0.03,
                          left: size.height * 0.03),
                      height: size.height * 0.2,
                      width: size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/bg_card_home.png"),
                              fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(alignment: Alignment.centerLeft,child: const Text("Always remember :", style: s18f700ColorWhiteSys)),
                          Container(
                              padding: EdgeInsets.only(top: size.height * 0.02),
                              width: size.width,
                              child: const Text(
                                  "Without mathematics, there’s nothing you can do.\nEverything around you is mathematics.\nEverything around you is numbers.",
                                  style: s15f700ColorErrorPri)),
                        ],
                      )),
                ],
              ),
            ],
          ),
        )));
  }
}
