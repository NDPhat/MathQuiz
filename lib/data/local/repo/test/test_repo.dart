import '../../driff/db/db_app.dart';

abstract class TestLocalRepo{
  //Define DB
  final AppDb appDb;
  //Constructor
  TestLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertTest(QuizTestEntityCompanion entity);
  Future<void> deleteTest(int testId);
  Future<void> updateTest(QuizTestEntityData entity);
  Stream<List<QuizTestEntityData>> getAllTestByPreTestId(int preTestId);
  Stream<List<QuizTestEntityData>> getAllTest();
}