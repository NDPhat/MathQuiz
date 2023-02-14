import 'package:flutter/material.dart';
import 'package:math/routers/navigation.dart';
import 'package:math/widget/button_custom.dart';
import 'package:math/widget/input_field.dart';

import '../../cons/color.dart';
import '../../cons/text_style.dart';

class PreMakeQuiz extends StatelessWidget {
  PreMakeQuiz({Key? key}) : super(key: key);
  final items = ['5s', '10s', '15s'];
  String selectedValue = '5s';
  @override
  Widget build(BuildContext context) {
    final sign = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.school),
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.08,
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: Center(
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  sign,
                  style: s60f700colorSysBlue,
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                InputField(
                    hintText: 'How many question', size: size.width * 0.8),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InputField(hintText: 'Start Value', size: size.width * 0.8),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InputField(hintText: 'End Value', size: size.width * 0.8),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.07,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.timer),
                      SizedBox(width: size.width * 0.1),
                      const Text(
                        'Time Per Quiz',
                        style: s16f700ColorGreyTe,
                      ),
                      SizedBox(width: size.width * 0.18),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),

                        // dropdown below..
                        child: DropdownButton<String>(
                          value: selectedValue,
                          onChanged: (newValue) {},
                          items: items
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      ))
                              .toList(),

                          // add extra sugar..
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 42,
                          underline: const SizedBox(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height*0.05,
                ),
                RoundedButton(
                    text: 'GENERATE QUIZ',
                    press: () {
                      Navigator.pushNamed(context, Routers.game,arguments: sign);
                    },
                    color: colorBlueQuaternery,
                    textColor: colorMainBlue,
                    width: size.width * 0.8,
                    height: size.height * 0.06,
                    textStyle: s20f700ColorMBlue),
                SizedBox(
                  height: size.height*0.03,
                ),
                RoundedButton(
                    text: 'BACK',
                    press: () {
                      Navigator.pop(context);
                    },
                    color: colorBlueQuaternery,
                    textColor: colorMainBlue,
                    width: size.width * 0.8,
                    height: size.height * 0.06,
                    textStyle: s20f700ColorMBlue),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
