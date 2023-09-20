import 'package:drift/drift.dart';
import 'package:math/application/extension/precsision_double.dart';
import 'package:math/data/local/repo/pre_test/pre_test__local_repo.dart';
import '../../../../application/utils/format.dart';
import '../../driff/db/db_app.dart';

class PreTestLocalRepoImpl extends PreTestLocalRepo {
  PreTestLocalRepoImpl(super.appDb);

  @override
  Future<void> deletePreTest(int testId) async {
    await (appDb.delete(appDb.preTestLocalEntity)
          ..where((t) => t.id.equals(testId)))
        .go();
  }

  @override
  Stream<List<PreTestLocalEntityData>> getAllPreTest() async* {
    yield* (appDb.select(appDb.preTestLocalEntity)).watch();
  }

  @override
  Stream<List<PreTestLocalEntityData>> getAllPreTestByDay(
      String dayNeeded) async* {
    yield* (appDb.select(appDb.preTestLocalEntity)
          ..where((tbl) => tbl.dateSave.equals(dayNeeded)))
        .watch();
  }

  @override
  Future<void> insertPreTest(PreTestLocalEntityCompanion entity) async {
    await appDb.into(appDb.preTestLocalEntity).insert(entity);
  }

  @override
  Future<void> updatePreTest(int score, int sumQ, int id) async {
    (appDb.update(appDb.preTestLocalEntity)..where((tbl) => tbl.id.equals(id)))
        .write((PreTestLocalEntityCompanion(
            score: Value(score), sumQ: Value(sumQ))));
  }

  @override
  Future<PreTestLocalEntityData> getLatestPreTest() async {
    List<PreTestLocalEntityData> list = await (appDb
            .select(appDb.preTestLocalEntity)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
    return list.first;
  }

  @override
  Future<void> deleteAllPreTest() async {
    await (appDb.delete(appDb.preTestLocalEntity)).go();
  }

  @override
  Future<void> deletePreTestByDay(String dateSave) async {
    await (appDb.delete(appDb.preTestLocalEntity)
          ..where((t) => t.dateSave.equals(dateSave)))
        .go();
  }

  @override
  Stream<List<PreTestLocalEntityData>> getAllPreTestByDayWithPagination(
      String day, int page) async* {
    List<PreTestLocalEntityData> dataConvert =
        await (appDb.select(appDb.preTestLocalEntity)
              ..where((tbl) => tbl.dateSave.equals(day)))
            .get();
    int length = dataConvert.length;
    List<PreTestLocalEntityData> newData = [];
    int start = (page - 1) * 5;
    int end = start + 5;
    if (end <= length) {
      for (int i = start; i < end; i++) {
        PreTestLocalEntityData model = dataConvert[i];
        if (model != null) {
          newData.add(model);
        } else {
          yield* Stream.fromFuture(Future.value(newData));
        }
      }
    } else {
      for (int i = start; i < length; i++) {
        PreTestLocalEntityData model = dataConvert[i];
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
    List<PreTestLocalEntityData> data =
        await (appDb.select(appDb.preTestLocalEntity)
              ..where((tbl) => tbl.dateSave.equals(day)))
            .get();
    return data.length;
  }

  @override
  Future<double> getAverageScore() async {
    int score = 0;
    int quiz = 0;
    List<PreTestLocalEntityData> data =
        await (appDb.select(appDb.preTestLocalEntity)).get();
    data.forEach((element) {
      score = score + element.score!;
      quiz = element.sumQ! + quiz;
    });
    double value = (score / quiz).toPrecision(1); // 2.3

    return value;
  }

  @override
  Future<int> getLengthAllPreTest() async {
    List<PreTestLocalEntityData> data =
        await (appDb.select(appDb.preTestLocalEntity)).get();
    return data.length;
  }

  @override
  Future<void> deleteAllPreTestAfter7DaysFromNow() async {
    final now = DateTime.now();
    String expirationDate =
        formatDateInput.format(now.subtract(const Duration(days: 6)));

    await (appDb.delete(appDb.preTestLocalEntity)
          ..where((t) => t.dateSave.isSmallerThanValue(expirationDate)))
        .go();
  }
}
