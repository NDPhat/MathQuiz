import 'package:drift/drift.dart';
import 'package:math/data/local/driff/db/db_app.dart';

import 'local_notify_repo.dart';

class LocalNotifyRepoImpl extends LocalNotifyRepo {
  LocalNotifyRepoImpl(super.appDb);

  @override
  Future<void> delete(int id) async {
    // TODO: implement delete
    await (appDb.delete(appDb.localNotifyEntity)..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<LocalNotifyEntityCompanion> getNotifyTask(int id) {
    // TODO: implement getNotifyTask
    throw UnimplementedError();
  }

  @override
  Future<void> insert(LocalNotifyEntityCompanion entityCompanion) async {
    // TODO: implement insert
    await appDb.into(appDb.localNotifyEntity).insert(entityCompanion);
  }

  @override
  Future<void> completeNotifyTask(int id) async {
    // TODO: implement update
    (appDb.update(appDb.localNotifyEntity)..where((tbl) => tbl.id.equals(id)))
        .write(const LocalNotifyEntityCompanion(isCompleted: Value(1)));
  }

  @override
  Stream<List<LocalNotifyEntityData>> getAllTask() async* {
    // TODO: implement getAllTask
    yield* (appDb.select(appDb.localNotifyEntity)).watch();
  }

  @override
  Stream<List<LocalNotifyEntityData>> getAllTaskByDay(String dayNeeded) async* {
    yield* (appDb.select(appDb.localNotifyEntity)
          ..where((tbl) => tbl.daySave.equals(dayNeeded)))
        .watch();
  }

  @override
  Future<LocalNotifyEntityData> getLatestTask() async {
    List<LocalNotifyEntityData> list = await (appDb
            .select(appDb.localNotifyEntity)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
    return list.first;
  }
}
