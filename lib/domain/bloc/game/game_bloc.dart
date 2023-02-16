import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_pra_repo.dart';

class GameRepository {
  final QuizPraLocalRepo quizPraLocalRepo;
  GameRepository({required this.quizPraLocalRepo});
  void addDataToLocal(QuizPraEntityCompanion entityCompanion){
    quizPraLocalRepo.insertQuizPra(entityCompanion);
  }
}
