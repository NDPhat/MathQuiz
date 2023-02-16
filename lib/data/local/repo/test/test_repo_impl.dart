import 'package:math/data/local/repo/test/test_repo.dart';

import '../../driff/db/db_app.dart';

class TestLocalRepoImpl extends TestLocalRepo {
  TestLocalRepoImpl(super.appDb);

  @override
  Future<void> deleteTest(int testId) async {
    await (appDb.delete(appDb.quizTestEntity)
          ..where((t) => t.id.equals(testId)))
        .go();
  }

  @override
  Stream<List<QuizTestEntityData>> getAllTest() async* {
    yield* (appDb.select(appDb.quizTestEntity)).watch();
  }

  @override
  Stream<List<QuizTestEntityData>> getAllTestByPreTestId(int preTestId) async* {
    yield* (appDb.select(appDb.quizTestEntity)
          ..where((tbl) => tbl.preId.equals(preTestId)))
        .watch();
  }

  @override
  Future<void> insertTest(QuizTestEntityCompanion entity) async {
    await appDb.into(appDb.quizTestEntity).insert(entity);
  }

  @override
  Future<void> updateTest(QuizTestEntityData entity) async {
    (appDb.update(appDb.quizTestEntity)
          ..where((tbl) => tbl.id.equals(entity.id)))
        .write(entity);
  }
}
