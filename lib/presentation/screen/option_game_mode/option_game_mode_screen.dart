import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:math/data/model/option_quiz.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';

import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/button_custom.dart';
import '../../widget/item_menu_game_widget.dart';

class OptionGameModeScreen extends StatelessWidget {
  const OptionGameModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sign = ModalRoute.of(context)!.settings.arguments as String;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBarWidget(
              size: size,
              textTitle: 'CHOOSE GAME MODE',
              onBack: () {
                Navigator.pop(context);
              }),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.05,
              left: size.width * 0.02,
              right: size.width * 0.02,
            ),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/gamemode.png",
                    width: size.width * 0.5,
                    height: size.height * 0.2,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SizedBox(
                    height: size.height * 0.6,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemMenuGameMode(
                            size: size,
                            icon: const Icon(
                              LineAwesomeIcons.keyboard,
                              size: 30,
                            ),
                            textTitle: 'INPUT ANSWER',
                            onPress: () {
                              Navigator.pushNamed(context, Routers.premake,
                                  arguments: OptionQuiz(
                                      sign: sign, optionQuiz: 'input'));
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          ItemMenuGameMode(
                            size: size,
                            icon: const Icon(
                              LineAwesomeIcons.question,
                              size: 30,
                            ),
                            textTitle: 'TRUE/FALSE',
                            onPress: () {
                              Navigator.pushNamed(context, Routers.premake,
                                  arguments: OptionQuiz(
                                      sign: sign, optionQuiz: 'truefalse'));
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          ItemMenuGameMode(
                            size: size,
                            icon: const Icon(
                              Icons.youtube_searched_for,
                              size: 40,
                            ),
                            textTitle: 'FIND MISSING',
                            onPress: () {
                              Navigator.pushNamed(context, Routers.premake,
                                  arguments: OptionQuiz(
                                      sign: sign, optionQuiz: 'missing'));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMenuGameMode extends StatelessWidget {
  const ItemMenuGameMode({
    super.key,
    required this.size,
    required this.textTitle,
    required this.onPress,
    required this.icon,
  });

  final Size size;
  final String textTitle;
  final Icon icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.02,
            left: size.width * 0.05,
            right: size.width * 0.05),
        decoration: BoxDecoration(
            border: Border.all(color: colorErrorPrimary),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: RoundedButton(
          press: onPress,
          color: colorSystemWhite,
          width: size.width * 0.8,
          height: size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(
                textTitle,
                style: s16f700ColorGreyTe,
              ),
            ],
          ),
        ));
  }
}
