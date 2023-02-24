import 'package:flutter/material.dart';
import 'package:math/cons/color.dart';
import 'package:math/cons/text_style.dart';
import 'package:math/routers/navigation.dart';
import 'package:math/widget/button_custom.dart';

class ChooseSignScreen extends StatelessWidget {
  const ChooseSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/picone.png",
          ),
          Stack(
            children: [
              Image.asset(
                "assets/images/bg4.png",
                fit: BoxFit.fitWidth,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: size.height * 0.06,
                    left: size.width * 0.25,
                    right: size.width * 0.25,
                    bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedButton(
                          press: () {
                            Navigator.pushNamed(context, Routers.chooseOption,
                                arguments: '+');
                          },
                          color: colorErrorPrimary,
                          width: size.width * 0.2,
                          height: size.height * 0.04,
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: colorBGInput,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        RoundedButton(
                          press: () {
                            Navigator.pushNamed(context, Routers.chooseOption,
                                arguments: '-');
                          },
                          color: colorErrorPrimary,
                          width: size.width * 0.2,
                          height: size.height * 0.04,
                          child: const Icon(
                            Icons.remove,
                            size: 30,
                            color: colorBGInput,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedButton(
                          press: () {
                            Navigator.pushNamed(context, Routers.chooseOption,
                                arguments: 'x');
                          },
                          color: colorErrorPrimary,
                          width: size.width * 0.2,
                          height: size.height * 0.04,
                          child: const Icon(
                            Icons.remove,
                            size: 30,
                            color: colorBGInput,
                          ),
                        ),
                        RoundedButton(
                          press: () {
                            Navigator.pushNamed(context, Routers.chooseOption,
                                arguments: '/');
                          },
                          color: colorErrorPrimary,
                          width: size.width * 0.2,
                          height: size.height * 0.04,
                          child: Image.asset(
                            "assets/images/divide.png",
                            color: colorBGInput,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
