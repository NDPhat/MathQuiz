import 'package:flutter/material.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';

import '../../../application/cons/color.dart';
import '../../../application/cons/text_style.dart';
import '../../../main.dart';
import '../../routers/navigation.dart';
import '../../widget/answer_widget.dart';
import '../../widget/button_custom.dart';



class CheckAnswerScreen extends StatelessWidget {
  const CheckAnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int preId = ModalRoute.of(context)!.settings.arguments as int;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.school),
        backgroundColor: colorMainBlueChart,
        title: const Text('Math Quiz', style: s30f500colorSysWhite),
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: size.height * 0.05,
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.height * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.6,
              child: StreamBuilder<List<QuizTestEntityData>>(
                  stream: instance
                      .get<QuizTestLocalRepo>()
                      .getAllTestByPreTestId(preId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return AnswerWidget(
                              size: size,
                              num1: snapshot.data![index].num1.toString(),
                              num2: snapshot.data![index].num2.toString(),
                              sign: snapshot.data![index].sign.toString(),
                              answer: snapshot.data![index].answer.toString(),
                              answerSelect:
                                  snapshot.data![index].answerSelect.toString(),
                            );
                          });
                    } else {
                      return Container();
                    }
                  }),
            ),
            SizedBox(height: size.height * 0.05,),
            RoundedButton(
              press: () {
                Navigator.pushNamed(context, Routers.homeGuest);
              },
              color: colorBlueQuaternery,
              width: size.width * 0.8,
              height: size.height * 0.06,
              child: const Text(
                'BACK',
                style: s20f700ColorErrorPro,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
