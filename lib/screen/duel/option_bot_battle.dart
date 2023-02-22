import 'package:flutter/material.dart';

import '../../cons/color.dart';
import '../../cons/constants.dart';
import '../../cons/text_style.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

class OptionBotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      appBar: AppBar(
        leading: const Icon(Icons.school),
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.15, bottom: size.height * 0.05),
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routers.battleBOT,
                        arguments: "easy");
                  },
                  child: Container(
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorGrayBG),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Image.asset('assets/images/easy.png'),
                  )),
              SizedBox(
                height: size.height * 0.04,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routers.battleBOT,
                        arguments: "medium");
                  },
                  child: Container(
                      height: size.height * 0.17,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorGrayBG),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: const Center(
                          child: Text('MEDIUM', style: kTitleTSBold)))),
              SizedBox(
                height: size.height * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routers.battleBOT,
                      arguments: "hard");
                },
                child: Container(
                    height: size.height * 0.18,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorGrayBG),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Image.asset(
                        'assets/images/hard.png',
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
