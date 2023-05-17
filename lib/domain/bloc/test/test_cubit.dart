import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';

import '../../../application/enum/game_status.dart';
import '../../../data/local/driff/db/db_app.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  final QuizTestLocalRepo testLocalRepo;
  TestCubit({required QuizTestLocalRepo testLocalRepo})
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
