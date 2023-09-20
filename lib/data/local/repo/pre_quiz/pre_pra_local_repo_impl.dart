import 'package:drift/drift.dart';
import 'package:math/application/extension/precsision_double.dart';
import 'package:math/data/local/repo/pre_quiz/pre_pra_local_repo.dart';

import '../../../../application/utils/format.dart';
import '../../driff/db/db_app.dart';

class PrePraLocalRepoImpl extends PrePraLocalRepo {
  PrePraLocalRepoImpl(super.appDb);

  @override
  Future<void> deletePreQuizGame(int id) async {
    await (appDb.delete(appDb.prePraLocalEntity)..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Stream<List<PrePraLocalEntityData>> getAllPreQuizGame() async* {
    yield* (appDb.select(appDb.prePraLocalEntity)).watch();
  }

  @override
  Stream<List<PrePraLocalEntityData>> getAllPreQuizGameByDay(
      String day) async* {
    yield* (appDb.select(appDb.prePraLocalEntity)
          ..where((tbl) => tbl.dateSave.equals(day)))
        .watch();
  }

  @override
  Future<void> insertPreQuizGame(PrePraLocalEntityCompanion entity) async {
    await appDb.into(appDb.prePraLocalEntity).insert(entity);
  }

  @override
  Future<void> updatePreQuizGame(int id, int score, int numQ) async {
    (appDb.update(appDb.prePraLocalEntity)..where((tbl) => tbl.id.equals(id)))
        .write(
            PrePraLocalEntityCompanion(score: Value(score), sumQ: Value(numQ)));
  }

  @override
  Future<PrePraLocalEntityData> getLatestPreQuizGame() async {
    List<PrePraLocalEntityData> list = await (appDb
            .select(appDb.prePraLocalEntity)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
    return list.first;
  }

  @override
  Future<PrePraLocalEntityData> getPreQuizGameByPreId(int preId) async {
    return (appDb.select(appDb.prePraLocalEntity)
          ..where((tbl) => tbl.id.equals(preId)))
        .getSingle();
  }

  @override
  Future<void> deleteAllPreQuiz() async {
    await (appDb.delete(appDb.prePraLocalEntity)).go();
  }

  @override
  Future<void> deletePreQuizGameByDay(String dateSave) async {
    await (appDb.delete(appDb.prePraLocalEntity)
          ..where((t) => t.dateSave.equals(dateSave)))
        .go();
  }

  @override
  Stream<List<PrePraLocalEntityData>> getAllPreQuizGameByDayWithPagination(
      String day, int page) async* {
    List<PrePraLocalEntityData> dataConvert =
        await (appDb.select(appDb.prePraLocalEntity)
              ..where((tbl) => tbl.dateSave.equals(day)))
            .get();
    int length = dataConvert.length;
    List<PrePraLocalEntityData> newData = [];
    int start = (page - 1) * 5;
    int end = start + 5;
    if (end <= length) {
      for (int i = start; i < end; i++) {
        PrePraLocalEntityData model = dataConvert[i];
        if (model != null) {
          newData.add(model);
        } else {
          yield* Stream.fromFuture(Future.value(newData));
        }
      }
    } else {
      for (int i = start; i < length; i++) {
        PrePraLocalEntityData model = dataConvert[i];
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
  Future<int> getLengthAllPreQuizGameByDay(String day) async {
    List<PrePraLocalEntityData> data =
        await (appDb.select(appDb.prePraLocalEntity)
              ..where((tbl) => tbl.dateSave.equals(day)))
            .get();
    return data.length;
  }

  @override
  Future<double> getAverageScore() async {
    int score = 0;
    int quiz = 0;
    List<PrePraLocalEntityData> data =
        await (appDb.select(appDb.prePraLocalEntity)).get();
    data.forEach((element) {
      score = score + element.score!;
      quiz = element.sumQ + quiz;
    });
    double value = (score / quiz).toPrecision(1) * 10; // 2.3
    return value;
  }

  @override
  Future<int> getLengthAllPreQuizGame() async {
    List<PrePraLocalEntityData> data =
        await (appDb.select(appDb.prePraLocalEntity)).get();
    return data.length;
  }

  @override
  Future<void> deleteAllPreQuizGameAfter7DaysFromNow() async {
    final now = DateTime.now();
    String expirationDate =
        formatDateInput.format(now.subtract(const Duration(days: 6)));
    await (appDb.delete(appDb.prePraLocalEntity)
          ..where((t) => t.dateSave.isSmallerThanValue(expirationDate)))
        .go();
  }
}
