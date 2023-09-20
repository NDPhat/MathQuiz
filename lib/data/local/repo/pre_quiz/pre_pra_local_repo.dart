import '../../driff/db/db_app.dart';

abstract class PrePraLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  PrePraLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertPreQuizGame(PrePraLocalEntityCompanion entity);
  Future<PrePraLocalEntityData> getLatestPreQuizGame();
  Future<PrePraLocalEntityData> getPreQuizGameByPreId(int preId);
  Future<void> deletePreQuizGame(int id);
  Future<void> deletePreQuizGameByDay(String dateSave);
  Future<void> deleteAllPreQuizGameAfter7DaysFromNow();
  Future<void> deleteAllPreQuiz();
  Future<void> updatePreQuizGame(int id, int score, int numQ);
  Stream<List<PrePraLocalEntityData>> getAllPreQuizGameByDay(String day);
  Future<int> getLengthAllPreQuizGameByDay(String day);
  Future<int> getLengthAllPreQuizGame();
  Future<double> getAverageScore();
  Stream<List<PrePraLocalEntityData>> getAllPreQuizGameByDayWithPagination(
      String day, int page);
  Stream<List<PrePraLocalEntityData>> getAllPreQuizGame();
}
