import '../../driff/db/db_app.dart';

abstract class PreQuizGameRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  PreQuizGameRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertPreQuizGame(PreQuizGameEntityCompanion entity);
  Future<PreQuizGameEntityData> getLatestPreQuizGame();
  Future<void> deletePreQuizGame(int id);
  Future<void> updatePreQuizGame(int id, int score);
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGameByDay(String day);
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGame();
}
