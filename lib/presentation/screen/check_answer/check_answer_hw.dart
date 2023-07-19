import 'package:flutter/material.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/quiz_test_res.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
              textTitle: 'CHECK ANSWER',
              onBack: () {
                Navigator.pushNamed(context, Routers.homeUser);
              }),
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.05,
                right: size.width * 0.05,
                bottom: size.height * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.7,
                  child: data.type == "hw"
                      ? FutureBuilder<List<DetailQuizHWAPIModel>?>(
                          future: instance
                              .get<UserAPIRepo>()
                              .getALlQuizDetailByResultID(data.id.toString()),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                height: size.height * 0.3,
                                width: size.width * 0.3,
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
                                      size: size,
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
                                height: size.height * 0.3,
                                width: size.width * 0.3,
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
                                      size: size,
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
