import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../application/enum/pre_status.dart';
import '../../../data/local/prequizrepo.dart';
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

  void addPreQuiz() {
    if (isFormValid() == true) {
      emit(state.copyWith(
          numQMess: "",
          sNumMess: "",
          eNumMess: "",
          status: PreQuizStatus.success));
    } else {
      emit(state.copyWith(
          numQMess: numQMEss,
          sNumMess: sNumMess,
          eNumMess: eNumMess,
          status: PreQuizStatus.error));
    }
  }
}
