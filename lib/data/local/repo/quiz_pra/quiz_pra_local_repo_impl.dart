import 'package:math/data/local/repo/quiz_pra/quiz_pra_local_repo.dart';

import '../../driff/db/db_app.dart';

class QuizPraLocalRepoImpl extends QuizPraLocalRepo {
  QuizPraLocalRepoImpl(super.appDb);

  @override
  Future<void> deleteQuizGame(int taskId) async {
    await (appDb.delete(appDb.quizPraLocalEntity)
          ..where((t) => t.id.equals(taskId)))
        .go();
  }

  @override
  Stream<List<QuizPraLocalEntityData>> getAllQuizGame() async* {
    yield* (appDb.select(appDb.quizPraLocalEntity)).watch();
  }

  @override
  Stream<List<QuizPraLocalEntityData>> getAllQuizGameByPreQuizId(
      int preId) async* {
    yield* (appDb.select(appDb.quizPraLocalEntity)
          ..where((tbl) => tbl.prePraId.equals(preId)))
        .watch();
  }

  @override
  Future<void> insertQuizGame(QuizPraLocalEntityCompanion entity) async {
    await appDb.into(appDb.quizPraLocalEntity).insert(entity);
  }

  @override
  Future<void> updateQuizGame(QuizPraLocalEntityData entity) async {
    (appDb.update(appDb.quizPraLocalEntity)
          ..where((tbl) => tbl.id.equals(entity.id)))
        .write(entity);
  }
}
