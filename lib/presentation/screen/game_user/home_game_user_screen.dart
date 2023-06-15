import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';

import '../../../application/cons/color.dart';
import '../../widget/item_menu_game_widget.dart';

class HomeGameUserScreen extends StatelessWidget {
  HomeGameUserScreen({Key? key, required this.size});
  Size size;

  @override
  Widget build(BuildContext context) {
    return HomeUserBG(
        textNow: 'Game',
        size: size,
        child: Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ItemMenuGame(
                    onPress: () {
                      Navigator.pushNamed(
                          context, Routers.practiceMainScreenUserGame);
                    },
                    size: size,
                    linkGif:
                        "https://media0.giphy.com/media/ENbpTeFYVEoSSj4A55/giphy.gif?cid=ecf05e47pw691f4r7okmg0nj5tg31gldwg9h1p5y7aj6wna1&ep=v1_gifs_related&rid=giphy.gif&ct=g",
                    textTitle: 'PRACTICE',
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  ItemMenuGame(
                    onPress: () {
                      Navigator.pushNamed(context, Routers.battleMainScreen);
                    },
                    size: size,
                    linkGif:
                        "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExN2VlN2EzMDc0YTg0OWQ2ZWE3MzFjNTVmM2UxN2UyNzM1ZmVkM2M5OCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PXM/JmPabUqU22FAbQYkzN/giphy.gif",
                    textTitle: 'GAME',
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  ItemMenuGame(
                    size: size,
                    linkGif:
                        "https://media.tenor.com/zneUg_xrUMwAAAAM/time-pass-time-out.gif",
                    textTitle: 'TESTING',
                    onPress: () {
                      Navigator.pushNamed(context, Routers.mainTestUser);
                    },
                  )
                ],
              ),
            ],
          ),
        )));
  }
}
