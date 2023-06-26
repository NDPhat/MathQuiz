import 'package:flutter/material.dart';
import 'package:math/data/remote/model/pre_quiz_game_response.dart';
import 'package:math/data/remote/model/pre_quiz_game_sen_req.dart';
import 'package:math/data/remote/model/pre_quiz_game_sen_res.dart';
import 'package:math/presentation/screen/pratice_game_user/widget/item_history_screen.dart';

import '../../../../application/cons/color.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/cons/text_style.dart';
import '../../../../application/utils/format.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/button_custom.dart';
import '../../../widget/item_card_hw.dart';

class PracticeSenGameUserScreen extends StatelessWidget {
  const PracticeSenGameUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> showDoneDialog(String idResult) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              25,
            )),
            backgroundColor: const Color(0xff1542bf),
            title: const FittedBox(
              child: Text('REVIEW YOUR ANSWER?',
                  textAlign: TextAlign.center, style: s30f700colorSysWhite),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.checkAnswerPracUserGame,
                      arguments: idResult);
                },
                child: const Text('GO', style: s16f700ColorError),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('EXIT', style: s15f700ColorYellow),
              ),
            ],
          );
        },
      );
    }

    Future<void> showCreateSenGameDialog() {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              25,
            )),
            backgroundColor: const Color(0xff1542bf),
            title: const FittedBox(
              child: Text('JOIN YOUR PRACTICE GAME ??',
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  PreQuizGameSenModelRes? data = await instance
                      .get<UserAPIRepo>()
                      .createPreQuizSenGame(PreQuizGameSenReq(
                          userID: instance.get<UserGlobal>().id,
                          dateSave: formatDateInput.format(DateTime.now()),
                          status: "GOING",
                          score: 0));
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.senGameScreen,
                      arguments: data);
                },
                child: const Text('GO', style: s16f700ColorError),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('EXIT', style: s15f700ColorYellow),
              ),
            ],
          );
        },
      );
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            size: size,
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: 'Practice',
          ),
          SizedBox(
            height: size.height * 0.15,
            width: size.width,
            child: Center(
              child: RoundedButton(
                  press: () async {
                    showCreateSenGameDialog();
                  },
                  color: colorMainBlue,
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  child: const Text(
                    'JOIN',
                    style: s30f500colorSysWhite,
                  )),
            ),
          ),
          Container(
            height: 1,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: colorGrayBG),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            height: size.height * 0.025,
            child: const Center(
                child: Text(
              'HISTORY',
              style: s20f700ColorErrorPro,
            )),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.6,
              width: size.width * 0.9,
              child: FutureBuilder<List<PreQuizGameAPIModel>?>(
                  future: instance
                      .get<UserAPIRepo>()
                      .getALlPreQuizGameByUidandStatus(
                          instance.get<UserGlobal>().id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: size.height * 0.3,
                        width: size.width * 0.3,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: colorMainBlue,
                            strokeWidth: 5,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ItemCardHW(
                            onTap: () {
                              showDoneDialog(snapshot.data![index].key!);
                            },
                            size: size,
                            backgroundColor: colorMainBlue,
                            childRight: const Center(
                                child: Text(
                              'DONE',
                              style: s20f700ColorSysWhite,
                            )),
                            childLeft: PracticeMainScreenItemCard(
                                size: size,
                                index: index + 1,
                                dataResult: snapshot.data![index]),
                          );
                        },
                      );
                    }

                    return Container();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
