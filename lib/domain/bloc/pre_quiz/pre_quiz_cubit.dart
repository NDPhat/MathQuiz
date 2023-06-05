import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:math/application/utils/format.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/pre_quiz_game_response.dart';
import 'package:math/data/remote/model/user_api_res.dart';

import '../../../application/enum/pre_status.dart';
import '../../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/model/pre_quiz_game_req.dart';
import '../../../main.dart';
part 'pre_quiz_state.dart';

class PreQuizCubit extends Cubit<PreQuizState> {
  final PreQuizGameRepo preQuizLocalRepo;
  final UserAPIRepo userAPIRepo;
  String numQMEss = "";
  String sNumMess = "";
  String eNumMess = "";
  PreQuizCubit(
      {required PreQuizGameRepo preQuizLocalRepo,
      required UserAPIRepo userAPIRepo})
      : preQuizLocalRepo = preQuizLocalRepo,
        userAPIRepo = userAPIRepo,
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
    if (numQ <= 0) {
      numQMEss = 'This field is not correct';
      return false;
    } else {
      numQMEss = "";
      return true;
    }
  }

  bool sNumValidator(int sNum) {
    if (sNum <= 0) {
      sNumMess = 'This field is not correct';
      return false;
    } else {
      sNumMess = "";
      return true;
    }
  }

  bool eNumValidator(int eNum) {
    if (eNum <= 0) {
      eNumMess = 'This field is not correct';
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
    if (nuMQValidator(state.numQ ?? 0) &
        sNumValidator(state.sNum ?? 0) &
        eNumValidator(state.eNum ?? 0)) {
      return true;
    }
    return false;
  }

  void updateScoreQuizGame(int score, int id) async {
    try {
      await preQuizLocalRepo.updatePreQuizGame(id, score);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void addPreQuizGame(String sign, String option) async {
    if (isFormValid() == true) {
      try {
        PreQuizGameAPIModel? dataServer;
        if (instance.get<UserGlobal>().onLogin == true) {
          dataServer = await userAPIRepo.createPreQuizGame(PreQuizGameAPIReq(
              sNum: state.sNum!,
              eNum: state.eNum!,
              numQ: state.numQ!,
              sign: sign,
              score: 0,
              optionGame: option,
              timePerQuiz: state.time,
              userID: instance.get<UserGlobal>().id,
              dateSave: formatDateInput.format(
                DateTime.now(),
              )));
        }
        final entity = PreQuizGameEntityCompanion(
            sNum: Value(state.sNum!),
            eNum: Value(state.eNum!),
            numQ: Value(state.numQ!),
            sign: Value(sign),
            option: Value(option),
            timePer: Value(state.time),
            dateSave: Value(formatDateInput.format(DateTime.now())));
        //insert task
        await preQuizLocalRepo.insertPreQuizGame(entity);
        final data = await preQuizLocalRepo.getLatestPreQuizGame();
        emit(state.copyWith(
            numQMess: "",
            id: data.id,
            idServer: dataServer!.key,
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
