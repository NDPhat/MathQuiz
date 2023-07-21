import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:math/application/utils/format.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/pre_quiz_game_response.dart';
import '../../../application/enum/pre_status.dart';
import '../../../data/local/repo/pre_quiz/pre_quiz_repo.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/model/pre_quiz_game_req.dart';
import '../../../main.dart';
part 'pre_quiz_state.dart';

class PreQuizCubit extends Cubit<PreQuizState> {
  final PreQuizGameRepo preQuizLocalRepo;
  final UserAPIRepo userAPIRepo;
  PreQuizCubit(
      {required PreQuizGameRepo preQuizLocalRepo,
      required UserAPIRepo userAPIRepo})
      : preQuizLocalRepo = preQuizLocalRepo,
        userAPIRepo = userAPIRepo,
        super(PreQuizState.initial());

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

  void addPuzzle() {
    emit(state.copyWith(status: PreQuizStatus.success));
  }

  void addPreQuizGame(String sign, String option) async {
    try {
      if (instance.get<UserGlobal>().onLogin == true) {
        PreQuizGameAPIModel? dataServer =
            await userAPIRepo.createPreQuizGame(PreQuizGameAPIReq(
                numQ: 0,
                status: "GOING",
                sign: sign,
                score: 0,
                optionGame: option,
                userID: instance.get<UserGlobal>().id,
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
