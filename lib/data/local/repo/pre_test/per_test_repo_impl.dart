import 'package:drift/drift.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';
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
  Future<void> updatePreTest(PreTestEntityData entity) async {
    (appDb.update(appDb.preTestEntity)
          ..where((tbl) => tbl.id.equals(entity.id)))
        .write(entity);
  }
}
