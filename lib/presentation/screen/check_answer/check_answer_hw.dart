import 'package:flutter/material.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/quiz_test_res.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../data/model/check_model.dart';
import '../../../data/remote/model/detail_quiz_hw_response.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/answer_widget.dart';
import '../../widget/app_bar.dart';

class CheckAnswerHWScreen extends StatelessWidget {
  const CheckAnswerHWScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckAnswerModel data =
        ModalRoute.of(context)!.settings.arguments as CheckAnswerModel;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
              textTitle: 'CHECK ANSWER',
              onBack: () {
                Navigator.pushNamed(context, Routers.homeUser);
              }),
          Container(
            padding:
                EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
                  child: data.type == "hw"
                      ? FutureBuilder<List<DetailQuizHWAPIModel>?>(
                          future: instance
                              .get<UserAPIRepo>()
                              .getALlQuizDetailByResultID(data.id.toString()),
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
                              return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return AnswerWidget(
                                      quiz:
                                          snapshot.data![index].quiz.toString(),
                                      answer: snapshot.data![index].answer
                                          .toString(),
                                      answerSelect: snapshot
                                          .data![index].answerSelect
                                          .toString(),
                                      quizInfo: snapshot.data![index].infoQuiz!,
                                    );
                                  });
                            } else {
                              return Container();
                            }
                          })
                      : FutureBuilder<List<QuizTestAPIRes>?>(
                          future: instance
                              .get<UserAPIRepo>()
                              .getALlQuizTestByPreTestID(data.id.toString()),
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
                              return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return AnswerWidget(
                                      quiz:
                                          snapshot.data![index].quiz.toString(),
                                      answer: snapshot.data![index].answer
                                          .toString(),
                                      answerSelect: snapshot
                                          .data![index].answerSelect
                                          .toString(),
                                      quizInfo: snapshot.data![index].infoQuiz!,
                                    );
                                  });
                            } else {
                              return Container();
                            }
                          }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
