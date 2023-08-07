import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../../application/utils/format.dart';
import '../../../data/local/repo/pre_test/pre_test_repo.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final PreTestLocalRepo preTestLocalRepo;
  final PreQuizGameRepo preQuizLocalRepo;
  HistoryCubit(
      {required this.preTestLocalRepo,
      required this.preQuizLocalRepo})
      : super(HistoryState.initial());
  void datePraChanged(DateTime value) {
    emit(state.copyWith(timePraNow: formatDateInput.format(value)));
  }

  void dateTestChanged(DateTime value) {
    emit(state.copyWith(timeTestNow: formatDateInput.format(value)));
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
