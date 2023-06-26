import 'package:flutter/material.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/item_menu_game_widget.dart';


class PracticeGameUserMainScreen extends StatelessWidget {
  const PracticeGameUserMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            size: size,
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: 'Practice',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ItemMenuGame(
                      onPress: () {
                        Navigator.pushNamed(
                            context, Routers.practiceScreenUserGameNum);
                      },
                      size: size,
                      textTitle: 'NUMBER',
                      child: Image.asset("assets/images/number.png",
                          height: size.height * 0.4),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ItemMenuGame(
                      size: size,
                      textTitle: 'SENTENCES',
                      onPress: () {
                        Navigator.pushNamed(
                            context, Routers.practiceMainScreenUserGameSen);
                      },
                      child: Image.asset("assets/images/sentences.png",
                          height: size.height * 0.4),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
