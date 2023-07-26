import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatDateView = DateFormat('MMMM dd yyyy');
final formatDateInput = DateFormat('MM/dd/yyyy');
final formatTimeInput = DateFormat('HH:mm ');
final formatTimeTestInput = DateFormat('MM/dd/yyyy HH:mm ');

double convertTimeDayToDouble(TimeOfDay myTime) =>
    myTime.hour + myTime.minute / 60.0;

TimeOfDay convertToTimeOfDay(String timeDayString) {
  int hour = int.parse(timeDayString.split(":")[0]);
  int minute = int.parse(timeDayString.split(":")[1]);
  return TimeOfDay(hour: hour, minute: minute);
}

String getTimeEndHW(String text) {
  List<String> listText = text.split(" ");
  List<String> listTex2 = listText[1].split("-");
  return ("${listText[0]} ${listTex2[1]}-${listTex2[2]}");
}
