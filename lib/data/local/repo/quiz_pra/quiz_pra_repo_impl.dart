import 'package:math/data/local/repo/quiz_pra/quiz_pra_repo.dart';

import '../../driff/db/db_app.dart';

class QuizPraLocalRepoImpl extends QuizPraLocalRepo {
  QuizPraLocalRepoImpl(super.appDb);

  @override
  Future<void> deleteQuizPra(int taskId) async {
    await (appDb.delete(appDb.quizPraEntity)..where((t) => t.id.equals(taskId)))
        .go();
  }

  @override
  Stream<List<QuizPraEntityData>> getAllQuizPra() async* {
    yield* (appDb.select(appDb.quizPraEntity)).watch();
  }

  @override
  Stream<List<QuizPraEntityData>> getAllQuizPraByPreQuizId(int preId) async* {
    yield* (appDb.select(appDb.quizPraEntity)
          ..where((tbl) => tbl.preId.equals(preId)))
        .watch();
  }

  @override
  Future<void> insertQuizPra(QuizPraEntityCompanion entity) async {
    await appDb.into(appDb.quizPraEntity).insert(entity);
  }

  @override
  Future<void> updateQuizPra(QuizPraEntityData entity) async {
    (appDb.update(appDb.quizPraEntity)
          ..where((tbl) => tbl.id.equals(entity.id)))
        .write(entity);
  }
}
