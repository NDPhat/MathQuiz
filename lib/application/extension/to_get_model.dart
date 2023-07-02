import 'package:math/data/model/make_quiz.dart';

import '../../data/local/driff/db/db_app.dart';

extension PreQuizModel on PreQuizGameEntityData {
  PreQuizGame toGetModel() {
    return PreQuizGame(
        id: id,
        sign: sign,
        numQ: numQ,
        score: score,
        startNum: sNum,
        endNum: eNum,
        dateSave: dateSave);
  }
}
