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
  Future<void> updatePreQuizGame(int id, int score);
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGameByDay(String day);
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGame();
}
