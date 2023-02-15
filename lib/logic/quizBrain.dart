import 'dart:math';

import 'package:math/data/model/make_quiz.dart';

class QuizBrain {
  int _quizAnswer = 0;
  var listAnswer = [0, 0, 0, 0];
  var _quiz = '';
  Random _random = Random();
  void makeQuiz(PreQuiz preQuiz) {
    var firstNumber = _random.nextInt(preQuiz.endNum!) + preQuiz.startNum!;
    var secondNumber = _random.nextInt(preQuiz.endNum!) + preQuiz.startNum!;

    switch (preQuiz.sign) {
      case '+':
        _quizAnswer = firstNumber + secondNumber;
        break;
      case '-':
        secondNumber = _random.nextInt(firstNumber);
        _quizAnswer = firstNumber - secondNumber;
        break;
      case 'x':
        _quizAnswer = firstNumber * secondNumber;
        break;
      case '/':
        {
          var listNumber2 = [];
          if (firstNumber % secondNumber != 0) {
            for (int i = preQuiz.startNum!; i <= secondNumber; i++) {
              if (firstNumber % i == 0) {
                listNumber2.add(i);
              }
            }
          }
          if (listNumber2.isEmpty) {
            secondNumber = firstNumber;
          } else {
            secondNumber = listNumber2[_random.nextInt(listNumber2.length)];
          }
          _quizAnswer = firstNumber ~/ secondNumber;
        }
    }
    var anwser1 = preQuiz.startNum!;
    var anwser2 = preQuiz.startNum!;
    var anwser3 = preQuiz.startNum!;
    do {
      anwser3 =
          _random.nextInt(_quizAnswer + preQuiz.endNum!) + preQuiz.startNum!;
    } while (anwser3 == _quizAnswer);
    do {
      anwser1 =
          _random.nextInt(_quizAnswer + preQuiz.endNum!) + preQuiz.startNum!;
    } while (anwser1 == _quizAnswer && anwser1 == anwser3);
    do {
      anwser2 =
          _random.nextInt(_quizAnswer + preQuiz.endNum!) + preQuiz.startNum!;
    } while (
        anwser2 == _quizAnswer && anwser2 == anwser3 && anwser2 == anwser1);
    listAnswer = [];
    listAnswer.add(anwser1);
    listAnswer.add(anwser2);
    listAnswer.add(anwser3);
    listAnswer.add(_quizAnswer);
    listAnswer.shuffle();
    _quiz = '$firstNumber ${preQuiz.sign} $secondNumber';
  }

  get quizAnswer => _quizAnswer;
  get quiz => _quiz;
  get listAWS => listAnswer;
}
