import '../../driff/db/db_app.dart';

abstract class NotifiLocalRepo {
  //Define DB
  final AppDb appDb;
  //Constructor
  NotifiLocalRepo(this.appDb);
  Future<void> insertStatusEnableNotifiLocal(
      NotifiLocalEntityCompanion entityCompanion);
  Future<void> updateStatusEnableNotifiLocal(bool enable, int id);
  Future<NotifiLocalEntityData> getNotifiLocal(int id);
  Future<void> deleteNotifiLocal(int id);
}
