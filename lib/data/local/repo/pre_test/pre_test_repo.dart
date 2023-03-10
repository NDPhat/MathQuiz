import '../../driff/db/db_app.dart';

abstract class PreTestLocalRepo{
  //Define DB
  final AppDb appDb;
  //Constructor
  PreTestLocalRepo(this.appDb);
  //WEIGHT INTERFACE
  Future<void> insertPreTest(PreTestEntityCompanion entity);
  Future<void> deletePreTest(int testId);
  Future<void> updatePreTest(int score,int sumQ ,int id);
  Stream<List<PreTestEntityData>> getAllPreTestByDay(String dayNeeded);
  Stream<List<PreTestEntityData>> getAllPreTest();
  Future<PreTestEntityData> getLatestPreTest();

}