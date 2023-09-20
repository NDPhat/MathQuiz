import '../../driff/db/db_app.dart';

abstract class QuizPraLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  QuizPraLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertQuizGame(QuizPraLocalEntityCompanion entity);
  Future<void> deleteQuizGame(int taskId);
  Future<void> updateQuizGame(QuizPraLocalEntityData entity);
  Stream<List<QuizPraLocalEntityData>> getAllQuizGameByPreQuizId(int preId);
  Stream<List<QuizPraLocalEntityData>> getAllQuizGame();
}
