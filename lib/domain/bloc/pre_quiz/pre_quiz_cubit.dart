import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
  String sNumMess = "";
  String eNumMess = "";
  PreQuizCubit(
      {required PreQuizGameRepo preQuizLocalRepo,
      required UserAPIRepo userAPIRepo})
      : preQuizLocalRepo = preQuizLocalRepo,
        userAPIRepo = userAPIRepo,
        super(PreQuizState.initial());

  void seNumChanged(RangeValues values) {
    emit(state.copyWith(sNum: values.start.round(), eNum: values.end.round()));
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
    if (sNumValidator(state.sNum!) & eNumValidator(state.eNum!)) {
      return true;
    }
    return false;
  }

  void updateScoreQuizGame(int score, int id, int numQ) async {
    try {
      await preQuizLocalRepo.updatePreQuizGame(id, score, numQ);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void deletePreQuizGame(int id) async {
    try {
      await preQuizLocalRepo.deletePreQuizGame(id);
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
              numQ: 0,
              status: "GOING",
              sign: sign,
              score: 0,
              optionGame: option,
              userID: instance.get<UserGlobal>().id,
              dateSave: formatDateInput.format(
                DateTime.now(),
              )));
        }
        final entity = PreQuizGameEntityCompanion(
            sNum: Value(state.sNum!),
            eNum: Value(state.eNum!),
            numQ: const Value(0),
            sign: Value(sign),
            option: Value(option),
            dateSave: Value(formatDateInput.format(DateTime.now())));
        //insert task
        await preQuizLocalRepo.insertPreQuizGame(entity);
        final data = await preQuizLocalRepo.getLatestPreQuizGame();
        emit(state.copyWith(
            id: data.id,
            idServer:
                instance.get<UserGlobal>().onLogin! ? dataServer!.key : "0",
            sNumMess: "",
            eNumMess: "",
            status: PreQuizStatus.success));
      } on Exception catch (e) {
        emit(state.copyWith(
            sNumMess: sNumMess,
            eNumMess: eNumMess,
            status: PreQuizStatus.error));
      }
    } else {
      emit(state.copyWith(
          sNumMess: sNumMess, eNumMess: eNumMess, status: PreQuizStatus.error));
    }
  }
}
