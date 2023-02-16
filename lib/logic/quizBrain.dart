import 'dart:math';

import 'package:math/data/model/make_quiz.dart';

class QuizBrain {
  int _quizAnswer = 0;
  var listAnswer = [0, 0, 0, 0];
  var _quiz = '';
  Random _random = Random();
  void makeQuiz(PreQuiz preQuiz) {
    int firstNumber = _random.nextInt(preQuiz.endNum!) + preQuiz.startNum!;
    int secondNumber = _random.nextInt(preQuiz.endNum!) + preQuiz.startNum!;

    switch (preQuiz.sign) {
      case '+':
        _quizAnswer = firstNumber + secondNumber;
        break;
      case '-':
        secondNumber = _random.nextInt(firstNumber) + preQuiz.startNum!;
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
          _quizAnswer = (firstNumber ~/ secondNumber);
        }
    }
    int anwser1 = preQuiz.startNum!;
    int anwser2 = preQuiz.startNum!;
    int anwser3 = preQuiz.startNum!;
    do {
      anwser1 =
          _random.nextInt(_quizAnswer + preQuiz.endNum!) + preQuiz.startNum!;
    } while (anwser1 == _quizAnswer);
    do {
      anwser2 =
          _random.nextInt(_quizAnswer + preQuiz.endNum!) + preQuiz.startNum!;
    } while (anwser2 == _quizAnswer || anwser2 == anwser1);

    do {
      anwser3 =
          _random.nextInt(_quizAnswer + preQuiz.endNum!) + preQuiz.startNum!;
    } while (
        anwser3 == _quizAnswer || anwser3 == anwser1 || anwser3 == anwser2);
    listAnswer = [];
    listAnswer.add(anwser1);
    listAnswer.add(anwser2);
    listAnswer.add(anwser3);
    listAnswer.add(_quizAnswer);
    listAnswer.shuffle();
    _quiz = '$firstNumber ${preQuiz.sign} $secondNumber';
  }

  void makeQuizTest() {
    List<String> _listOfSigns = ['+', '-', 'x', '/'];
    Random _random = Random();
    var selectedSign = _listOfSigns[_random.nextInt(_listOfSigns.length)];
    var firstNumber = _random.nextInt(20) + 1; // from 10 upto 19
    var secondNumber = _random.nextInt(9) + 1; // from 1 upto 9  (9 included)
    switch (selectedSign) {
      case '+':
        _quizAnswer = firstNumber + secondNumber;
        break;
      case '-':
        secondNumber = _random.nextInt(firstNumber) + 1;
        _quizAnswer = firstNumber - secondNumber;
        break;
      case 'x':
        _quizAnswer = firstNumber * secondNumber;
        break;
      case '/':
        {
          var listNumber2 = [];
          if (firstNumber % secondNumber != 0) {
            for (int i = 1; i <= secondNumber; i++) {
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
          _quizAnswer = (firstNumber ~/ secondNumber);
        }
    }
    int anwser1 = 1;
    int anwser2 = 1;
    int anwser3 = 1;
    do {
      anwser1 = _random.nextInt(_quizAnswer + 20) + 1;
    } while (anwser1 == _quizAnswer);
    do {
      anwser2 = _random.nextInt(_quizAnswer + 20) + 1;
    } while (anwser2 == _quizAnswer || anwser2 == anwser1);

    do {
      anwser3 = _random.nextInt(_quizAnswer + 20) + 1;
    } while (
        anwser3 == _quizAnswer || anwser3 == anwser1 || anwser3 == anwser2);
    listAnswer = [];
    listAnswer.add(anwser1);
    listAnswer.add(anwser2);
    listAnswer.add(anwser3);
    listAnswer.add(_quizAnswer);
    listAnswer.shuffle();
    _quiz = '$firstNumber ${selectedSign} $secondNumber';
  }

  get quizAnswer => _quizAnswer;
  get quiz => _quiz;
  get listAWS => listAnswer;
}
