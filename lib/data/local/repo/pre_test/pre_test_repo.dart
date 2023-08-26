import '../../driff/db/db_app.dart';

abstract class PreTestLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  PreTestLocalRepo(this.appDb);
  Future<void> insertPreTest(PreTestEntityCompanion entity);
  Future<void> deletePreTest(int testId);
  Future<void> deletePreTestByDay(String dateSave);
  Future<void> deleteAllPreTest();
  Future<void> updatePreTest(int score, int sumQ, int id);
  Stream<List<PreTestEntityData>> getAllPreTestByDay(String dayNeeded);
  Future<int> getLengthAllPreTestByDay(String day);
  Stream<List<PreTestEntityData>> getAllPreTestByDayWithPagination(
      String day, int page);
  Stream<List<PreTestEntityData>> getAllPreTest();
  Future<PreTestEntityData> getLatestPreTest();

}
