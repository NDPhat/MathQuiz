import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../application/enum/game_status.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/local/repo/quiz_pra/quiz_pra_repo.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuizPraLocalRepo quizPraLocalRepo;
  GameCubit({required QuizPraLocalRepo quizPraLocalRepo})
      : quizPraLocalRepo = quizPraLocalRepo,
        super(GameState.initial());
  void addDataToLocal(QuizPraEntityCompanion entityCompanion) {
    quizPraLocalRepo.insertQuizPra(entityCompanion);
  }

  void changeDataAfterDoneQ(int trueQ, int falseQ, int score, int quizNow) {
    emit(state.copyWith(
        trueQ: trueQ, falseQ: falseQ, qNow: quizNow, score: score));
  }

  void changeDataPlayAgain() {
    emit(state.copyWith(
        trueQ: 0, falseQ: 0, qNow: 1, score: 0));
  }
}
