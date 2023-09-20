import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/remote/api/Repo/pre_test_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_test_repo.dart';
import 'package:math/presentation/widget/bg_list_view.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/model/quiz_test_res.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/answer_widget.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class CheckAnswerTestScreen extends StatefulWidget {
  const CheckAnswerTestScreen({Key? key}) : super(key: key);
  @override
  State<CheckAnswerTestScreen> createState() => _CheckAnswerTestScreenState();
}

class _CheckAnswerTestScreenState extends State<CheckAnswerTestScreen> {
  int page = 1;
  bool isFirstLoadRunning = false;
  ScrollController controller = ScrollController();
  bool isLoadMoreRunning = false;
  String key = "";
  List<QuizTestAPIModel>? posts = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      key = ModalRoute.of(context)!.settings.arguments as String;
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
      final List<QuizTestAPIModel>? fetchedPosts = await instance
          .get<QuizTestRepo>()
          .getALlQuizTestByPreTestIDWithPagi(key, page);
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
    final List<QuizTestAPIModel>? fetchedPosts = await instance
        .get<QuizTestRepo>()
        .getALlQuizTestByPreTestIDWithPagi(key, page);
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
        instance.get<PreTestRepo>().deletePreTestById(key);
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
        colorTextAndIcon: Colors.black,
        textNow: 'check answer'.tr().toString(),
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
          child: Container(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: isFirstLoadRunning
                ? Center(
                    child: SizedBox(
                      height: 40.h,
                      width: 80.w,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: colorMainBlue,
                          strokeWidth: 5,
                        ),
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
                  ),
          ),
        ),
      ),
    );
  }
}
