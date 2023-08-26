import 'package:drift/drift.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';

import '../../driff/db/db_app.dart';

class PreQuizLocalRepoImpl extends PreQuizGameRepo {
  PreQuizLocalRepoImpl(super.appDb);

  @override
  Future<void> deletePreQuizGame(int id) async {
    await (appDb.delete(appDb.preQuizGameEntity)..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGame() async* {
    yield* (appDb.select(appDb.preQuizGameEntity)).watch();
  }

  @override
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGameByDay(
      String day) async* {
    yield* (appDb.select(appDb.preQuizGameEntity)
          ..where((tbl) => tbl.dateSave.equals(day)))
        .watch();
  }

  @override
  Future<void> insertPreQuizGame(PreQuizGameEntityCompanion entity) async {
    await appDb.into(appDb.preQuizGameEntity).insert(entity);
  }

  @override
  Future<void> updatePreQuizGame(int id, int score, int numQ) async {
    (appDb.update(appDb.preQuizGameEntity)..where((tbl) => tbl.id.equals(id)))
        .write(
            PreQuizGameEntityCompanion(score: Value(score), numQ: Value(numQ)));
  }

  @override
  Future<PreQuizGameEntityData> getLatestPreQuizGame() async {
    List<PreQuizGameEntityData> list = await (appDb
            .select(appDb.preQuizGameEntity)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
    return list.first;
  }

  @override
  Future<PreQuizGameEntityData> getPreQuizGameByPreId(int preId) async {
    return (appDb.select(appDb.preQuizGameEntity)
          ..where((tbl) => tbl.id.equals(preId)))
        .getSingle();
  }

  @override
  Future<void> deleteAllPreQuiz() async {
    await (appDb.delete(appDb.preQuizGameEntity)).go();
  }

  @override
  Future<void> deletePreQuizGameByDay(String dateSave) async {
    await (appDb.delete(appDb.preQuizGameEntity)
          ..where((t) => t.dateSave.equals(dateSave)))
        .go();
  }

  @override
  Stream<List<PreQuizGameEntityData>> getAllPreQuizGameByDayWithPagination(
      String day, int page) async* {
    List<PreQuizGameEntityData> dataConvert =
        await (appDb.select(appDb.preQuizGameEntity)
              ..where((tbl) => tbl.dateSave.equals(day)))
            .get();
    int length = dataConvert.length;
    List<PreQuizGameEntityData> newData = [];
    int start = (page - 1) * 5;
    int end = start + 5;
    if (end <= length) {
      for (int i = start; i < end; i++) {
        PreQuizGameEntityData model = dataConvert[i];
        if (model != null) {
          newData.add(model);
        } else {
          yield* Stream.fromFuture(Future.value(newData));
        }
      }
    } else {
      for (int i = start; i < length; i++) {
        PreQuizGameEntityData model = dataConvert[i];
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
    List<PreQuizGameEntityData> data =
        await (appDb.select(appDb.preQuizGameEntity)
              ..where((tbl) => tbl.dateSave.equals(day)))
            .get();
    return data.length;
  }
}
