import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/widget/button_custom.dart';

import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';

class OptionUseApp extends StatelessWidget {
  const OptionUseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorSystemWhite,
        body: Center(
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Flexible(flex: 5,child: Image.asset('assets/images/bg2.jpg')),
              Flexible(
                flex: 3,child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routers.homeGuest);
                  },
                  child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorGrayBG),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: Image.asset('assets/images/guest.png'),
                      )),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 3,child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routers.login);
                  },
                  child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorGrayBG),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child:
                          const Center(child: Text('USER', style: kTitleTSBold))),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
