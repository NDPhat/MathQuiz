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
