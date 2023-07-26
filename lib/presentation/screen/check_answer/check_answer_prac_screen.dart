import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/quiz_game_response.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../main.dart';
import '../../widget/answer_widget.dart';
import '../../widget/app_bar.dart';

class CheckAnswerPracUserGameScreen extends StatelessWidget {
  const CheckAnswerPracUserGameScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: MainPageHomePG(
        textNow: 'check answer'.tr().toString(),
        colorTextAndIcon: Colors.black,
        onPressHome: () {},
        child: Container(
          padding:
              EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
          child: Column(
            children: [
              SizedBox(
                  height: 80.h,
                  child: FutureBuilder<List<QuizGameAPIModel>?>(
                      future: instance
                          .get<UserAPIRepo>()
                          .getALlQuizGameByPreGameID(id),
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
      ),
    );
  }
}
