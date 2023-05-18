import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';

import '../../../application/utils/format.dart';

part 'history_pra_state.dart';

class HistoryPraCubit extends Cubit<HistoryPraState> {
  final PreQuizGameRepo preQuizLocalRepo;
  HistoryPraCubit({required PreQuizGameRepo preQuizLocalRepo})
      : preQuizLocalRepo = preQuizLocalRepo,
        super(HistoryPraState.initial());
  void dateChanged(DateTime value) {
    emit(state.copyWith(timeNow: formatDateInput.format(value)));
  }

  void deletePreQuiz(int id) async {
    try {
      await preQuizLocalRepo.deletePreQuizGame(id);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void deletePreQuizByDay(String dateSave) async {
    try {
      await preQuizLocalRepo.deletePreQuizGameByDay(dateSave);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void deleteAllPreQuiz() async {
    try {
      await preQuizLocalRepo.deleteAllPreQuiz();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
