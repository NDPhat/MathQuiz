import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';

import '../../../../application/cons/color.dart';

class HomeHWorkUserScreen extends StatelessWidget {
  HomeHWorkUserScreen({Key? key, required this.size});
  Size size;

  @override
  Widget build(BuildContext context) {
    return HomeUserBG(
        onPress: () {},
        textNow: 'Home work',
        size: size,
        child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [

                    ],
                  ),
                ],
              ),
            )));
  }
}
