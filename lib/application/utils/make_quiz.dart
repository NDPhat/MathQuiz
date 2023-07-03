import 'dart:math';

import 'package:math/data/model/make_quiz.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/main.dart';

import '../../data/model/pre_join_homework.dart';
import '../../data/remote/model/pre_quiz_hw_response.dart';
import '../../data/remote/model/sentences_quiz_res.dart';

class QuizBrain {
  int _quizAnswer = 0;
  int hiddenNum = 0;
  int hiddenPositionNumber = 0;
  String quizTrueFalse = "TRUE";
  var listAnswer = [0, 0, 0, 0];
  List<int> listPos = [];
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
    _quiz = '$firstNumber ${preQuiz.sign} $secondNumber =';
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

    hiddenPositionNumber = _random.nextInt(2);
    listAnswer.add(fake1);
    listAnswer.add(fake3);
    listAnswer.add(fake2);
    if (hiddenPositionNumber == 0) {
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
    var _quizWrong = _quizAnswer;
    // so lam de sai
    var randomlyChosen = falseMaker[_random.nextInt(falseMaker.length)];

    // 0 means make it false , 1 means true answer
    var trueOrFalseDecision = _random.nextInt(2);

    quizTrueFalse = 'TRUE';
    if (trueOrFalseDecision == 0) {
      quizTrueFalse = 'FALSE';
      _quizWrong = _quizAnswer + randomlyChosen;
      if (_quizWrong < 0) _quizWrong = _quizAnswer + _random.nextInt(2) + 4;
    }

    _quiz = '$firstNumber ${preQuiz.sign!} $secondNumber = $_quizWrong';
  }

  void makeQuizHomeWork(PreJoinQuizHW preQuiz) {
    int firstNumber = _random.nextInt(preQuiz.eNum!) + preQuiz.sNum!;
    int secondNumber = _random.nextInt(preQuiz.eNum!) + preQuiz.sNum!;
    String signChoose = preQuiz.sign![_random.nextInt(preQuiz.sign!.length)];
    switch (signChoose) {
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
    _quiz = '$firstNumber $signChoose $secondNumber =';
  }

  Future<List<SentencesQuizRes>?> getDataForFirstQuizSentences() async {
    List<SentencesQuizRes>? listData =
        await instance.get<UserAPIRepo>().getRandomeListQuiz();
    return listData;
  }

  void makeFirstQuizSentences(List<SentencesQuizRes>? listData) {
    int pos = _random.nextInt(9);
    _quiz = listData![pos].quiz!;
    _quizAnswer = int.parse(listData![pos].answer!);
    int anwser1 = 0;
    int anwser2 = 0;
    int anwser3 = 0;
    do {
      anwser1 = _random.nextInt(_quizAnswer + 20);
    } while (anwser1 == _quizAnswer);
    do {
      anwser2 =_random.nextInt(_quizAnswer + 20);
    } while (anwser2 == _quizAnswer || anwser2 == anwser1);

    do {
      anwser3 = _random.nextInt(_quizAnswer + 20);
    } while (
        anwser3 == _quizAnswer || anwser3 == anwser1 || anwser3 == anwser2);
    listAnswer = [];
    listAnswer.add(anwser1);
    listAnswer.add(anwser2);
    listAnswer.add(anwser3);
    listAnswer.add(_quizAnswer);
    listAnswer.shuffle();
  }

  void makeOtherQuizSentences(
      int posPast, String pastQuiz, List<SentencesQuizRes>? listData) {
    List<String> listQuiz = [];
    List<String> toRemove = [];
    listData!.forEach((element) {
      listQuiz.add(element.quiz!);
    });
    for (String e in listQuiz) {
      if (e == pastQuiz) {
        toRemove.add(e);
      }
    }
    // reomove quiz cu k de trung
    listQuiz.removeWhere((value) => toRemove.contains(value));
    int pos = _random.nextInt(posPast);
    _quiz = listData![pos].quiz!;
    _quizAnswer = int.parse(listData![pos].answer!);
    int anwser1 = 0;
    int anwser2 = 0;
    int anwser3 = 0;
    do {
      anwser1 = _random.nextInt(_quizAnswer + 20);
    } while (anwser1 == _quizAnswer);
    do {
      anwser2 =  _random.nextInt(_quizAnswer + 20);
    } while (anwser2 == _quizAnswer || anwser2 == anwser1);

    do {
      anwser3 = _random.nextInt(_quizAnswer + 20);
    } while (
        anwser3 == _quizAnswer || anwser3 == anwser1 || anwser3 == anwser2);
    listAnswer = [];
    listAnswer.add(anwser1);
    listAnswer.add(anwser2);
    listAnswer.add(anwser3);
    listAnswer.add(_quizAnswer);
    listAnswer.shuffle();
  }

  get quizAnswer => _quizAnswer;
  get getQuizTrueFalse => quizTrueFalse;
  get getQuizMissing => hiddenNum;
  get quiz => _quiz;
  get listAWS => listAnswer;
}
