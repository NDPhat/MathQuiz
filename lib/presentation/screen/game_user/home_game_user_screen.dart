import 'package:flutter/material.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';
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
                        "https://media.tenor.com/4LriXOMbMi8AAAAi/study-santosh-dawar.gif",
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
                        "https://media.tenor.com/dpNZDEnuPGYAAAAj/study-focused.gif",
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
