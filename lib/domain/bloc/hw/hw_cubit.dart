import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/api/Repo/quiz_hw_repo.dart';
import 'package:math/data/remote/api/Repo/result_hw_repo.dart';
import 'package:math/data/remote/model/result_hw_req.dart';
import '../../../application/enum/game_status.dart';
import '../../../data/remote/model/quiz_hw_req.dart';
part 'hw_state.dart';

class HWCubit extends Cubit<HWState> {
  final ResultHWRepo resultHWRepo;
  final QuizHWRepo quizHWRepo;

  HWCubit({
    required this.resultHWRepo,
    required this.quizHWRepo,
  }) : super(HWState.initial());

  void changeDataAfterDoneQ(int trueQ, int falseQ, int score, int quizNow) {
    emit(state.copyWith(
        trueQ: trueQ, falseQ: falseQ, qNow: quizNow, score: score));
  }

  void addQuizHWToServer(QuizHWAPIReq data) {
    quizHWRepo.saveQuizDetailHW(data);
  }

  Future<void> updateResultHW(ResultHWAPIReq req, String id) async {
    await resultHWRepo.updateInfoHomeWorkWeek(req, id);
  }

  Future<void> deleteResultHW(String id) async {
    await resultHWRepo.deleteResultHWNotDo(id);
  }
}
