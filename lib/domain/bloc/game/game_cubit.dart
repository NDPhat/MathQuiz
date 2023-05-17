import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';

import '../../../application/enum/game_status.dart';
import '../../../data/local/driff/db/db_app.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuizGameLocalRepo quizPraLocalRepo;
  GameCubit({required QuizGameLocalRepo quizPraLocalRepo})
      : quizPraLocalRepo = quizPraLocalRepo,
        super(GameState.initial());
  void addQuizToLocal(QuizGameEntityCompanion entityCompanion) {
    quizPraLocalRepo.insertQuizGame(entityCompanion);
  }

  void changeDataAfterDoneQ(int trueQ, int falseQ, int score, int quizNow) {
    emit(state.copyWith(
        trueQ: trueQ, falseQ: falseQ, qNow: quizNow, score: score, timeNow: 5));
  }

  void emitTimeNow(int time, int falseQ, int quizNow) {
    if (time == 1) {
      emit(state.copyWith(timeNow: 5, falseQ: falseQ++, qNow: quizNow++));
    }
  }

  void changeDataPlayAgain() {
    emit(state.copyWith(trueQ: 0, falseQ: 0, qNow: 1, score: 0));
  }
}
