import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/model/pre_test_model.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/item_quiz_easy.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/enum/take_hard_status.dart';
import '../../../../data/model/user_global.dart';
import '../../../../domain/bloc/take_hard/take_hard_cubit.dart';
import '../../../../main.dart';
import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class TakeQuizHardScreen extends StatelessWidget {
  const TakeQuizHardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg/bg6.jpg',
                ),
                fit: BoxFit.fill),
          ),
          child: MainPageHomePG(
            onBack: () {
              Navigator.pushNamed(context, Routers.takeQuiz);
            },
            textNow: 'hard quiz'.tr(),
            onPressHome: () {
              if (instance.get<UserGlobal>().onLogin == true) {
                Navigator.pushNamed(context, Routers.homeUser);
              } else {
                Navigator.pushNamed(context, Routers.homeGuest);
              }
            },
            homeIcon: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            colorTextAndIcon: Colors.black,
            child: Container(
              alignment: Alignment.center,
              width: 100.w,
              height: 90.h,
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemTakeQuizEasy(
                        bgColor: Colors.yellow,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.puzzleGame);
                        },
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/puzzle.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'puzzle'.tr(),
                        textBot2: 'number'.tr(),
                      ),
                      ItemTakeQuizEasy(
                        bgColor: Colors.purpleAccent,
                        onPress: () {
                          Navigator.pushNamed(context, Routers.dragDropGame);
                        },
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/connect.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'connect'.tr(),
                        textBot2: 'number'.tr(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocListener<TakeHardCubit, TakeHardState>(
                          listener: (context, state) {
                            if (state.status == TakeHardStatus.error) {
                            } else if (state.status == TakeHardStatus.success) {
                              Navigator.pushNamed(context, Routers.mixGame,
                                  arguments: PreTest(
                                      id: state.id,
                                      keyServer: state.idServer,
                                      sumQuiz: 0));
                            }
                          },
                          child: ItemTakeQuizEasy(
                            bgColor: Colors.green,
                            onPress: () {
                              context.read<TakeHardCubit>().addPreTest();
                            },
                            childTop: Container(
                              height: 14.h,
                              width: 30.h,
                              decoration: const BoxDecoration(
                                color: colorSystemWhite,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/mix.png"),
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                            textBot1: 'mix'.tr(),
                            textBot2: 'number'.tr(),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
