import '../../model/pre_test_res.dart';
import '../../model/pre_test_res_pagi.dart';

abstract class PreTestRepo {
  Future<PreTestAPIModel?> createPreQuizTest(PreTestAPIModel preQuizReq);
  Future<bool?> updatePreQuizTestByID(PreTestAPIModel preQuizReq, String preID);
  Future<List<PreTestAPIModel>?> getALlPreQuizTestByUid(String uid);
  Future<PreTestAPIResPagi?> getALlPreQuizTestByUidWithPagi(
      String uid, int page);
  Future<bool?> deleteTestingNotDoByPreTestId(String preID);
}
