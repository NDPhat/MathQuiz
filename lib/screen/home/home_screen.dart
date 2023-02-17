import 'package:flutter/material.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';

import 'package:math/domain/home_repo.dart';
import '../../cons/color.dart';
import '../../cons/text_style.dart';
import '../../data/model/test_model.dart';
import '../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeRepo homeRepo =
      HomeRepo(preTestLocalRepo: instance.get<PreTestLocalRepo>());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: colorSystemWhite,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.1,
              left: size.width * 0.05,
              right: size.width * 0.05,
              bottom: size.height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/mathquiz.png'),
              SizedBox(
                height: size.height * 0.15,
              ),
              RoundedButton(
                  text: 'HISTORY',
                  press: () {
                    Navigator.pushNamed(context, Routers.historyHome);
                  },
                  color: colorBlueQuaternery,
                  width: size.width * 0.8,
                  height: size.height * 0.06,
                  textStyle: s20f700ColorErrorPro),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedButton(
                  text: 'PRACTICE',
                  press: () {
                    Navigator.pushNamed(context, Routers.chooseSign);
                  },
                  color: colorBlueQuaternery,
                  width: size.width * 0.8,
                  height: size.height * 0.06,
                  textStyle: s20f700ColorErrorPro),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedButton(
                  text: 'DO TEST',
                  press: () {
                    homeRepo.insertPreTest();
                    Navigator.pushNamed(context, Routers.doTest,
                        arguments: homeRepo.getLatestPreTest());
                  },
                  color: colorBlueQuaternery,
                  width: size.width * 0.8,
                  height: size.height * 0.06,
                  textStyle: s20f700ColorErrorPro),
            ],
          ),
        ));
  }
}
