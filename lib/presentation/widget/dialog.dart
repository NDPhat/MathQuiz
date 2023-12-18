
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../../application/cons/text_style.dart';

class DialogCommon{
  Future<void> showInfoQuiz(String info,BuildContext context,Color color) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext contextBuild) {
        return AlertDialog(
          backgroundColor: color,
          title: Text(info,style: s16f700ColorSysWhite,textAlign: TextAlign.center,),
        );
      },
    );
  }

}