import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/presentation/widget/bg_list_view.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../data/remote/api/Repo/quiz_hw_repo.dart';
import '../../../data/remote/model/quiz_hw_res.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/answer_widget.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class CheckAnswerHWScreen extends StatelessWidget {
  const CheckAnswerHWScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String key = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        body: MainPageHomePG(
            onBack: () {
              Navigator.pop(context);
            },
            colorTextAndIcon: Colors.black,
            textNow: 'check answer'.tr().toString(),
            onPressHome: () {
              Navigator.pushNamed(context, Routers.homeUser);
            },
            homeIcon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            child: BackGroundListView(
              colorBG: colorMainTealPri,
              width: 90.w,
              height: 90.h,
              content: 'check answer'.tr(),
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h),
                child: FutureBuilder<List<QuizHWAPIModel>?>(
                    future: instance
                        .get<QuizHWRepo>()
                        .getALlQuizDetailByResultID(key),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                        return CustomScrollView(
                          slivers: [
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
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            )));
  }
}
