import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:math/data/local/driff/db/db_app.dart';
import 'package:math/data/local/repo/detail_notifi/detail_notifi_repo.dart';

import '../../../application/enum/add_notifi_status.dart';
import '../../../application/utils/format.dart';

part 'add_notifi_state.dart';

class AddNotifiCubit extends Cubit<AddNotifiState> {
  String titleMess = "";
  String noteMess = "";
  final DetailNotifiLocalRepo detailNotifiLocalRepo;
  AddNotifiCubit({required DetailNotifiLocalRepo detailNotifiLocalRepo})
      : detailNotifiLocalRepo = detailNotifiLocalRepo,
        super(AddNotifiState.initial());
  void colorChange(String color) {
    emit(state.copyWith(color: color, status: AddNotifiStatus.initial));
  }

  void dateTimeChange(String date) {
    state.dateSaveTask = date;
  }

  void emitDateTimeChange(String date) {
    emit(state.copyWith(dateSave: date));
  }

  void emitStartTimeChange(String time) {
    emit(state.copyWith(timeStart: time));
  }

  void emitEndTimeChange(String time) {
    emit(state.copyWith(timeEnd: time));
  }

  void remindChange(int value) {
    emit(state.copyWith(indexRemind: value));
  }

  void titleChanged(String value) {
    state.title = value;
    if (state.titleMess.isNotEmpty) {
      emit(state.copyWith(titleMess: ""));
    }
  }

  void noteChanged(String value) {
    state.note = value;
    if (state.noteMess.isNotEmpty) {
      emit(state.copyWith(noteMess: ""));
    }
  }

  void remindSelected(String value) {
    emit(state.copyWith(remind: value));
  }

  void clearOldDataErrorForm() {
    emit(state.copyWith(status: AddNotifiStatus.initial));
  }

  void clearForm() {
    emit(state.copyWith(
      indexRemind: 0,
      remind: '5 minutes early',
      color: 'blue',
      note: '',
      title: '',
      noteMess: '',
      titleMess: '',
      dateSave: formatDateInput.format(DateTime.now()),
      timeStart: DateFormat('hh:mm aa').format(DateTime.now()),
      timeEnd: DateFormat('hh:mm aa').format(DateTime.now()),
      status: AddNotifiStatus.initial,
    ));
  }

  bool titleValidator(String title) {
    if (title.isEmpty) {
      titleMess = 'This field is empty';
      return false;
    } else {
      titleMess = "";
      return true;
    }
  }

  bool noteValidator(String note) {
    if (note.isEmpty) {
      noteMess = 'This field is empty';
      return false;
    } else {
      noteMess = "";
      return true;
    }
  }

  bool isFormValid() {
    if (noteValidator(state.note) & titleValidator(state.title)) {
      return true;
    }
    return false;
  }

  Future<void> saveTaskToLocal() async {
    if (isFormValid()) {
      try {
        final entity = DetailNotifiEntityCompanion(
          title: Value(state.title),
          note: Value(state.note),
          dateSave: Value(state.dateSaveTask.toString()),
          startTime: Value(state.timeStart),
          endTime: Value(state.timeEnd),
          remind: Value(state.remind),
          isCompleted: const Value(0),
          color: Value(state.color),
        );
        //insert task
        await detailNotifiLocalRepo.insertDetailNotifiLocal(entity);
        emit(state.copyWith(status: AddNotifiStatus.success));
      } on Exception catch (e) {
        print(e.toString());
        emit(state.copyWith(
            titleMess: titleMess,
            noteMess: noteMess,
            status: AddNotifiStatus.error));
      }
    } else {
      emit(state.copyWith(
          titleMess: titleMess,
          noteMess: noteMess,
          status: AddNotifiStatus.error));
    }
  }
}
