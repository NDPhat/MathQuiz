import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math/application/cons/text_style.dart';
import 'package:math/presentation/widget/app_bar.dart';
import 'package:math/presentation/widget/line_item_content_card_home.dart';

import '../../../application/cons/color.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/model/result_quiz_hw_response.dart';
import '../../../main.dart';
import '../../widget/card_data_item_home.dart';
import '../../widget/child_right_item_card_home.dart';

class DetailItemCardHome extends StatelessWidget {
  const DetailItemCardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(
              size: size,
              onBack: () {
                Navigator.pop(context);
              },
              textTitle: 'Detail Home works',
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05, right: size.width * 0.05),
              child: Column(
                children: [
                  LineContentItem(
                      size: size,
                      title: 'DATA SESSION',
                      icon: const Icon(Icons.do_not_disturb_on_total_silence)),
                  Column(
                    children: [
                      ChildRightHW(
                        size: size,
                        deTail: true,
                      ),
                      const Center(
                          child: Text(
                        'Data home work result by week',
                        style: s14f500ColorMainTe,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
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
                    height: size.height * 0.01,
                  ),
                  LineContentItem(
                      size: size,
                      title: 'DATA WEEKLY',
                      icon: const Icon(Icons.calendar_view_week)),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
