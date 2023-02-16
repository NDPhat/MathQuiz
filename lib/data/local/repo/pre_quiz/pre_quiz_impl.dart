import 'package:drift/drift.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';

import '../../driff/db/db_app.dart';

class PreQuizLocalRepoImpl extends PreQuizLocalRepo {
  PreQuizLocalRepoImpl(super.appDb);

  @override
  Future<void> deletePreQuiz(int taskId) async {
    await (appDb.delete(appDb.preQuizEntity)..where((t) => t.id.equals(taskId)))
        .go();
  }

  @override
  Stream<List<PreQuizEntityData>> getAllPreQuiz() async* {
    yield* (appDb.select(appDb.preQuizEntity)).watch();
  }

  @override
  Stream<List<PreQuizEntityData>> getAllPreQuizByDay(String dayNeeded) async* {
    yield* (appDb.select(appDb.preQuizEntity)
          ..where((tbl) => tbl.dateSave.equals(dayNeeded)))
        .watch();
  }

  @override
  Future<void> insertPreQuiz(PreQuizEntityCompanion entity) async {
    await appDb.into(appDb.preQuizEntity).insert(entity);
  }

  @override
  Future<void> updatePreQuiz(int id,int score ) async {
    (appDb.update(appDb.preQuizEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .write(PreQuizEntityCompanion(score: Value(score)));
  }

  @override
  Future<PreQuizEntityData> getLatestPreQuiz() async {
    List<PreQuizEntityData> list = await (appDb.select(appDb.preQuizEntity)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();
    return list.first;
  }
}
