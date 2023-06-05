import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/application/utils/make_quiz.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import 'package:math/data/remote/model/pre_quiz_game_req.dart';
import 'package:math/data/remote/model/quiz_game_req.dart';
import 'package:math/data/remote/model/quiz_test_req.dart';

import '../../../application/enum/game_status.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/model/detail_quiz_hw_req.dart';
import '../../../data/remote/model/detail_quiz_hw_response.dart';
import '../../../data/remote/model/pre_quiz_game_response.dart';
import '../../../data/remote/model/quiz_game_response.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuizGameLocalRepo quizPraLocalRepo;
  final UserAPIRepo userAPIRepo;

  GameCubit(
      {required QuizGameLocalRepo quizPraLocalRepo,
      required UserAPIRepo userAPIRepo})
      : quizPraLocalRepo = quizPraLocalRepo,
        userAPIRepo = userAPIRepo,
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

  void addQuizHWToServer(DetailQuizHWAPIReq data) {
    userAPIRepo.saveQuizDetailHW(data);
  }

  void addQuizTesttoServer(QuizTestReq data) {
    userAPIRepo.createQuizTest(data);
  }

  void addQuizToServer(QuizGameAPIReq data) {
    userAPIRepo.createQuizGame(data);
  }

  void updateScorePreQuizGameByID(String id, PreQuizGameAPIReq data) {
    userAPIRepo.updatePreQuizGameByID(data, id);
  }
}
