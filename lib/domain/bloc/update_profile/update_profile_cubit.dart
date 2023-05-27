import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/di/event_local.dart';
import 'package:math/application/enum/update_profile_status.dart';
import 'package:math/data/remote/model/user_model.dart';

import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../main.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserAPIRepo userAPIRepo;
  String nameError = "";
  String phoneErr = "";
  String birthErr = "";
  String addEr = "";
  UpdateProfileCubit({required UserAPIRepo userAPIRepo})
      : userAPIRepo = userAPIRepo,
        super(UpdateProfileState.initial());
  void nameChanged(String value) {
    state.fullName = value;
  }

  bool checkName() {
    if (state.fullName.isEmpty) {
      nameError = " Fill this blank";
      return false;
    } else {
      nameError = "";
      return true;
    }
  }

  bool checkPhone() {
    if (state.phone.isEmpty) {
      phoneErr = " Fill this blank";
      return false;
    } else {
      phoneErr = "";
      return true;
    }
  }

  bool checkAdd() {
    if (state.address.isEmpty) {
      addEr = " Fill this blank";
      return false;
    } else {
      addEr = "";
      return true;
    }
  }

  bool checkBirth() {
    if (state.birthDate.isEmpty) {
      birthErr = " Fill this blank";
      return false;
    } else {
      birthErr = "";
      return true;
    }
  }

  void phoneChanged(String value) {
    state.phone = value;
  }

  void addChanged(String value) {
    state.address = value;
  }

  void sexChanged(String value) {
    emit(state.copyWith(sex: value));
  }

  bool isFormValid() {
    if (checkAdd() & checkBirth() & checkName() & checkPhone()) {
      return true;
    }
    return false;
  }

  void birthChanged(String value) {
    emit(state.copyWith(birthDate: value));
  }

  Future<void> updateProfileUser() async {
    emit(state.copyWith(status: UpdateProfileStatus.onLoading));
    if (isFormValid()) {
      UserModel dataNew = UserModel(
          add: state.address,
          phone: state.phone,
          name: state.fullName,
          birthDate: state.birthDate,
          sex: state.sex);
      bool? updateDone = await userAPIRepo.updateProfileUser(
          instance.get<UserGlobal>().id.toString(), dataNew);
      if (updateDone == true) {
        await userAPIRepo.getUserByID(instance.get<UserGlobal>().id.toString());
        emit(state.copyWith(status: UpdateProfileStatus.success));
      } else {
        emit(state.copyWith(status: UpdateProfileStatus.error));
      }
    } else {
      emit(state.copyWith(
          status: UpdateProfileStatus.error,
          nameError: nameError,
          addError: addEr,
          birthDate: birthErr,
          phoneError: phoneErr));
    }
  }
}