import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/pre_quiz_hw_res.dart';
import 'package:math/main.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';

import '../../../../application/cons/color.dart';
import '../../../../application/cons/constants.dart';
import '../../../../data/model/data_weak.dart';
import '../../../../data/remote/api/Repo/api_teacher_repo.dart';
import '../../../routers/navigation.dart';
import '../../../widget/weak_widget.dart';

class HomeHWorkUserScreen extends StatelessWidget {
  HomeHWorkUserScreen({Key? key, required this.size});
  Size size;
  List listData = [
    DataWeak(weak: '1', score: 0),
    DataWeak(weak: '2', score: 0),
    DataWeak(weak: '3', score: 0),
    DataWeak(weak: '4', score: 0),
    DataWeak(weak: '5', score: 0),
    DataWeak(weak: '6', score: 0),
    DataWeak(weak: '7', score: 0),
    DataWeak(weak: '8', score: 0),
    DataWeak(weak: '9', score: 0),
    DataWeak(weak: '10', score: 0),
    DataWeak(weak: '11', score: 0),
    DataWeak(weak: '12', score: 0),
    DataWeak(weak: '13', score: 0),
    DataWeak(weak: '14', score: 0),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> showDetailDialog() {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              25,
            )),
            backgroundColor: const Color(0xff1542bf),
            title: const FittedBox(
              child: Text('DO YOUR HOMEWORK ?',
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('GO', style: kDialogButtonsTS),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('EXIT', style: kDialogButtonsTS),
              ),
            ],
          );
        },
      );
    }

    return HomeUserBG(
        textNow: 'Home work',
        size: size,
        child: Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.02, right: size.width * 0.02),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        spacing: -1,
                        direction: Axis.horizontal,
                        children: listData
                            .map(( element) => Container(
                                width: size.width * 0.4,
                                height: size.height * 0.2,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  color: colorMainBlue,
                                ),
                                margin: const EdgeInsets.all(5),
                                child: WeakWidget(
                                    size: size,
                                    data: element)))
                            .toList(),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
