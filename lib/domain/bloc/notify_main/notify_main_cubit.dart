import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/local/notifi/notifi_helper.dart';

import '../../../application/utils/format.dart';
import '../../../data/local/repo/detail_notifi/local_notify_repo.dart';

part 'notify_main_state.dart';

class NotifyMainCubit extends Cubit<NotifyMainState> {
  final LocalNotifyRepo notifyTaskLocalRepo;
  NotifyMainCubit({required this.notifyTaskLocalRepo})
      : super(NotifyMainState.initial());
  Future<void> dayChange(DateTime value) async {
    emit(state.copyWith(
      timeNow: formatDateInput.format(value),
    ));
  }

  void delete(int id) async {
    notifyTaskLocalRepo.delete(id);
    NotifyHelper().doneNotify(id);
  }

  void completeNotifyTask(int id) async {
    notifyTaskLocalRepo.completeNotifyTask(id);
    NotifyHelper().doneNotify(id);
  }

  void deleteByDay(String dateSave) async {}

  void deleteAll() async {}
}
