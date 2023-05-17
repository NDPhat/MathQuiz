import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class Info_Player_Line extends StatelessWidget {
  const Info_Player_Line({
    super.key,
    required this.size,
    required int falsePlayer,
    required int score,
    required this.namePlayer,
  })  : _falsePlayer = falsePlayer,
        _score = score;

  final Size size;
  final int _falsePlayer;
  final int _score;
  final String namePlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          namePlayer != "BOT"
              ? SizedBox(
                  width: size.width * 0.36,
                  child: Row(
                    children: [
                      Visibility(
                        visible: _falsePlayer >= 1,
                        child: const Icon(
                          Icons.heart_broken,
                          size: 20,
                          color: colorErrorPrimary,
                        ),
                      ),
                      Visibility(
                        visible: _falsePlayer >= 2,
                        child: const Icon(
                          Icons.heart_broken,
                          size: 20,
                          color: colorErrorPrimary,
                        ),
                      ),
                      Visibility(
                        visible: _falsePlayer >= 3,
                        child: const Icon(
                          Icons.heart_broken,
                          size: 20,
                          color: colorErrorPrimary,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            width: size.width * 0.3,
            child: Text(
              namePlayer,
              style: s16f700ColorError,
            ),
          ),
          SizedBox(
            width: size.width * 0.2,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                _score.toString(),
                style: s16f700ColorError,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              const CircleAvatar(
                backgroundColor: colorErrorPrimary,
                radius: 10,
                child: Icon(
                  Icons.check,
                  size: 10,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
