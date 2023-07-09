import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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

class PreMakeQuizGame extends StatelessWidget {
  PreMakeQuizGame({Key? key}) : super(key: key);
  final items = ['3s', '5s', '10s'];
  String selectedValue = '5s';
  @override
  Widget build(BuildContext context) {
    OptionQuiz option =
        ModalRoute.of(context)!.settings.arguments as OptionQuiz;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorMainBlue,
      body: Column(
        children: [
          AppBarWidget(
              size: size,
              onBack: () {
                Navigator.pop(context);
              }),
          Center(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.1,
                  decoration: const BoxDecoration(
                      color: colorSystemWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Center(
                    child: Text(
                      "LETTER QUIZ",
                      style: GoogleFonts.abel(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.75,
                  color: colorMainTealPri,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/circle_sign.png",
                              height: size.height * 0.2,
                              width: size.width,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: size.height * 0.05),
                              alignment: Alignment.center,
                              width: size.width,
                              child: Text(
                                option.sign ?? '+',
                                style: s60f700colorSysBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          right: size.width * 0.03,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Start  ",
                              style: s16f700ColorGreyTe,
                            ),
                            Text(
                              "End  ",
                              style: s16f700ColorGreyTe,
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<PreQuizCubit, PreQuizState>(
                          builder: (BuildContext context, state) {
                        return RangeSlider(
                          values: RangeValues(
                              double.parse(state.sNum!.toString()),
                              double.parse(state.eNum!.toString())),
                          max: 20,
                          activeColor: colorErrorPrimary,
                          inactiveColor: colorSystemWhite,
                          divisions: 20,
                          labels: RangeLabels(
                            state.sNum!.round().toString(),
                            state.eNum!.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            context.read<PreQuizCubit>().seNumChanged(values);
                          },
                        );
                      }),
                      SizedBox(
                        height: size.height * 0.1,
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
                                          : (option.optionQuiz! == "truefalse"
                                              ? Routers.trueFalse
                                              : (option.optionQuiz! == "puzzle"
                                                  ? Routers.puzzleGame
                                                  : Routers.dragDropGame))),
                                  arguments: PreQuizGame(
                                      id: state.id,
                                      numQ: 0,
                                      sign: option.sign!,
                                      idServer: state.idServer,
                                      option: option.optionQuiz!,
                                      startNum: state.sNum,
                                      endNum: state.eNum));
                            }
                          },
                          child: RoundedButton(
                            press: () {
                              // context.read<PreQuizCubit>().addPreQuizGame(
                              //     option.sign!, option.optionQuiz!);
                              context.read<PreQuizCubit>().addPuzzle();
                            },
                            color: colorBlueQuaternery,
                            width: size.width * 0.8,
                            height: size.height * 0.1,
                            child: Text('START',
                                style: GoogleFonts.aBeeZee(fontSize: 40)),
                          )),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  decoration: const BoxDecoration(
                      color: colorSystemWhite,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50))),
                ),
              ],
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
