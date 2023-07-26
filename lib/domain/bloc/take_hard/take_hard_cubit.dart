import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:math/application/enum/take_hard_status.dart';
import 'package:math/data/local/repo/pre_test/pre_test_repo.dart';
import 'package:math/data/local/repo/test/quiz_test_repo.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import '../../../application/utils/format.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../data/remote/model/pre_test_req.dart';
import '../../../main.dart';
part 'take_hard_state.dart';

class TakeHardCubit extends Cubit<TakeHardState> {
  final PreTestLocalRepo preTestLocalRepo;
  final UserAPIRepo userAPIRepo;
  TakeHardCubit(
      {required PreTestLocalRepo preTestLocalRepo,
      required UserAPIRepo userAPIRepo})
      : userAPIRepo = userAPIRepo,
        preTestLocalRepo = preTestLocalRepo,
        super(TakeHardState.initial());

  void addPreTest() async {
    try {
      if (instance.get<UserGlobal>().onLogin == true) {
        PreTestAPIRes? dataServer = await instance
            .get<UserAPIRepo>()
            .createPreQuizTest(PreTestReq(
                sumQ: 0,
                score: 0,
                dateSave: formatTimeTestInput.format(DateTime.now()),
                trueQ: 0,
                falseQ: 0,
                userID: instance.get<UserGlobal>().id!));
        emit(state.copyWith(
            idServer: dataServer!.key, status: TakeHardStatus.success));
      } else {
        final entity = PreTestEntityCompanion(
            score: const Value(0),
            sumQuiz: const Value(0),
            dateSave: Value(
              formatTimeTestInput.format(DateTime.now()),
            ));
        //insert task
        await preTestLocalRepo.insertPreTest(entity);
        PreTestEntityData dataLocal = await preTestLocalRepo.getLatestPreTest();
        emit(state.copyWith(id: dataLocal.id, status: TakeHardStatus.success));
      }
    } on Exception catch (e) {
      emit(state.copyWith(status: TakeHardStatus.error));
    }
  }
}
