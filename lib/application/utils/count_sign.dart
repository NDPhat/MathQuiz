int getSign({required String quiz}) {
  String sign = quiz.replaceAll(RegExp(r"\d"), "").split("")[1];
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
