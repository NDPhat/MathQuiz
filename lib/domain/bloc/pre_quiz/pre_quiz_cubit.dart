import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/local/driff/db/db_app.dart';

import '../../../application/enum/pre_status.dart';
import '../../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
part 'pre_quiz_state.dart';

class PreQuizCubit extends Cubit<PreQuizState> {
  final PreQuizLocalRepo preQuizLocalRepo;
  String numQMEss = "";
  String sNumMess = "";
  String eNumMess = "";
  PreQuizCubit({required PreQuizLocalRepo preQuizLocalRepo})
      : preQuizLocalRepo = preQuizLocalRepo,
        super(PreQuizState.initial());
  void numQChanged(int value) {
    state.numQ = value;
    if (state.numQMess.isNotEmpty) {
      emit(state.copyWith(numQMess: ""));
    }
  }

  void sNumChanged(int value) {
    state.sNum = value;
    if (state.sNumMess.isNotEmpty) {
      emit(state.copyWith(sNumMess: ""));
    }
  }

  void eNumChanged(int value) {
    state.eNum = value;
    if (state.eNumMess.isNotEmpty) {
      emit(state.copyWith(eNumMess: ""));
    }
  }

  void timeChanged(int value) {
    emit(state.copyWith(time: value));
  }

  bool nuMQValidator(int numQ) {
    if (numQ.toString().isEmpty) {
      numQMEss = 'This field is empty';
      return false;
    } else {
      numQMEss = "";
      return true;
    }
  }

  bool sNumValidator(int sNum) {
    if (sNum.toString().isEmpty) {
      sNumMess = 'This field is empty';
      return false;
    } else {
      sNumMess = "";
      return true;
    }
  }

  bool eNumValidator(int eNum) {
    if (eNum.toString().isEmpty) {
      eNumMess = 'This field is empty';
      return false;
    } else {
      eNumMess = "";
      return true;
    }
  }

  void clearOldDataErrorForm() {
    emit(state.copyWith(status: PreQuizStatus.initial));
  }

  bool isFormValid() {
    if (nuMQValidator(state.numQ) &
        sNumValidator(state.sNum) &
        eNumValidator(state.eNum)) {
      return true;
    }
    return false;
  }

  void updateScore(int score, int id) async {
    try {
      await preQuizLocalRepo.updatePreQuiz(id, score);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void addPreQuiz(String sign) async {
    if (isFormValid() == true) {
      try {
        final entity = PreQuizEntityCompanion(
            sNum: Value(state.sNum),
            eNum: Value(state.eNum),
            numQ: Value(state.numQ),
            sign: Value(sign),
            timePer: Value(state.time),
            dateSave: Value(DateTime.now().toString()));
        //insert task
        await preQuizLocalRepo.insertPreQuiz(entity);
        final data = await preQuizLocalRepo.getLatestPreQuiz();
        emit(state.copyWith(
            numQMess: "",
            id: data.id,
            sNumMess: "",
            eNumMess: "",
            status: PreQuizStatus.success));
      } on Exception catch (e) {
        print(e.toString());
        emit(state.copyWith(
            numQMess: numQMEss,
            sNumMess: sNumMess,
            eNumMess: eNumMess,
            status: PreQuizStatus.error));
      }
    } else {
      emit(state.copyWith(
          numQMess: numQMEss,
          sNumMess: sNumMess,
          eNumMess: eNumMess,
          status: PreQuizStatus.error));
    }
  }
}
