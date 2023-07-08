import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:math/data/model/option_quiz.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';

import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/button_custom.dart';

class OptionSignScreen extends StatelessWidget {
  const OptionSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          AppBarWidget(
              size: size,
              textTitle: 'choose sign'.tr().toString(),
              onBack: () {
                Navigator.pop(context);
              }),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.05,
              left: size.width * 0.02,
              right: size.width * 0.02,
              bottom: size.height * 0.05,
            ),
            child: Center(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ItemMenuSign(
                              size: size,
                              onPress: () {
                                Navigator.pushNamed(
                                    context, Routers.chooseOption,
                                    arguments: '+');
                              },
                              imageLink: "assets/images/cong.png",
                            ),
                            ItemMenuSign(
                              size: size,
                              onPress: () {
                                Navigator.pushNamed(
                                    context, Routers.chooseOption,
                                    arguments: '-');
                              },
                              imageLink: "assets/images/tru_sign.png",
                            ),
                          ],
                        ),
                        ItemMenuSign(
                          size: size,
                          onPress: () {
                            Navigator.pushNamed(context, Routers.chooseOption,
                                arguments: 'mix');
                          },
                          imageLink: "assets/images/mix.png",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ItemMenuSign(
                              size: size,
                              onPress: () {
                                Navigator.pushNamed(
                                    context, Routers.chooseOption,
                                    arguments: 'x');
                              },
                              imageLink: "assets/images/nhan_sign.png",
                            ),
                            ItemMenuSign(
                              size: size,
                              onPress: () {
                                Navigator.pushNamed(
                                    context, Routers.chooseOption,
                                    arguments: '/');
                              },
                              imageLink: "assets/images/chia.png",
                            ),
                          ],
                        ),
                      ],
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

class ItemMenuSign extends StatelessWidget {
  const ItemMenuSign({
    super.key,
    required this.size,
    required this.imageLink,
    required this.onPress,
  });

  final Size size;
  final String imageLink;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          padding: EdgeInsets.only(
              top: size.height * 0.05,
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.05),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: colorErrorPrimary)),
          child: Image.asset(
            imageLink,
            height: size.height * 0.15,
            width: size.width * 0.35,
          )),
    );
  }
}
