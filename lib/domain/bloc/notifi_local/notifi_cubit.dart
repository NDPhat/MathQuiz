import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/local/repo/notifi_local/notifi_local_repo.dart';
part 'notifi_state.dart';

class NotifiCubit extends Cubit<NotifiState> {
  final NotifiLocalRepo notifiLocalRepo;
  NotifiCubit({required NotifiLocalRepo notifiLocalRepo})
      : notifiLocalRepo = notifiLocalRepo,
        super(NotifiState.initial());
  void enableChanged(bool enable) {
    emit(state.copyWith(enable: enable));
  }
}
