import '../../driff/db/db_app.dart';

abstract class PreQuizLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  PreQuizLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertPreQuiz(PreQuizEntityCompanion entity);
  Future<PreQuizEntityData> getLatestPreQuiz();
  Future<void> deletePreQuiz(int id);
  Future<void> updatePreQuiz(int id, int score);
  Stream<List<PreQuizEntityData>> getAllPreQuizByDay(String day);
  Stream<List<PreQuizEntityData>> getAllPreQuiz();
}
