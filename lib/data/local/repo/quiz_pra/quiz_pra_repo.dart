import '../../driff/db/db_app.dart';

abstract class QuizPraLocalRepo{
  //Define DB
  final AppDb appDb;
  //Constructor
  QuizPraLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertQuizPra(QuizPraEntityCompanion entity);
  Future<void> deleteQuizPra(int taskId);
  Future<void> updateQuizPra(QuizPraEntityData entity);
  Stream<List<QuizPraEntityData>> getAllQuizPraByPreQuizId(int preId);
  Stream<List<QuizPraEntityData>> getAllQuizPra();
}