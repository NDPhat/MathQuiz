import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class Info_Player_Line extends StatelessWidget {
  const Info_Player_Line({
    super.key,
    required int falsePlayer,
    required int score,
    required this.namePlayer,
  })  : _falsePlayer = falsePlayer,
        _score = score;

  final int _falsePlayer;
  final int _score;
  final String namePlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 05.w, right: 05.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          namePlayer != "BOT"
              ? Row(
                  children: [
                    SizedBox(
                      width: 40.w,
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
                    ),
                    SizedBox(
                      width: 30.w,
                      child: Text(
                        namePlayer,
                        style: s16f700ColorError,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _score.toString(),
                              style: s16f700ColorError,
                            ),
                            SizedBox(width: 2.w),
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
                )
              : Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        alignment: Alignment.center,
                        width: 78.w,
                        child: Text(
                          namePlayer,
                          style: s16f700ColorError,
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                _score.toString(),
                                style: s16f700ColorError,
                              ),
                              SizedBox(
                                width: 1.w,
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
                ),
        ],
      ),
    );
  }
}
