import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/main.dart';

import '../../../application/enum/setting_status.dart';
import '../../../data/model/app_global.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final AppGlobal appGlobal;
  SettingCubit({
    required this.appGlobal,
  }) : super(SettingState.initial());
  void volumeChanged(double values) {
    emit(state.copyWith(volume: values));
    appGlobal.volumeApp = values;
  }
}
