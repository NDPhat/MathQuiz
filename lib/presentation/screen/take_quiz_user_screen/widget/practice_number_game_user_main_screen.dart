import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/data/remote/model/pre_quiz_game_response.dart';
import '../../../../application/cons/color.dart';
import '../../../../application/cons/constants.dart';
import '../../../../application/cons/text_style.dart';
import '../../../../data/model/user_global.dart';
import '../../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../../main.dart';
import '../../../routers/navigation.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/button_custom.dart';
import '../../../widget/item_card_hw.dart';
import 'item_history_screen.dart';

class PracticeNumberGameUserScreen extends StatelessWidget {
  const PracticeNumberGameUserScreen({Key? key}) : super(key: key);

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
            title: FittedBox(
              child: Text("${'review your answer'.tr()} ?",
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.checkAnswerPracUserGame,
                      arguments: idResult);
                },
                child:  Text('go'.tr().toString(), style: kTitleTSSmall),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:  Text('exit'.tr().toString(), style: kTitleTSSmall),
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
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: 'number'.tr().toString(),
          ),
          SizedBox(
            height: size.height * 0.15,
            width: size.width,
            child: Center(
              child: RoundedButton(
                  press: () async {
                    Navigator.pushNamed(
                      context,
                      Routers.chooseSign,
                    );
                  },
                  color: colorMainBlue,
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  child:  Text(
                    'join'.tr().toString(),
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
            child:  Center(
                child: Text(
              'history'.tr().toString(),
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
                            childRight:  Center(
                                child: Text(
                              'done'.tr().toString(),
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
