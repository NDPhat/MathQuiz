import '../../driff/db/db_app.dart';

abstract class PreQuizGameRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  PreQuizGameRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertPreQuizGame(PreQuizGameEntityCompanion entity);
  Future<PreQuizGameEntityData> getLatestPreQuizGame();
  Future<PreQuizGameEntityData> getPreQuizGameByPreId(int preId);
  Future<void> deletePreQuizGame(int id);
  Future<void> deletePreQuizGameByDay(String dateSave);
  Future<void> deleteAllPreQuiz();
  Future<void> updatePreQuizGame(int id, int score, int numQ);
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGameByDay(String day);
  Future<int> getLengthAllPreQuizGameByDay(String day);
  Future<int> getLengthAllPreQuizGame();
  Future<double> getAverageScore();
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGameByDayWithPagination(
      String day, int page);
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGame();
}
