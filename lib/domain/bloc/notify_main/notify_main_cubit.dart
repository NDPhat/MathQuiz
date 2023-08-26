import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/repo/detail_notifi/notify_task_repo.dart';

import '../../../application/utils/format.dart';

part 'notify_main_state.dart';

class NotifyMainCubit extends Cubit<NotifyMainState> {
  final NotifyTaskLocalRepo notifyTaskLocalRepo;
  NotifyMainCubit({required this.notifyTaskLocalRepo})
      : super(NotifyMainState.initial());
  Future<void> dayChange(DateTime value) async {
    emit(state.copyWith(
      timeNow: formatDateInput.format(value),
    ));
  }

  void delete(int id) async {
    notifyTaskLocalRepo.delete(id);
  }

  void deleteByDay(String dateSave) async {}

  void deleteAll() async {}
}
