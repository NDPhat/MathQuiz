import 'package:drift/drift.dart';
import 'package:math/application/extension/to_get_test_model.dart';
import 'package:math/data/local/driff/db/db_app.dart';

import '../application/utils/format.dart';
import '../data/local/repo/pre_test/pre_test_repo.dart';
import '../data/model/pre_test_model.dart';
import '../data/remote/api/Repo/api_user_repo.dart';

class HomeRepo {
  final UserAPIRepo userLocalAPIRepo;

  final PreTestLocalRepo preTestLocalRepo;
  HomeRepo({required this.preTestLocalRepo, required this.userLocalAPIRepo});

  void insertPreTest() {
    preTestLocalRepo.insertPreTest(PreTestEntityCompanion(
        dateSave: Value(formatDateInput.format(DateTime.now()))));
  }

  void updateScoreAndSumQ(int score, int sumQ, int id) async {
    try {
      await preTestLocalRepo.updatePreTest(score, sumQ, id);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<PreTest> getLatestPreTest() async {
    PreTestEntityData data = await preTestLocalRepo.getLatestPreTest();
    return data.toGetTestModel();
  }
}
