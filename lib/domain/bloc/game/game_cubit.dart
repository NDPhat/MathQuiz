import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/quiz_pra/quiz_game_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/data/remote/api/Repo/pre_test_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_hw_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_pra_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_test_repo.dart';
import 'package:math/data/remote/api/Repo/result_hw_repo.dart';
import 'package:math/data/remote/model/pre_test_req.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/data/remote/model/quiz_test_req.dart';
import '../../../application/enum/game_status.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/remote/api/Repo/pre_pra_repo.dart';
import '../../../data/remote/model/pre_pra_req.dart';
import '../../../data/remote/model/pre_pra_res.dart';
import '../../../data/remote/model/quiz_hw_req.dart';
import '../../../data/remote/model/quiz_pra_req.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuizGameLocalRepo quizPraLocalRepo;
  final QuizTestLocalRepo quizTestLocalRepo;
  final PrePraRepo prePraRepo;
  final PreTestRepo preTestRepo;
  final QuizPraRepo quizPraRepo;
  final ResultHWRepo resultHWRepo;
  final QuizHWRepo quizHWRepo;
  final QuizTestRepo quizTestRepo;

  GameCubit(
      {required this.quizPraLocalRepo,
      required this.quizTestLocalRepo,
      required this.quizPraRepo,
      required this.preTestRepo,
      required this.resultHWRepo,
      required this.quizHWRepo,
      required this.quizTestRepo,
      required this.prePraRepo})
      : super(GameState.initial());
  void addQuizGameToLocal(QuizGameEntityCompanion entityCompanion) {
    quizPraLocalRepo.insertQuizGame(entityCompanion);
  }

  void addQuizMixToLocal(QuizTestEntityCompanion entityCompanion) {
    quizTestLocalRepo.insertTest(entityCompanion);
  }

  Future<void> updatePrePraServer(String id, PrePraAPIReq data) async {
    try {
      await prePraRepo.updatePreQuizGameByID(data, id);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> updatePreTestServer(String id, PreTestAPIModel data) async {
    try {
      await preTestRepo.updatePreQuizTestByID(data, id);
    } on Exception catch (e) {
      print(e.toString());
    }
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

  Future<PrePraAPIModel?> createPrePraServer(PrePraAPIReq prePraAPIReq) async {
    try {
      await prePraRepo.createPreQuizGame(prePraAPIReq);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void addQuizHWToServer(QuizHWAPIReq data) {
    quizHWRepo.saveQuizDetailHW(data);
  }

  void addQuizTestToServer(QuizTestAPIReq data) {
    quizTestRepo.createQuizTest(data);
  }

  void addQuizToServer(QuizPraAPIReq data) {
    quizPraRepo.createQuizGame(data);
  }

  void deletePreGameNow(String id) async {
    await prePraRepo.deletePreQuizGame(id);
  }

  void deletePreTestNow(String id) async {
    await preTestRepo.deleteTestingNotDoByPreTestId(id);
  }
}
