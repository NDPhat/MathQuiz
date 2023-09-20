import '../../driff/db/db_app.dart';

abstract class QuizTestLocalRepo{
  //Define DB
  final AppDb appDb;
  //Constructor
  QuizTestLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertTest(QuizTestLocalEntityCompanion entity);
  Future<void> deleteTest(int testId);
  Future<void> updateTest(QuizTestLocalEntityData entity);
  Stream<List<QuizTestLocalEntityData>> getAllTestByPreTestId(int preTestId);
  Stream<List<QuizTestLocalEntityData>> getAllTest();
}