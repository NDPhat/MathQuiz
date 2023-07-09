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
}
