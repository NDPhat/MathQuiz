import '../../driff/db/db_app.dart';

abstract class LocalNotifyRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  LocalNotifyRepo(this.appDb);
  Future<void> insert(LocalNotifyEntityCompanion entityCompanion);
  Future<void> completeNotifyTask(int id);
  Future<LocalNotifyEntityCompanion> getNotifyTask(int id);
  Stream<List<LocalNotifyEntityData>> getAllTaskByDay(String dayNeeded);
  Stream<List<LocalNotifyEntityData>> getAllTask();
  Future<LocalNotifyEntityData> getLatestTask();
  Future<void> delete(int id);
}
