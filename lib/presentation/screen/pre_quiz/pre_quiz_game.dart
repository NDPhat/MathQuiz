import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/enum/pre_status.dart';
import 'package:math/data/model/make_quiz.dart';
import 'package:math/data/model/option_quiz.dart';
import 'package:math/domain/bloc/pre_quiz/pre_quiz_cubit.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';
import '../../../data/utils/find_time_per.dart';
import '../../routers/navigation.dart';
import '../../widget/app_bar.dart';
import '../../widget/button_custom.dart';
import '../../widget/input_field.dart';

class PreMakeQuizGame extends StatelessWidget {
  PreMakeQuizGame({Key? key}) : super(key: key);
  final items = ['5s', '10s', '15s'];
  String selectedValue = '5s';
  @override
  Widget build(BuildContext context) {
    OptionQuiz option =
        ModalRoute.of(context)!.settings.arguments as OptionQuiz;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
              size: size,
              textTitle: 'MAKE QUIZ',
              onBack: () {
                Navigator.pop(context);
              }),
          SizedBox(
            height: size.height*0.8,
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.02,
                right: size.width * 0.02,
              ),
              child: Center(
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: colorGrayBG,
                        child: Text(
                          option.sign ?? '+',
                          style: s60f700colorSysBlue,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      BlocBuilder<PreQuizCubit, PreQuizState>(
                          buildWhen: (pre, now) {
                        return pre.numQMess != now.numQMess;
                      }, builder: (BuildContext context, state) {
                        return InputField(
                          hintText: 'How many question',
                          size: size.width * 0.8,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              context
                                  .read<PreQuizCubit>()
                                  .numQChanged(int.parse(value));
                            }
                          },
                          hasError: state.numQMess != "",
                          isHidden: state.numQMess != "",
                          validateText: state.numQMess,
                        );
                      }),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      BlocBuilder<PreQuizCubit, PreQuizState>(
                          buildWhen: (pre, now) {
                        return pre.sNumMess != now.sNumMess;
                      }, builder: (BuildContext context, state) {
                        return InputField(
                          hintText: 'Start Value',
                          size: size.width * 0.8,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              context
                                  .read<PreQuizCubit>()
                                  .sNumChanged(int.parse(value ?? "1"));
                            }
                          },
                          hasError: state.sNumMess != "",
                          isHidden: state.sNumMess != "",
                          validateText: state.sNumMess,
                        );
                      }),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      BlocBuilder<PreQuizCubit, PreQuizState>(
                          buildWhen: (pre, now) {
                        return pre.eNumMess != now.eNumMess;
                      }, builder: (BuildContext context, state) {
                        return InputField(
                          hintText: 'End Value',
                          size: size.width * 0.8,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              context
                                  .read<PreQuizCubit>()
                                  .eNumChanged(int.parse(value ?? "1"));
                            }
                          },
                          hasError: state.eNumMess != "",
                          isHidden: state.eNumMess != "",
                          validateText: state.eNumMess,
                        );
                      }),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.07,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.timer),
                            SizedBox(width: size.width * 0.1),
                            const Text(
                              'Time Per Quiz',
                              style: s16f700ColorGreyTe,
                            ),
                            SizedBox(width: size.width * 0.15),
                            BlocBuilder<PreQuizCubit, PreQuizState>(
                                builder: (BuildContext context, state) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),

                                // dropdown below..
                                child: DropdownButton<String>(
                                  value: '${state.time}s',
                                  onChanged: (newValue) {
                                    context.read<PreQuizCubit>().timeChanged(
                                        findTimePer(newValue ?? "5s"));
                                  },
                                  items: items
                                      .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              ))
                                      .toList(),

                                  // add extra sugar..
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 30,
                                  underline: const SizedBox(),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      BlocListener<PreQuizCubit, PreQuizState>(
                          listener: (context, state) {
                            if (state.status == PreQuizStatus.error) {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => const ShowDialogForm());
                              context
                                  .read<PreQuizCubit>()
                                  .clearOldDataErrorForm();
                            } else if (state.status == PreQuizStatus.success) {
                              Navigator.pushNamed(
                                  context,
                                  option.optionQuiz! == "input"
                                      ? Routers.game
                                      : (option.optionQuiz! == "missing"
                                          ? Routers.findMissing
                                          : Routers.trueFalse),
                                  arguments: PreQuizGame(
                                      numQ: state.numQ,
                                      timePer: state.time,
                                      id: state.id,
                                      sign: option.sign!,
                                      option: option.optionQuiz!,
                                      startNum: state.sNum,
                                      endNum: state.eNum));
                            }
                          },
                          child: RoundedButton(
                            press: () {
                              context.read<PreQuizCubit>().addPreQuizGame(
                                  option.sign!, option.optionQuiz!);
                            },
                            color: colorBlueQuaternery,
                            width: size.width * 0.8,
                            height: size.height * 0.06,
                            child: const Text(
                              'START',
                              style: s20f700ColorMBlue,
                            ),
                          )),
                    ],
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowDialogForm extends StatelessWidget {
  const ShowDialogForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          25,
        )),
        backgroundColor: const Color(0xff1542bf),
        title: const FittedBox(
          child: Text('ERROR FORM ?',
              textAlign: TextAlign.center, style: kTitleTS),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Center(child: Text('BACK', style: kTitleTSBold)),
          ),
        ],
      ),
    );
  }
}
