import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';

import '../../../application/utils/format.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final PreQuizLocalRepo preQuizLocalRepo;
  HistoryCubit({required PreQuizLocalRepo preQuizLocalRepo})
      : preQuizLocalRepo = preQuizLocalRepo,
        super(HistoryState.initial());
  void dateChanged(DateTime value) {
    emit(state.copyWith(timeNow: formatDateInput.format(value)));
  }

  void deletePreQuiz(int id) async{
    try {
      await preQuizLocalRepo.deletePreQuiz(id);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
