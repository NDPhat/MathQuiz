String findAveScorePra(int score, int totalQ) {
  double value = (score / totalQ) * 100;
  if (value < 50) {
    return "YEU";
  } else if (value > 50 && value < 70) {
    return "TRUNG BINH";
  } else if (value > 70 && value < 80) {
    return "KHA";
  } else if (value > 80) {
    return "GIOI";
  }
  return "KHA";
}

String findAveScoreTest(int score, int totalQ) {
  double value = (score / totalQ) * 100;
  if (value < 50) {
    return "D";
  } else if (value > 50 && value < 70) {
    return "C";
  } else if (value > 70 && value < 80) {
    return "B";
  } else if (value > 80) {
    return "A";
  }
  return "C";
}

String findScoreLocal(double score) {
  if (score < 5) {
    return "D";
  } else if (score > 5 && score < 7) {
    return "C";
  } else if (score > 7 && score < 8) {
    return "B";
  } else if (score > 8) {
    return "A";
  }
  return "C";
}

int findPos(String sign) {
  switch (sign) {
    case "+":
      return 0;
    case "-":
      return 1;
    case "x":
      return 2;
    case "/":
      return 3;
  }
  return 0;
}

int findLength(int length) {
  if (length % 5 > 0) {
    length = length ~/ 5 + 1;
  } else {
    length = length ~/ 5;
  }
  return length;
}

findTimePer(String timeRepeat) {
  switch (timeRepeat) {
    case "3s":
      return 3;
    case "5s":
      return 5;
    case "10s":
      return 10;
    default:
      return 5;
  }
}
