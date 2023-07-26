import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/domain/bloc/pre_quiz/pre_quiz_cubit.dart';
import 'package:math/presentation/screen/take_quiz_user_screen/widget/item_quiz_easy.dart';
import 'package:sizer/sizer.dart';
import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../application/enum/pre_status.dart';
import '../../../data/model/make_quiz.dart';
import '../../routers/navigation.dart';
import '../../widget/button_custom.dart';
import '../home/user_home_screen/widget/main_home_page_bg.dart';

class OptionGameModeScreen extends StatelessWidget {
  const OptionGameModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sign = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: MainPageHomePG(
          textNow: 'choose mode'.tr().toString(),
          onPressHome: () {},
          colorTextAndIcon: Colors.black,
          child: Stack(
            children: [
              Container(
                  width: 100.w,
                  height: 90.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg_mode.jpg"),
                        fit: BoxFit.cover),
                  )),
              Padding(
                padding: EdgeInsets.only(
                  top: 5.h,
                  left: 2.h,
                  right: 2.h,
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80.h,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlocListener<PreQuizCubit, PreQuizState>(
                                  listenWhen: (pre, now) {
                                    return now.optionGame == "input";
                                  },
                                  listener: (context, state) {
                                    if (state.status == PreQuizStatus.error) {
                                    } else if (state.status ==
                                        PreQuizStatus.success) {
                                      Navigator.pushNamed(
                                          context, Routers.enterAnswerGame,
                                          arguments: PreQuizGame(
                                            id: state.id,
                                            numQ: 0,
                                            sign: sign,
                                            idServer: state.idServer,
                                            option: "input",
                                          ));
                                    }
                                  },
                                  child: ItemTakeQuizEasy(
                                      onPress: () {
                                        context
                                            .read<PreQuizCubit>()
                                            .addPreQuizGame(sign, "input");
                                      },
                                      bgColor: Colors.yellow,
                                      childTop: Container(
                                        height: 14.h,
                                        width: 30.h,
                                        decoration: const BoxDecoration(
                                          color: colorSystemWhite,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/add_mode.png"),
                                              fit: BoxFit.scaleDown),
                                        ),
                                      ),
                                      textBot1: "Enter",
                                      textBot2: "answer")),
                              SizedBox(
                                height: 5.h,
                              ),
                              BlocListener<PreQuizCubit, PreQuizState>(
                                  listenWhen: (pre, now) {
                                    return now.optionGame == "true/false";
                                  },
                                  listener: (context, state) {
                                    if (state.status == PreQuizStatus.error) {
                                    } else if (state.status ==
                                        PreQuizStatus.success) {
                                      Navigator.pushNamed(
                                          context, Routers.tfGame,
                                          arguments: PreQuizGame(
                                            id: state.id,
                                            numQ: 0,
                                            sign: sign,
                                            idServer: state.idServer,
                                            option: "true/false",
                                          ));
                                    }
                                  },
                                  child: ItemTakeQuizEasy(
                                      onPress: () {
                                        context
                                            .read<PreQuizCubit>()
                                            .addPreQuizGame(sign, "true/false");
                                      },
                                      bgColor: Colors.green,
                                      childTop: Container(
                                        height: 14.h,
                                        width: 30.h,
                                        decoration: const BoxDecoration(
                                          color: colorSystemWhite,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/tf_mode.png"),
                                              fit: BoxFit.scaleDown),
                                        ),
                                      ),
                                      textBot1: "True/False",
                                      textBot2: "quiz")),
                              SizedBox(
                                height: 5.h,
                              ),
                              BlocListener<PreQuizCubit, PreQuizState>(
                                  listenWhen: (pre, now) {
                                    return now.optionGame == "missing";
                                  },
                                  listener: (context, state) {
                                    if (state.status == PreQuizStatus.error) {
                                    } else if (state.status ==
                                        PreQuizStatus.success) {
                                      Navigator.pushNamed(
                                          context, Routers.missingGame,
                                          arguments: PreQuizGame(
                                            id: state.id,
                                            numQ: 0,
                                            sign: sign,
                                            idServer: state.idServer,
                                            option: "missing",
                                          ));
                                    }
                                  },
                                  child: ItemTakeQuizEasy(
                                      onPress: () {
                                        context
                                            .read<PreQuizCubit>()
                                            .addPreQuizGame(sign, "missing");
                                      },
                                      bgColor: Colors.pink,
                                      childTop: Container(
                                        height: 14.h,
                                        width: 30.h,
                                        decoration: const BoxDecoration(
                                          color: colorSystemWhite,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/find_mode.png"),
                                              fit: BoxFit.scaleDown),
                                        ),
                                      ),
                                      textBot1: "Find",
                                      textBot2: "number")),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ItemMenuGameMode extends StatelessWidget {
  const ItemMenuGameMode({
    super.key,
    required this.size,
    required this.textTitle,
    required this.onPress,
    required this.icon,
  });

  final Size size;
  final String textTitle;
  final Widget icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.02,
            left: size.width * 0.05,
            right: size.width * 0.05),
        decoration: BoxDecoration(
            border: Border.all(color: colorErrorPrimary),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: RoundedButton(
          press: onPress,
          color: colorSystemWhite,
          width: size.width * 0.8,
          height: size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(
                textTitle,
                style: s16f700ColorGreyTe,
              ),
            ],
          ),
        ));
  }
}
