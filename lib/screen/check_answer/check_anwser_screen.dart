import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';

import '../../main.dart';

class CheckAnswerScreen extends StatelessWidget {
  const CheckAnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: size.height * 0.1,
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.1),
        child: const SafeArea(child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        )),
      ),
    );
  }
}
