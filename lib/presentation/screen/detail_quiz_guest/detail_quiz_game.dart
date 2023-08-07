import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import '../../../main.dart';
import '../../widget/answer_widget.dart';

class DetailQuizGame extends StatelessWidget {
  const DetailQuizGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int preId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: colorSystemWhite,
      body: MainPageHomePG(
        textNow: "",
        colorTextAndIcon: colorSystemYeloow,
        onBack: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 85.h,
          padding:
              EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
          child: Column(
            children: [
              SizedBox(
                height: 75.h,
                child: StreamBuilder<List<QuizGameEntityData>>(
                    stream: instance
                        .get<QuizGameLocalRepo>()
                        .getAllQuizGameByPreQuizId(preId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomScrollView(slivers: [
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  childCount: snapshot.data!.length,
                                  (context, index) {
                            return AnswerWidget(
                              quiz: snapshot.data![index].quiz.toString(),
                              quizInfo:
                                  snapshot.data![index].infoQuiz ?? true,
                              answer: snapshot.data![index].answer.toString(),
                              answerSelect: snapshot.data![index].answerSelect
                                  .toString(),
                            );
                          }))
                        ]);
                      } else {
                        return Container();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
