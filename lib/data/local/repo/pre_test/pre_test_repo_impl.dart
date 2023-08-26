import 'package:drift/drift.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';

import '../../driff/db/db_app.dart';

class PreTestLocalRepoImpl extends PreTestLocalRepo {
  PreTestLocalRepoImpl(super.appDb);

  @override
  Future<void> deletePreTest(int testId) async {
    await (appDb.delete(appDb.preTestEntity)..where((t) => t.id.equals(testId)))
        .go();
  }

  @override
  Stream<List<PreTestEntityData>> getAllPreTest() async* {
    yield* (appDb.select(appDb.preTestEntity)).watch();
  }

  @override
  Stream<List<PreTestEntityData>> getAllPreTestByDay(String dayNeeded) async* {
    yield* (appDb.select(appDb.preTestEntity)
          ..where((tbl) => tbl.dateSave.equals(dayNeeded)))
        .watch();
  }

  @override
  Future<void> insertPreTest(PreTestEntityCompanion entity) async {
    await appDb.into(appDb.preTestEntity).insert(entity);
  }

  @override
  Future<void> updatePreTest(int score, int sumQ, int id) async {
    (appDb.update(appDb.preTestEntity)..where((tbl) => tbl.id.equals(id)))
        .write((PreTestEntityCompanion(
            score: Value(score), sumQuiz: Value(sumQ))));
  }

  @override
  Future<PreTestEntityData> getLatestPreTest() async {
    List<PreTestEntityData> list = await (appDb.select(appDb.preTestEntity)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
    return list.first;
  }

  @override
  Future<void> deleteAllPreTest() async {
    await (appDb.delete(appDb.preTestEntity)).go();
  }

  @override
  Future<void> deletePreTestByDay(String dateSave) async {
    await (appDb.delete(appDb.preTestEntity)
          ..where((t) => t.dateSave.equals(dateSave)))
        .go();
  }

  @override
  Stream<List<PreTestEntityData>> getAllPreTestByDayWithPagination(
      String day, int page) async* {
    List<PreTestEntityData> dataConvert =
        await (appDb.select(appDb.preTestEntity)
              ..where((tbl) => tbl.dateSave.equals(day)))
            .get();
    int length = dataConvert.length;
    List<PreTestEntityData> newData = [];
    int start = (page - 1) * 5;
    int end = start + 5;
    if (end <= length) {
      for (int i = start; i < end; i++) {
        PreTestEntityData model = dataConvert[i];
        if (model != null) {
          newData.add(model);
        } else {
          yield* Stream.fromFuture(Future.value(newData));
        }
      }
    } else {
      for (int i = start; i < length; i++) {
        PreTestEntityData model = dataConvert[i];
        if (model != null) {
          newData.add(model);
        } else {
          yield* Stream.fromFuture(Future.value(newData));
        }
      }
    }
    yield* Stream.fromFuture(Future.value(newData));
  }

  @override
  Future<int> getLengthAllPreTestByDay(String day) async {
    List<PreTestEntityData> data = await (appDb.select(appDb.preTestEntity)
          ..where((tbl) => tbl.dateSave.equals(day)))
        .get();
    return data.length;
  }
}
