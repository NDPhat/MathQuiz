import 'package:math/data/model/make_quiz.dart';

import '../../data/local/driff/db/db_app.dart';

extension PreQuizModel on PrePraLocalEntityData {
  PreQuizGame toGetModel() {
    return PreQuizGame(
        id: id,
        sign: sign,
        sumQ: sumQ,
        score: score,
        dateSave: dateSave);
  }
}
