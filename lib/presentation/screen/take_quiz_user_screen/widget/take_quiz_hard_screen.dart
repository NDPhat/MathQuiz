import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/model/pre_test_model.dart';
import 'package:math/presentation/routers/navigation.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/item_quiz_easy.dart';
import 'package:sizer/sizer.dart';
import '../../../../application/enum/take_hard_status.dart';
import '../../../../domain/bloc/take_hard/take_hard_cubit.dart';
import '../../home/user_home_screen/widget/main_home_page_bg.dart';

class TakeQuizHardScreen extends StatelessWidget {
  const TakeQuizHardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPageHomePG(
        onBack: () {
          Navigator.pop(context);
        },
        textNow: 'Hard quiz',
        onPressHome: () {},
        colorTextAndIcon: Colors.black,
        child: Stack(
          children: [
            Container(
                width: 100.w,
                height: 90.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_take_easy.jpg"),
                      fit: BoxFit.cover),
                )),
            Container(
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
                                image: AssetImage("assets/images/write.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Puzzle',
                        textBot2: 'number',
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
                                image: AssetImage("assets/images/count.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Connect',
                        textBot2: 'number',
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
                            textBot1: 'Mix',
                            textBot2: 'numbers',
                          )),
                      ItemTakeQuizEasy(
                        bgColor: Colors.pink,
                        onPress: () {},
                        childTop: Container(
                          height: 14.h,
                          width: 30.h,
                          decoration: const BoxDecoration(
                            color: colorSystemWhite,
                            image: DecorationImage(
                                image: AssetImage("assets/images/match.png"),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        textBot1: 'Sentences',
                        textBot2: 'quiz',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
