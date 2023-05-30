import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../data/remote/model/detail_quiz_hw_response.dart';
import '../../../data/remote/model/result_quiz_hw_response.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/answer_widget.dart';
import '../../widget/app_bar.dart';
import '../../widget/button_custom.dart';

class CheckAnswerHWScreen extends StatelessWidget {
  const CheckAnswerHWScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String resultID = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
              size: size,
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
                  child: FutureBuilder<List<DetailQuizHWAPIModel>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlQuizDetailByResultID(resultID.toString()),
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
                                  quiz: snapshot.data![index].quiz.toString(),
                                  answer:
                                      snapshot.data![index].answer.toString(),
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
