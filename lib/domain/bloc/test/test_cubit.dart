import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/local/repo/test/test_repo.dart';

import '../../../application/enum/game_status.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/local/repo/quiz_pra/quiz_pra_repo.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  final TestLocalRepo testLocalRepo;
  TestCubit({required TestLocalRepo testLocalRepo})
      : testLocalRepo = testLocalRepo,
        super(TestState.initial());
  void addDataToLocal(QuizTestEntityCompanion entityCompanion) {
    testLocalRepo.insertTest(entityCompanion);
  }

  void changeDataAfterDoneQ(int trueQ, int falseQ, int score, int quizNow) {
    emit(state.copyWith(
        trueQ: trueQ, falseQ: falseQ, qNow: quizNow, score: score));
  }

  void changeDataPlayAgain() {
    emit(state.copyWith(trueQ: 0, falseQ: 0, qNow: 1, score: 0));
  }
}
