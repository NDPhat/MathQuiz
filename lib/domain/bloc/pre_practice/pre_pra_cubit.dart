import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:math/application/utils/format.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/remote/api/Repo/pre_pra_repo.dart';
import '../../../application/enum/pre_status.dart';
import '../../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/model/pre_pra_req.dart';
import '../../../data/remote/model/pre_pra_res.dart';
import '../../../main.dart';
part 'pre_pra_state.dart';

class PrePraCubit extends Cubit<PrePraState> {
  final PrePraLocalRepo preQuizLocalRepo;
  final PrePraRepo prePraRepo;
  PrePraCubit({required this.preQuizLocalRepo, required this.prePraRepo})
      : super(PrePraState.initial());

  void clearOldDataErrorForm() {
    emit(state.copyWith(status: PreQuizStatus.initial));
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

  void deletePrePraServer(String id) async {
    try {
      await prePraRepo.deletePreQuizGame(id);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<PrePraAPIModel?> createPrePraServer(PrePraAPIReq prePraAPIReq) async {
    try {
      await prePraRepo.createPreQuizGame(prePraAPIReq);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> createPrePraLocal(PreQuizGameEntityCompanion data) async {
    try {
      await preQuizLocalRepo.insertPreQuizGame(data);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> updatePrePraServer(String id, PrePraAPIReq data) async {
    try {
      await prePraRepo.updatePreQuizGameByID(data, id);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void addPreQuizGame(String sign, String option) async {
    try {
      if (instance.get<UserGlobal>().onLogin == true) {
        PrePraAPIModel? dataServer =
            await prePraRepo.createPreQuizGame(PrePraAPIReq(
                numQ: 0,
                status: "GOING",
                sign: sign,
                score: 0,
                optionGame: option,
                userId: instance.get<UserGlobal>().id,
                dateSave: formatDateInput.format(
                  DateTime.now(),
                )));
        emit(state.copyWith(
            optionGame: option,
            idServer: dataServer!.key,
            status: PreQuizStatus.success));
      } else {
        final entity = PreQuizGameEntityCompanion(
            numQ: const Value(0),
            sign: Value(sign),
            score: const Value(0),
            option: Value(option),
            dateSave: Value(formatDateInput.format(DateTime.now())));
        //insert task
        await preQuizLocalRepo.insertPreQuizGame(entity);
        PreQuizGameEntityData dataLocal =
            await preQuizLocalRepo.getLatestPreQuizGame();
        emit(state.copyWith(
            optionGame: option,
            id: dataLocal.id,
            status: PreQuizStatus.success));
      }
    } on Exception catch (e) {
      emit(state.copyWith(status: PreQuizStatus.error));
    }
  }
}
