import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:math/data/remote/model/pre_quiz_hw_res.dart';
import '../../application/cons/color.dart';
import '../../application/cons/constants.dart';
import '../../application/cons/text_style.dart';

import 'package:math/data/model/data_weak.dart';

import '../../data/remote/api/Repo/api_user_repo.dart';
import '../../main.dart';
import '../routers/navigation.dart';

class WeakWidget extends StatelessWidget {
  const WeakWidget({Key? key, required this.size, required this.data})
      : super(key: key);
  final Size size;
  final DataWeak data;

  @override
  Widget build(BuildContext context) {
    PreQuizHW? dataRes;
    Future<void> showJoinHWDialog() {
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
              child: Text('READY FOR YOUR HOME WORK ?',
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routers.homeworkGame,
                      arguments: dataRes);
                },
                child: const Text('GO', style: kDialogButtonsTS),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('EXIT', style: kDialogButtonsTS),
              ),
            ],
          );
        },
      );
    }

    Future<void> showHWNotAvaDialog() {
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
              child: Text('THIS HOMEWORK IS NOT AVAILABLE',
                  textAlign: TextAlign.center, style: kTitleTS),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(child: Text('EXIT', style: kDialogButtonsTS)),
              ),
            ],
          );
        },
      );
    }

    return GestureDetector(
      onTap: () async {
        dataRes = await instance
            .get<UserAPIRepo>()
            .getPreQuizHWByWeek(data.weak.toString());
        if (dataRes != null) {
          showJoinHWDialog();
        } else {
          showHWNotAvaDialog();
        }
      },
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                bottom: size.height * 0.03,
              ),
              child: CircleAvatar(
                radius: size.width * 0.1,
                backgroundColor: colorBlueQuaternery,
                child: Center(
                    child: Text(
                  'Weak ${data.weak}',
                  style: s16f700ColorError,
                )),
              ),
            ),
            RatingBar.builder(
              initialRating: data.score ?? 3,
              minRating: 1,
              itemSize: 18,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            )
          ],
        ),
      ),
    );
  }
}
