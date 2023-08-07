import 'package:google_fonts/google_fonts.dart';
import 'package:math/application/cons/color.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:flutter/material.dart';

List<TargetFocus> listTargetFocusMainDrag({
  required GlobalKey timeKey,
  required GlobalKey userManualKey,
}) {
  List<TargetFocus> targets = [];

  targets.add(TargetFocus(
      keyTarget: timeKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "This in time countdown",
                    style: GoogleFonts.aclonica(
                        color: colorMainBlue, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })
      ]));
  targets.add(TargetFocus(
      keyTarget: userManualKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "This in user manual.Click for more information !!",
                    style: GoogleFonts.aclonica(
                        color: colorMainBlue, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })
      ]));

  return targets;
}

List<TargetFocus> listTargetFocusUserManDrag({
  required GlobalKey dragKey,
  required GlobalKey dropKey,
  required String textDrop,
  required String textDrag,
}) {
  List<TargetFocus> targets = [];
  targets.add(TargetFocus(
      keyTarget: dragKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textDrag,
                    style: GoogleFonts.aclonica(
                        color: colorMainBlue, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })
      ]));
  targets.add(TargetFocus(
      keyTarget: dropKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textDrop,
                    style: GoogleFonts.aclonica(
                        color: colorMainBlue, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })
      ]));
  return targets;
}

List<TargetFocus> listTargetFocusMainPuzzle({
  required GlobalKey timeKey,
  required GlobalKey userManualKey,
  required GlobalKey checkAnswer,
}) {
  List<TargetFocus> targets = [];

  targets.add(TargetFocus(
      keyTarget: timeKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "This in time countdown",
                    style: GoogleFonts.aclonica(
                        color: colorMainBlue, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })
      ]));
  targets.add(TargetFocus(
      keyTarget: userManualKey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "This in user manual.Click for more information !!",
                    style: GoogleFonts.aclonica(
                        color: colorMainBlue, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })
      ]));
  targets.add(TargetFocus(
      keyTarget: checkAnswer,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Press to check answer !!",
                    style: GoogleFonts.aclonica(
                        color: colorMainBlue, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            })
      ]));

  return targets;
}
