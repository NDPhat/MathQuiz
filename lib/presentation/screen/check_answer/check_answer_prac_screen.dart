import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/quiz_game_response.dart';
import '../../../application/cons/color.dart';
import '../../../main.dart';
import '../../widget/answer_widget.dart';
import '../../widget/app_bar.dart';

class CheckAnswerPracUserGameScreen extends StatelessWidget {
  const CheckAnswerPracUserGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
              textTitle: 'check answer'.tr().toString(),
              onBack: () {
                Navigator.pop(context);
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
                    child: FutureBuilder<List<QuizGameAPIModel>?>(
                        future: instance
                            .get<UserAPIRepo>()
                            .getALlQuizGameByPreGameID(id),
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
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
