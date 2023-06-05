
import '../../data/local/driff/db/db_app.dart';
import '../../data/model/pre_test_model.dart';

extension PreTestModel on PreTestEntityData {
  PreTest toGetTestModel() {
    return PreTest(id: id, sumQuiz: sumQuiz, score: score, dateSave: dateSave);
  }
}
