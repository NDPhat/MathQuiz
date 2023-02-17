import 'package:math/data/model/make_quiz.dart';

import '../../data/local/driff/db/db_app.dart';

extension PreQuizModel on PreQuizEntityData {
  PreQuiz toGetModel() {
    return PreQuiz(
        id: id,
        sign: sign,
        numQ: numQ,
        score: score,
        startNum: sNum,
        endNum: eNum,
        timePer: timePer,
        dateSave: dateSave);
  }
}
