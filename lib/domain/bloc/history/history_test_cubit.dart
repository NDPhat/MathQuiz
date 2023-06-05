import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';

import '../../../application/utils/format.dart';
import '../../../data/local/repo/pre_test/pre_test_repo.dart';

part 'history_test_state.dart';

class HistoryTestCubit extends Cubit<HistoryTestState> {
  final PreTestLocalRepo preTestLocalRepo;
  HistoryTestCubit({required PreTestLocalRepo preTestLocalRepo})
      : preTestLocalRepo = preTestLocalRepo,
        super(HistoryTestState.initial());
  void dateChanged(DateTime value) {
    emit(state.copyWith(timeNow: formatDateInput.format(value)));
  }

  void deletePreTest(int id) async {
    try {
      await preTestLocalRepo.deletePreTest(id);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void deletePreTestByDay(String dateSave) async {
    try {
      await preTestLocalRepo.deletePreTestByDay(dateSave);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void deleteAllPreTest() async {
    try {
      await preTestLocalRepo.deleteAllPreTest();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
