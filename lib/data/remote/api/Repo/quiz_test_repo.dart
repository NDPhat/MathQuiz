import '../../model/quiz_test_req.dart';
import '../../model/quiz_test_res.dart';

abstract class QuizTestRepo {
  Future<bool?> createQuizTest(QuizTestAPIReq quizReq);
  Future<List<QuizTestAPIModel>?> getALlQuizTestByPreTestID(String preID);
  Future<List<QuizTestAPIModel>?> getALlQuizTestByPreTestIDWithPagi(
      String preID, int page);
}
