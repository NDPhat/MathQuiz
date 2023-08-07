import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../main.dart';
import '../../widget/answer_widget.dart';

class DetailTestScreen extends StatelessWidget {
  const DetailTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int preId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: MainPageHomePG(
        textNow: "",
        colorTextAndIcon: colorSystemYeloow,
        onBack: () {
          Navigator.pop(context);
        },
        child: Container(
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
                        return CustomScrollView(slivers: [
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  childCount: snapshot.data!.length,
                                  (context, index) {
                            return AnswerWidget(
                              quiz: snapshot.data![index].quiz.toString(),
                              answer: snapshot.data![index].answer.toString(),
                              answerSelect: snapshot.data![index].answerSelect
                                  .toString(),
                              quizInfo: snapshot.data![index].infoQuiz!,
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
