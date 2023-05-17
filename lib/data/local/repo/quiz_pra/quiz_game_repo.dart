import '../../driff/db/db_app.dart';

abstract class QuizGameLocalRepo{
  //Define DB
  final AppDb appDb;
  //Constructor
  QuizGameLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertQuizGame(QuizGameEntityCompanion entity);
  Future<void> deleteQuizGame(int taskId);
  Future<void> updateQuizGame(QuizGameEntityData entity);
  Stream<List<QuizGameEntityData>> getAllQuizGameByPreQuizId(int preId);
  Stream<List<QuizGameEntityData>> getAllQuizGame();
}