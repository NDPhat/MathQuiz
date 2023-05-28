import 'package:flutter/material.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/pre_quiz_hw_res.dart';
import 'package:math/data/remote/model/pre_quiz_hw_response.dart';
import 'package:math/data/remote/model/result_quiz_hw_res.dart';
import 'package:math/main.dart';
import 'package:math/presentation/screen/home/widget/home_user_bg.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../data/model/data_weak.dart';
import '../../../data/remote/api/Repo/api_teacher_repo.dart';
import '../../routers/navigation.dart';
import '../../widget/weak_widget.dart';

class HomeHWorkUserScreen extends StatefulWidget {
  HomeHWorkUserScreen({Key? key});
  @override
  State<HomeHWorkUserScreen> createState() => _HomeHWorkUserScreenScreenState();
}

class _HomeHWorkUserScreenScreenState extends State<HomeHWorkUserScreen> {
  List<ResultQuizHWRes>? dataResult = [];
  List<PreQuizHWResponse>? dataPre = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        height: size.height * 0.8,
                        child: ListView.builder(
                          itemCount: dataPre!.length,
                          itemBuilder: (context, index) {
                            return Container(
                                width: size.width * 0.4,
                                height: size.height * 0.2,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  color: colorMainBlue,
                                ),
                                margin: const EdgeInsets.all(5),
                                child:
                                    WeakWidget(size: size, data: dataResult![index]));
                          },
                        ))
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dataResult = await instance.get<UserAPIRepo>().getALlResultQuizHW();
      dataPre= await instance.get<UserAPIRepo>().getALlPreQuizHW();
    });
  }
}
