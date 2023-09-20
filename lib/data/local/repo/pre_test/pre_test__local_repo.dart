import '../../driff/db/db_app.dart';

abstract class PreTestLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  PreTestLocalRepo(this.appDb);
  Future<void> insertPreTest(PreTestLocalEntityCompanion entity);
  Future<void> deletePreTest(int testId);
  Future<void> deletePreTestByDay(String dateSave);
  Future<void> deleteAllPreTestAfter7DaysFromNow();
  Future<void> deleteAllPreTest();
  Future<void> updatePreTest(int score, int sumQ, int id);
  Stream<List<PreTestLocalEntityData>> getAllPreTestByDay(String dayNeeded);
  Future<int> getLengthAllPreTestByDay(String day);
  Stream<List<PreTestLocalEntityData>> getAllPreTestByDayWithPagination(
      String day, int page);
  Future<int> getLengthAllPreTest();
  Future<double> getAverageScore();
  Stream<List<PreTestLocalEntityData>> getAllPreTest();
  Future<PreTestLocalEntityData> getLatestPreTest();

}
