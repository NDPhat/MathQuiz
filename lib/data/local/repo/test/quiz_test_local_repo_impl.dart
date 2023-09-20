import 'package:math/data/local/repo/test/quiz_test_local_repo.dart';

import '../../driff/db/db_app.dart';

class QuizTestLocalRepoImpl extends QuizTestLocalRepo {
  QuizTestLocalRepoImpl(super.appDb);

  @override
  Future<void> deleteTest(int testId) async {
    await (appDb.delete(appDb.quizTestLocalEntity)
          ..where((t) => t.id.equals(testId)))
        .go();
  }

  @override
  Stream<List<QuizTestLocalEntityData>> getAllTest() async* {
    yield* (appDb.select(appDb.quizTestLocalEntity)).watch();
  }

  @override
  Stream<List<QuizTestLocalEntityData>> getAllTestByPreTestId(
      int preTestId) async* {
    yield* (appDb.select(appDb.quizTestLocalEntity)
          ..where((tbl) => tbl.preTestId.equals(preTestId)))
        .watch();
  }

  @override
  Future<void> insertTest(QuizTestLocalEntityCompanion entity) async {
    await appDb.into(appDb.quizTestLocalEntity).insert(entity);
  }

  @override
  Future<void> updateTest(QuizTestLocalEntityData entity) async {
    (appDb.update(appDb.quizTestLocalEntity)
          ..where((tbl) => tbl.id.equals(entity.id)))
        .write(entity);
  }
}
