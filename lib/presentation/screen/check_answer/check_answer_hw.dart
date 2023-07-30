import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../data/remote/model/detail_quiz_hw_response.dart';
import '../../../main.dart';
import '../../widget/answer_widget.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class CheckAnswerHWScreen extends StatelessWidget {
  const CheckAnswerHWScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String key = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        body: MainPageHomePG(
            onBack: () {
              Navigator.pop(context);
            },
            colorTextAndIcon: Colors.black,
            textNow: 'check answer'.tr().toString(),
            onPressHome: () {},
            child: Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: SizedBox(
                  height: 90.h,
                  child: FutureBuilder<List<DetailQuizHWAPIModel>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlQuizDetailByResultID(key),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                            height: 30.h,
                            width: 30.w,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: colorMainBlue,
                                strokeWidth: 5,
                              ),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          return CustomScrollView(
                            slivers: [
                              SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                      childCount: snapshot.data!.length,
                                      (context, index) {
                                return AnswerWidget(
                                  quiz: snapshot.data![index].quiz.toString(),
                                  answer:
                                      snapshot.data![index].answer.toString(),
                                  answerSelect: snapshot
                                      .data![index].answerSelect
                                      .toString(),
                                  quizInfo: snapshot.data![index].infoQuiz!,
                                );
                              }))
                            ],
                          );
                        } else {
                          return Container();
                        }
                      })),
            )));
  }
}
