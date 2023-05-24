import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';

import '../../../../application/cons/color.dart';

class HomeGameUserScreen extends StatelessWidget {
  HomeGameUserScreen({Key? key, required this.size});
  Size size;

  @override
  Widget build(BuildContext context) {
    return HomeUserBG(
        onPress: () {},
        textNow: 'Game',
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
