import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../main.dart';
import '../../widget/answer_widget.dart';
import '../../widget/app_bar.dart';
import '../../widget/button_custom.dart';

class DetailTestScreen extends StatelessWidget {
  const DetailTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int preId = ModalRoute.of(context)!.settings.arguments as int;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
              size: size,
              onBack: () {
                Navigator.pop(context);
              }),
          Container(
            padding: EdgeInsets.only(
                top: size.height * 0.06,
                left: size.width * 0.05,
                right: size.width * 0.05,
                bottom: size.height * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.7,
                  child: StreamBuilder<List<QuizTestEntityData>>(
                      stream: instance
                          .get<QuizTestLocalRepo>()
                          .getAllTestByPreTestId(preId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return AnswerWidget(
                                  quiz: snapshot.data![index].quiz.toString(),
                                  size: size,
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
