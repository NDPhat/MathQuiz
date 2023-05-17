import 'dart:math';

import 'package:math/data/model/make_quiz.dart';

import '../../data/remote/model/pre_quiz_hw_response.dart';

class QuizBrain {
  int _quizAnswer = 0;
  int hiddenNum = 0;
  String quizTrueFalse = "True";
  var listAnswer = [0, 0, 0, 0];
  String _quiz = '';
  Random _random = Random();
  void makeQuiz(PreQuizGame preQuiz) {
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

  void makeQuizFindMissing(PreQuizGame preQuiz) {
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
    int fake1 = preQuiz.startNum!;
    int fake2 = preQuiz.startNum!;
    int fake3 = preQuiz.startNum!;
    do {
      fake1 =
          _random.nextInt(preQuiz.endNum! + _quizAnswer) + preQuiz.startNum!;
    } while (fake1 == _quizAnswer);
    do {
      fake2 =
          _random.nextInt(preQuiz.endNum! + _quizAnswer) + preQuiz.startNum!;
    } while (fake2 == _quizAnswer || fake2 == fake1);

    do {
      fake3 =
          _random.nextInt(preQuiz.endNum! + _quizAnswer) + preQuiz.startNum!;
    } while (fake3 == _quizAnswer || fake3 == fake1 || fake3 == fake2);
    //0 hidden num1,1 hidden num2
    listAnswer = [];

    var trueNumHidden = _random.nextInt(2);
    listAnswer.add(fake1);
    listAnswer.add(fake3);
    listAnswer.add(fake2);
    if (trueNumHidden == 0) {
      listAnswer.add(firstNumber);
      hiddenNum = firstNumber;
      _quiz = '? ${preQuiz.sign} $secondNumber = $_quizAnswer';
    } else {
      listAnswer.add(secondNumber);
      hiddenNum = secondNumber;
      _quiz = '$firstNumber ${preQuiz.sign} ? = $_quizAnswer';
    }
    listAnswer.shuffle();
  }

  void makeQuizTest() {
    List<String> _listOfSigns = ['+', '-', 'x', '/'];
    Random _random = Random();
    var selectedSign = _listOfSigns[_random.nextInt(_listOfSigns.length)];
    var firstNumber = _random.nextInt(20) + 1; // from 10 upto 19
    var secondNumber = _random.nextInt(20) + 1; // from 1 upto 9  (9 included)
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
    _quiz = '$firstNumber ${selectedSign} $secondNumber =';
  }

  // tao test theo 1 sign
  void makeQuizTestForSign() {
    List<String> _listOfSigns = ['+', '-', 'x', '/'];
    Random _random = Random();
    var selectedSign = _listOfSigns[_random.nextInt(_listOfSigns.length)];
    var firstNumber = _random.nextInt(20) + 1; // from 10 upto 19
    var secondNumber = _random.nextInt(20) + 1; // from 1 upto 9  (9 included)
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
    _quiz = '$firstNumber ${selectedSign} $secondNumber =';
  }

  void makeQuizBOT(String level) {
    List<String> _listOfSigns = ['+', '-', 'x', '/'];
    var selectedSign = _listOfSigns[_random.nextInt(_listOfSigns.length)];
    int firstNumber = 1;
    int secondNumber = 10;
    switch (level) {
      case 'easy':
        firstNumber = _random.nextInt(10) + 1; // from 10 upto 19
        secondNumber = _random.nextInt(10) + 1; // from 1 upto 9
        break; // (9 included)switch (level) {
      case 'medium':
        firstNumber = _random.nextInt(15) + 1; // from 10 upto 19
        secondNumber = _random.nextInt(15) + 10;
        break; // from 1 upto 9  (9 included)switch (level) {
      case 'hard':
        firstNumber = _random.nextInt(20) + 1; // from 10 upto 19
        secondNumber = _random.nextInt(20) + 10;
        break; // from 1 upto 9  (9 included)switch (level)
      default:
        firstNumber = _random.nextInt(10) + 1; // from 10 upto 19
        secondNumber = _random.nextInt(10) + 1;
    }

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
      anwser1 = _random.nextInt(_quizAnswer + 10) + 1;
    } while (anwser1 == _quizAnswer);
    do {
      anwser2 = _random.nextInt(_quizAnswer + 10) + 1;
    } while (anwser2 == _quizAnswer || anwser2 == anwser1);

    do {
      anwser3 = _random.nextInt(_quizAnswer + 10) + 1;
    } while (
        anwser3 == _quizAnswer || anwser3 == anwser1 || anwser3 == anwser2);
    listAnswer = [];
    listAnswer.add(anwser1);
    listAnswer.add(anwser2);
    listAnswer.add(anwser3);
    listAnswer.add(_quizAnswer);
    listAnswer.shuffle();
    _quiz = '$firstNumber ${selectedSign} $secondNumber = ?';
  }

  void makeQuizTrueFalse(PreQuizGame preQuiz) {
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
    var falseMaker = [-3, -2, -1, 1, 2, 3];
    var randomlyChosen = falseMaker[_random.nextInt(falseMaker.length)];

    // 0 means make it false , 1 means true answer
    var trueOrFalseDecision = _random.nextInt(2);

    quizTrueFalse = 'TRUE';
    if (trueOrFalseDecision == 0) {
      quizTrueFalse = 'FALSE';
      _quizAnswer = _quizAnswer + randomlyChosen;
      if (_quizAnswer < 0) _quizAnswer = _quizAnswer + _random.nextInt(2) + 4;
    }

    _quiz = '$firstNumber ${preQuiz.sign!} $secondNumber = $_quizAnswer';
  }

  void makeQuizHomeWork(PreQuizHWResponse preQuiz) {
    int firstNumber = _random.nextInt(preQuiz.eNum!) + preQuiz.sNum!;
    int secondNumber = _random.nextInt(preQuiz.eNum!) + preQuiz.sNum!;

    switch (preQuiz.sign) {
      case '+':
        _quizAnswer = firstNumber + secondNumber;
        break;
      case '-':
        secondNumber = _random.nextInt(firstNumber) + preQuiz.sNum!;
        _quizAnswer = firstNumber - secondNumber;
        break;
      case 'x':
        _quizAnswer = firstNumber * secondNumber;
        break;
      case '/':
        {
          var listNumber2 = [];
          if (firstNumber % secondNumber != 0) {
            for (int i = preQuiz.sNum!; i <= secondNumber; i++) {
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
    int anwser1 = preQuiz.sNum!;
    int anwser2 = preQuiz.sNum!;
    int anwser3 = preQuiz.sNum!;
    do {
      anwser1 = _random.nextInt(_quizAnswer + preQuiz.eNum!) + preQuiz.sNum!;
    } while (anwser1 == _quizAnswer);
    do {
      anwser2 = _random.nextInt(_quizAnswer + preQuiz.eNum!) + preQuiz.sNum!;
    } while (anwser2 == _quizAnswer || anwser2 == anwser1);

    do {
      anwser3 = _random.nextInt(_quizAnswer + preQuiz.eNum!) + preQuiz.sNum!;
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

  get quizAnswer => _quizAnswer;
  get getQuizTrueFalse => quizTrueFalse;
  get getQuizMissing => hiddenNum;
  get quiz => _quiz;
  get listAWS => listAnswer;
}
