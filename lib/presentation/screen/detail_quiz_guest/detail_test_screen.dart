import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:math/presentation/widget/bg_list_view.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../data/local/repo/test/quiz_test_local_repo.dart';
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
        child: BackGroundListView(
          colorBG: colorMainTealPri,
          width: 90.w,
          height: 90.h,
          content: 'history'.tr(),
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Container(
              padding: EdgeInsets.only(top: 10.h),
              height: 85.h,
              child: StreamBuilder<List<QuizTestLocalEntityData>>(
                  stream: instance
                      .get<QuizTestLocalRepo>()
                      .getAllTestByPreTestId(preId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                            answer: snapshot.data![index].answer.toString(),
                            answerSelect:
                                snapshot.data![index].answerSelect.toString(),
                            quizInfo: snapshot.data![index].infoQuiz!,
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
