import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/model/user_global.dart';
import 'package:math/data/remote/api/Repo/pre_test_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_pra_repo.dart';
import 'package:math/data/remote/api/Repo/quiz_test_repo.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/data/remote/model/quiz_test_req.dart';
import 'package:math/main.dart';
import '../../../application/enum/game_status.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/local/repo/pre_quiz/pre_pra_local_repo.dart';
import '../../../data/local/repo/pre_test/pre_test__local_repo.dart';
import '../../../data/local/repo/quiz_pra/quiz_pra_local_repo.dart';
import '../../../data/local/repo/test/quiz_test_local_repo.dart';
import '../../../data/remote/api/Repo/pre_pra_repo.dart';
import '../../../data/remote/model/pre_pra_req.dart';
import '../../../data/remote/model/pre_pra_res.dart';
import '../../../data/remote/model/quiz_pra_req.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuizPraLocalRepo quizPraLocalRepo;
  final PrePraLocalRepo prePraLocalRepo;
  final PreTestLocalRepo preTestLocalRepo;
  final QuizTestLocalRepo quizTestLocalRepo;
  final PrePraRepo prePraRepo;
  final PreTestRepo preTestRepo;
  final QuizPraRepo quizPraRepo;
  final QuizTestRepo quizTestRepo;

  GameCubit(
      {required this.quizPraLocalRepo,
      required this.quizTestLocalRepo,
      required this.quizPraRepo,
      required this.prePraLocalRepo,
      required this.preTestLocalRepo,
      required this.preTestRepo,
      required this.quizTestRepo,
      required this.prePraRepo})
      : super(GameState.initial());
  void addQuizGameToLocal(QuizPraLocalEntityCompanion entityCompanion) {
    quizPraLocalRepo.insertQuizGame(entityCompanion);
  }

  void addQuizMixToLocal(QuizTestLocalEntityCompanion entityCompanion) {
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

  void updateScoreQuizGameLocal(int score, int id, int numQ) async {
    try {
      await prePraLocalRepo.updatePreQuizGame(id, score, numQ);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> createPrePraLocal(PrePraLocalEntityCompanion data) async {
    try {
      await prePraLocalRepo.insertPreQuizGame(data);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<PrePraLocalEntityData?> getLatestPreQuizGame() async {
    try {
      PrePraLocalEntityData data = await prePraLocalRepo.getLatestPreQuizGame();
      return data;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
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

  Future<void> createPrePraServer(PrePraAPIReq prePraAPIReq) async {
    try {
      await prePraRepo.createPreQuizGame(prePraAPIReq);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<PrePraAPIModel?> getPrePraServerOnDoing() async {
    PrePraAPIModel? data = await prePraRepo
        .getPreQuizGameByUidOnGoing(instance.get<UserGlobal>().id!);
    if (data != null) {
      return data;
    } else {
      return null;
    }
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

  void deletePreGameNowError() async {
    await prePraRepo
        .deletePreQuizGameErrorServer(instance.get<UserGlobal>().id!);
  }

  void deletePreGameLocalNow(int id) async {
    await prePraLocalRepo.deletePreQuizGame(id);
  }

  void deletePreTestNow(String id) async {
    await preTestRepo.deleteTestingNotDoByPreTestId(id);
  }
}
