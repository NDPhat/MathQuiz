import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:sizer/sizer.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/answer_widget.dart';
import '../../widget/app_bar.dart';

class CheckAnswerScreen extends StatelessWidget {
  const CheckAnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int preId = ModalRoute.of(context)!.settings.arguments as int;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
              textTitle: 'CHECK ANSWER',
              onBack: () {
                Navigator.pushNamed(context, Routers.homeGuest);
              }),
          Container(
            padding:
                EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
            child: Column(
              children: [
                SizedBox(
                  height: 70.h,
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
