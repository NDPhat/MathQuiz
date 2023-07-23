import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/data/remote/model/pre_quiz_game_sen_req.dart';
import 'package:math/data/remote/model/quiz_game_req.dart';
import 'package:math/data/remote/model/quiz_test_req.dart';
import '../../../application/enum/game_status.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/model/detail_quiz_hw_req.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuizGameLocalRepo quizPraLocalRepo;
  final QuizTestLocalRepo quizTestLocalRepo;
  final UserAPIRepo userAPIRepo;

  GameCubit(
      {required QuizGameLocalRepo quizPraLocalRepo,
      required QuizTestLocalRepo quizTestLocalRepo,
      required UserAPIRepo userAPIRepo})
      : quizPraLocalRepo = quizPraLocalRepo,
        userAPIRepo = userAPIRepo,
        quizTestLocalRepo = quizTestLocalRepo,
        super(GameState.initial());
  void addQuizGameToLocal(QuizGameEntityCompanion entityCompanion) {
    quizPraLocalRepo.insertQuizGame(entityCompanion);
  }

  void addQuizMixToLocal(QuizTestEntityCompanion entityCompanion) {
    quizTestLocalRepo.insertTest(entityCompanion);
  }

  void changeDataAfterDoneQ(int trueQ, int falseQ, int score, int quizNow) {
    emit(state.copyWith(
        trueQ: trueQ, falseQ: falseQ, qNow: quizNow, score: score, timeNow: 5));
  }

  void changeDataSenAfterDoneQ(int score, int quizNow, int trueQ, int falseQ) {
    emit(state.copyWith(
        score: score, qNow: quizNow, trueQ: trueQ, falseQ: falseQ));
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

  void addQuizTestToServer(QuizTestReq data) {
    userAPIRepo.createQuizTest(data);
  }

  void addQuizToServer(QuizGameAPIReq data) {
    userAPIRepo.createQuizGame(data);
  }

  void deletePreGameNow(String id) async {
    await userAPIRepo.deletePreQuizGame(id);
  }

  void deletePreGameSenNow(String id) async {
    await userAPIRepo.deletePreQuizSenGame(id);
  }

  void updatePreGameSenNowById(String id, PreQuizGameSenReq req) async {
    await userAPIRepo.updatePreQuizSenGameByID(req, id);
  }
}
