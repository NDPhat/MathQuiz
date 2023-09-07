import '../../model/quiz_hw_req.dart';
import '../../model/quiz_hw_res.dart';

abstract class QuizHWRepo {
  Future<bool?> saveQuizDetailHW(QuizHWAPIReq model);
  Future<List<QuizHWAPIModel>?> getALlQuizDetailByResultID(String resultID);
  Future<List<QuizHWAPIModel>?> getALlQuizDetailByUserIDAndWeek(
      String userID, String week);
}
