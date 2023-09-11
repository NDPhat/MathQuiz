
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import '../../driff/db/db_app.dart';
class QuizGameLocalRepoImpl extends QuizGameLocalRepo {
  QuizGameLocalRepoImpl(super.appDb);

  @override
  Future<void> deleteQuizGame(int taskId) async {
    await (appDb.delete(appDb.quizGameEntity)..where((t) => t.id.equals(taskId)))
        .go();
  }

  @override
  Stream<List<QuizGameEntityData>> getAllQuizGame() async* {
    yield* (appDb.select(appDb.quizGameEntity)).watch();
  }

  @override
  Stream<List<QuizGameEntityData>> getAllQuizGameByPreQuizId(int preId) async* {
    yield* (appDb.select(appDb.quizGameEntity)
          ..where((tbl) => tbl.preId.equals(preId)))
        .watch();
  }

  @override
  Future<void> insertQuizGame(QuizGameEntityCompanion entity) async {
    await appDb.into(appDb.quizGameEntity).insert(entity);
  }

  @override
  Future<void> updateQuizGame(QuizGameEntityData entity) async {
    (appDb.update(appDb.quizGameEntity)
          ..where((tbl) => tbl.id.equals(entity.id)))
        .write(entity);
  }

}
