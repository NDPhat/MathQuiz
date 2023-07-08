import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math/application/cons/color.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/button_custom.dart';

import '../../../application/cons/constants.dart';
import '../../../application/cons/text_style.dart';
import '../../../data/model/check_model.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/model/pre_test_req.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/item_card_hw.dart';
import '../../widget/test_main_screen_item.dart';
import '../../widget/weak_widget.dart';

class MainTestingUserScreen extends StatelessWidget {
  const MainTestingUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              child: Text("${'review your answer'.tr()}?",
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.checkAnswerHW,
                      arguments: CheckAnswerModel(id: idResult, type: "test"));
                },
                child: Text('go'.tr().toString(), style: kTitleTSSmall),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('exit'.tr().toString(), style: kTitleTSSmall),
              ),
            ],
          );
        },
      );
    }

    Future<void> showCreateTestDialog() {
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
              child: Text('READY FOR YOUR TESTING?',
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  PreTestAPIRes? preTest = await instance
                      .get<UserAPIRepo>()
                      .createPreQuizTest(PreTestReq(
                          sumQ: 0,
                          score: 0,
                          dateSave: DateTime.now().toString(),
                          trueQ: 0,
                          falseQ: 0,
                          userID: instance.get<UserGlobal>().id!));
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.testingUser,
                      arguments: preTest);
                },
                child: const Text('GO', style: kTitleTSSmall),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('EXIT', style: kTitleTSSmall),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            size: size,
            onBack: () {
              Navigator.pop(context);
            },
            textTitle: 'Testing',
          ),
          SizedBox(
            height: size.height * 0.15,
            width: size.width,
            child: Center(
              child: RoundedButton(
                  press: () async {
                    showCreateTestDialog();
                  },
                  color: colorMainBlue,
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  child: Text(
                    'test'.tr().toString(),
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
            child: Center(
                child: Text(
              'history'.tr().toString(),
              style: s20f700ColorErrorPro,
            )),
          ),
          Container(
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height * 0.6,
                width: size.width * 0.9,
                child: FutureBuilder<List<PreTestAPIRes>?>(
                    future: instance.get<UserAPIRepo>().getALlPreQuizTestByUid(
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
                              childRight: Center(
                                  child: Text(
                                'done'.tr().toString(),
                                style: s20f700ColorSysWhite,
                              )),
                              childLeft: TestmainScreenItemCard(
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
            ),
          )
        ],
      ),
    );
  }
}
