import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:math/presentation/widget/bg_list_view.dart';
import 'package:sizer/sizer.dart';
import '../../../data/local/repo/quiz_pra/quiz_pra_local_repo.dart';
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
        child: BackGroundListView(
          height: 90.h,
          width: 90.w,
          colorBG: colorMainTealPri,
          content: 'history'.tr(),
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Container(
              padding: EdgeInsets.only(top: 10.h),
              height: 85.h,
              child: StreamBuilder<List<QuizPraLocalEntityData>>(
                  stream: instance
                      .get<QuizPraLocalRepo>()
                      .getAllQuizGameByPreQuizId(preId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Container(
                        alignment: Alignment.center,
                        height: 40.h,
                        width: 90.w,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: colorMainTealPri,
                            strokeWidth: 5,
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
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
          ),
        ),
      ),
    );
  }
}
