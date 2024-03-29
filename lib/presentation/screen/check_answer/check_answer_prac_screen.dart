import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/remote/api/Repo/pre_pra_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_pra_repo.dart';
import 'package:math/presentation/screen/home/user_home_screen/widget/main_home_page_bg.dart';
import 'package:math/presentation/widget/bg_list_view.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/model/quiz_pra_res.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
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
  ScrollController controller = ScrollController();
  bool isLoadMoreRunning = false;
  late String id;
  List<QuizPraAPIModel>? posts = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      id = ModalRoute.of(context)!.settings.arguments as String;
      firstLoad();
      controller.addListener(loadMore);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void loadMore() async {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      setState(() {
        isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      page += 1; // Increase _page by 1
      final List<QuizPraAPIModel>? fetchedPosts = await instance
          .get<QuizPraRepo>()
          .getALlQuizGameByPreGameIDWithPagination(id, page);
      if (fetchedPosts!.isNotEmpty) {
        setState(() {
          posts!.addAll(fetchedPosts);
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
    final List<QuizPraAPIModel>? fetchedPosts = await instance
        .get<QuizPraRepo>()
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

  showSettingDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      desc: "choose one".tr(),
      descTextStyle: s20GgBarColorMainTeal,
      btnOkText: "home".tr(),
      btnCancelText: "DELETE".tr(),
      btnOkOnPress: () {
        if (instance.get<UserGlobal>().onLogin == true) {
          Navigator.pushNamed(context, Routers.homeUser);
        } else {
          Navigator.pushNamed(context, Routers.homeGuest);
        }
      },
      btnCancelOnPress: () {
        instance.get<PrePraRepo>().deletePreQuizGame(id);
        Navigator.pushNamed(context, Routers.dataSheetScreen);
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainPageHomePG(
            onBack: () {
              Navigator.pop(context);
            },
            textNow: 'check answer'.tr().toString(),
            colorTextAndIcon: Colors.black,
            onPressHome: () {
              showSettingDialog();
            },
            iconRight: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            child: BackGroundListView(
              colorBG: colorMainTealPri,
              width: 90.w,
              height: 90.h,
              content: 'check answer'.tr(),
              child: Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: isFirstLoadRunning
                      ? Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 90.w,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: colorMainTealPri,
                              strokeWidth: 5,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.h),
                              height: 85.h,
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
                                height: 3.h,
                                width: 80.w,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: colorMainBlue,
                                    strokeWidth: 5,
                                  ),
                                ),
                              ),
                          ],
                        )),
            )));
  }
}
