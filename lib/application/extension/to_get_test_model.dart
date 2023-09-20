
import '../../data/local/driff/db/db_app.dart';
import '../../data/model/pre_test_model.dart';

extension PreTestModel on PreTestLocalEntityData {
  PreTest toGetTestModel() {
    return PreTest(id: id, sumQ: sumQ, score: score, dateSave: dateSave);
  }
}
