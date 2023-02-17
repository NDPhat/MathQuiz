import 'package:math/data/model/make_quiz.dart';

import '../../data/local/driff/db/db_app.dart';
import '../../data/model/test_model.dart';

extension PreTestModel on PreTestEntityData {
  PreTest toGetTestModel() {
    return PreTest(id: id, sumQuiz: sumQuiz, score: score, dateSave: dateSave);
  }
}
