import '../../driff/db/db_app.dart';

abstract class PreQuizLocalRepo{
  //Define DB
  final AppDb appDb;
  //Constructor
  PreQuizLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertPreQuiz(PreQuizEntityCompanion entity);
  Future<void> deletePreQuiz(int taskId);
  Future<void> updatePreQuiz(PreQuizEntityData entity);
  Stream<List<PreQuizEntityData>> getAllPreQuizByDay(String dayNeeded);
  Stream<List<PreQuizEntityData>> getAllPreQuiz();
}