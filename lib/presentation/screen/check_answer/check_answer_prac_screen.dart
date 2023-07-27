import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../data/remote/model/quiz_game_with_pagination_res.dart';
import '../../../main.dart';
import '../../widget/answer_widget.dart';

class CheckAnswerPracUserGameScreen extends StatefulWidget {
  const CheckAnswerPracUserGameScreen({Key? key}) : super(key: key);
  @override
  State<CheckAnswerPracUserGameScreen> createState() =>
      _CheckAnswerPracUserGameScreenState();
}

class _CheckAnswerPracUserGameScreenState
    extends State<CheckAnswerPracUserGameScreen> {
  int page = 1;
  bool isFirstLoadRunning = false;
  bool hasNextPage = true;
  ScrollController controller = ScrollController();
  bool isLoadMoreRunning = false;
  late String id;
  List<QuizGameAPIPagiModel>? posts = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      id = ModalRoute.of(context)!.settings.arguments as String;
      firstLoad();
      controller.addListener(loadMore);
    });
  }

  void loadMore() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      page += 1; // Increase _page by 1
      final List<QuizGameAPIPagiModel>? fetchedPosts = await instance
          .get<UserAPIRepo>()
          .getALlQuizGameByPreGameIDWithPagination(id, page);
      if (fetchedPosts!.isNotEmpty) {
        setState(() {
          posts!.addAll(fetchedPosts);
        });
      } else {
        setState(() {
          hasNextPage = false;
        });
      }
      setState(() {
        isLoadMoreRunning = false;
      });
    }
  }

  void firstLoad() async {
    setState(() {
      isFirstLoadRunning = true;
    });
    final List<QuizGameAPIPagiModel>? fetchedPosts = await instance
        .get<UserAPIRepo>()
        .getALlQuizGameByPreGameIDWithPagination(id, page);
    if (fetchedPosts!.isNotEmpty) {
      setState(() {
        posts!.addAll(fetchedPosts);
      });
    }
    setState(() {
      isFirstLoadRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainPageHomePG(
            textNow: 'check answer'.tr().toString(),
            colorTextAndIcon: Colors.black,
            onPressHome: () {},
            child: Container(
                padding: EdgeInsets.only(
                    top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                child: isFirstLoadRunning
                    ? SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: colorMainBlue,
                            strokeWidth: 5,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 80.h,
                        width: 90.w,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 75.h,
                              width: 90.w,
                              child: CustomScrollView(
                                controller: controller,
                                slivers: [
                                  SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                          childCount: posts!.length,
                                          (context, index) {
                                    return AnswerWidget(
                                      quiz: posts![index].quiz.toString(),
                                      answer: posts![index].answer.toString(),
                                      answerSelect:
                                          posts![index].answerSelect.toString(),
                                      quizInfo: posts![index].infoQuiz!,
                                    );
                                  }))
                                ],
                              ),
                            ),
                            if (isLoadMoreRunning == true)
                              SizedBox(
                                height: 5.h,
                                width: 30.w,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: colorMainBlue,
                                    strokeWidth: 5,
                                  ),
                                ),
                              ),
                            if (hasNextPage == false) Container(),
                          ],
                        ),
                      ))));
  }
}
