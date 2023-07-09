import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/notifi_local/notifi_local_repo.dart';

class NotifiLocalRepoImpl extends NotifiLocalRepo {
  NotifiLocalRepoImpl(super.appDb);

  @override
  Future<void> deleteNotifiLocal(int id) {
    // TODO: implement deleteNotifiLocal
    throw UnimplementedError();
  }

  @override
  Future<NotifiLocalEntityData> getNotifiLocal(int id) {
    // TODO: implement getNotifiLocal
    throw UnimplementedError();
  }

  @override
  Future<void> insertStatusEnableNotifiLocal(
      NotifiLocalEntityCompanion entityCompanion) {
    // TODO: implement insertStatusEnableNotifiLocae
    throw UnimplementedError();
  }

  @override
  Future<void> updateStatusEnableNotifiLocal(bool enable, int id) {
    // TODO: implement updateStatusEnableNotifiLocal
    throw UnimplementedError();
  }
}
