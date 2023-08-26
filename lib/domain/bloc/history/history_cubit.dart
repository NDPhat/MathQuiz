import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/utils/func.dart';
import 'package:math/data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../../application/utils/format.dart';
import '../../../data/local/repo/pre_test/pre_test_repo.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final PreTestLocalRepo preTestLocalRepo;
  final PreQuizGameRepo preQuizLocalRepo;
  HistoryCubit({required this.preTestLocalRepo, required this.preQuizLocalRepo})
      : super(HistoryState.initial());
  Future<void> datePraChanged(DateTime value) async {
    int lengthNow = state.lengthPra;
    lengthNow = await preQuizLocalRepo
        .getLengthAllPreQuizGameByDay(formatDateInput.format(value));
    if (lengthNow == 0) {
      lengthNow = 1;
    }
    emit(state.copyWith(
        timePraNow: formatDateInput.format(value),
        lengthPra: lengthNow,
        pagePraNow: 1));
  }

  void dateTestChanged(DateTime value) async {
    int lengthNow = state.lengthTest;
    lengthNow = await preTestLocalRepo
        .getLengthAllPreTestByDay(formatDateInput.format(value));
    if (lengthNow == 0) {
      lengthNow = 1;
    }
    emit(state.copyWith(
        timeTestNow: formatDateInput.format(value),
        lengthTest: lengthNow,
        pageTestNow: 1));
  }

  Future<void> getLengthQuizGame(String timeNow) async {
    int lengthNow = state.lengthPra;
    lengthNow = await preQuizLocalRepo.getLengthAllPreQuizGameByDay(timeNow);
    if (lengthNow == 0) {
      lengthNow = 1;
    }
    emit(state.copyWith(lengthPra: lengthNow));
  }

  Future<void> getLengthTest(String timeNow) async {
    int lengthNow = state.lengthTest;
    lengthNow = await preTestLocalRepo.getLengthAllPreTestByDay(timeNow);
    if (lengthNow == 0) {
      lengthNow = 1;
    }
    emit(state.copyWith(lengthTest: lengthNow));
  }

  void pagePraPlus() {
    if (state.pagePraNow < findLength((state.lengthPra))) {
      int pageNow = state.pagePraNow;
      pageNow = pageNow + 1;
      getMoreDataPreQuiz();
      emit(state.copyWith(pagePraNow: pageNow));
    }
  }

  void pagePraMinus() {
    if (state.pagePraNow != 1) {
      int pageNow = state.pagePraNow;
      pageNow = pageNow - 1;
      getMoreDataPreQuiz();
      emit(state.copyWith(pagePraNow: pageNow));
    }
  }

  void pageTestPlus() {
    if (state.pageTestNow < findLength((state.lengthTest))) {
      int pageNow = state.pageTestNow;
      pageNow = pageNow + 1;
      emit(state.copyWith(pageTestNow: pageNow));
    }
  }

  void pageTestMinus() {
    if (state.pageTestNow != 1) {
      int pageNow = state.pageTestNow;
      pageNow = pageNow - 1;
      emit(state.copyWith(pageTestNow: pageNow));
    }
  }

  void deletePreTest(int id) async {
    try {
      emit(state.copyWith(lengthTest: state.lengthTest - 1));
      preTestLocalRepo.deletePreTest(id);
      if (state.lengthTest % 5 == 0 && state.pageTestNow != 1) {
        emit(state.copyWith(pageTestNow: state.pageTestNow - 1));
      } else if (state.lengthTest % 5 == 0 && state.pageTestNow == 1) {
        emit(state.copyWith(pageTestNow: 1));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void deletePreTestByDay(String dateSave) async {
    try {
      await preTestLocalRepo.deletePreTestByDay(dateSave);
      emit(state.copyWith(lengthTest: 1, pageTestNow: 1));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void getMoreDataPreQuiz() {
    preQuizLocalRepo.getAllPreQuizGameByDayWithPagination(
        state.timePraNow, state.pagePraNow);
  }

  void getMoreDataPreTest() {
    preTestLocalRepo.getAllPreTestByDayWithPagination(
        state.timeTestNow, state.pageTestNow);
  }

  void deleteAllPreTest() async {
    try {
      await preTestLocalRepo.deleteAllPreTest();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void deletePreQuiz(int id) {
    try {
      emit(state.copyWith(lengthPra: state.lengthPra - 1));
      preQuizLocalRepo.deletePreQuizGame(id);
      if (state.lengthPra % 5 == 0 && state.pagePraNow != 1) {
        emit(state.copyWith(pagePraNow: state.pagePraNow - 1));
      } else if (state.lengthPra % 5 == 0 && state.pagePraNow == 1) {
        emit(state.copyWith(pagePraNow: 1));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void deletePreQuizByDay(String dateSave) async {
    try {
      await preQuizLocalRepo.deletePreQuizGameByDay(dateSave);
      emit(state.copyWith(lengthTest: 1, pageTestNow: 1));
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
