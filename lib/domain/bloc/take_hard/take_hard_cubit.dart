import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:math/application/enum/take_hard_status.dart';
import 'package:math/data/remote/api/Repo/pre_test_repo.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import '../../../application/utils/format.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/local/repo/pre_test/pre_test__local_repo.dart';
import '../../../data/model/user_global.dart';
import '../../../main.dart';
part 'take_hard_state.dart';

class TakeHardCubit extends Cubit<TakeHardState> {
  final PreTestLocalRepo preTestLocalRepo;
  final PreTestRepo preTestRepo;
  TakeHardCubit({required this.preTestLocalRepo, required this.preTestRepo})
      : super(TakeHardState.initial());

  void addPreTest() async {
    try {
      if (instance.get<UserGlobal>().onLogin == true) {
        PreTestAPIModel? dataServer = await preTestRepo.createPreQuizTest(
            PreTestAPIModel(
                numQ: 0,
                score: 0,
                status: "GOING",
                dateSave: formatTimeTestInput.format(DateTime.now()),
                trueQ: 0,
                falseQ: 0,
                userId: instance.get<UserGlobal>().id!));
        emit(state.copyWith(
            idServer: dataServer!.key, status: TakeHardStatus.success));
      } else {
        final entity = PreTestLocalEntityCompanion(
            score: const Value(0),
            sumQ: const Value(0),
            dateSave: Value(
              formatDateInput.format(DateTime.now()),
            ));
        //insert task
        await preTestLocalRepo.insertPreTest(entity);
        PreTestLocalEntityData dataLocal =
            await preTestLocalRepo.getLatestPreTest();
        emit(state.copyWith(id: dataLocal.id, status: TakeHardStatus.success));
      }
    } on Exception catch (e) {
      emit(state.copyWith(status: TakeHardStatus.error));
    }
  }
}
