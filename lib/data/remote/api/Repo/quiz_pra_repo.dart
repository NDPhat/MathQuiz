
import '../../model/quiz_pra_req.dart';
import '../../model/quiz_pra_res.dart';

abstract class QuizPraRepo {
  Future<bool?> createQuizGame(QuizPraAPIReq quizReq);
  Future<List<QuizPraAPIModel>?> getALlQuizGameByPreGameID(String preID);
  Future<List<QuizPraAPIModel>?> getALlQuizGameByPreGameIDWithPagination(
      String preID, int page);


}
