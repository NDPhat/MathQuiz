import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/enum/update_profile_status.dart';

import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/user_repo.dart';
import '../../../data/remote/model/user_req.dart';
import '../../../main.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserRepo userRepo;
  String nameError = "";
  String phoneErr = "";
  String birthErr = "";
  String addEr = "";
  UpdateProfileCubit({required this.userRepo})
      : super(UpdateProfileState.initial());
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

  void clearData() {
    emit(state.copyWith(
        nameError: "",
        addError: "",
        phoneError: "",
        birthError: "",
        status: UpdateProfileStatus.clear));
  }

  Future<void> updateProfileUser(
      String linkImage, String deleteHash, File? _imageFile) async {
    emit(state.copyWith(status: UpdateProfileStatus.onLoading));
    if (isFormValid()) {
      late UserAPIReq dataNew;
      if (_imageFile != null) {
        dataNew = UserAPIReq(
            address: state.address,
            phone: state.phone,
            fullName: state.fullName,
            birthDay: state.birthDate,
            deleteHash: deleteHash,
            linkImage: linkImage,
            sex: state.sex);
      } else {
        dataNew = UserAPIReq(
            address: state.address,
            phone: state.phone,
            fullName: state.fullName,
            birthDay: state.birthDate,
            sex: state.sex);
      }
      bool? updateDone = await userRepo.updateProfileUser(
          instance.get<UserGlobal>().id.toString(), dataNew);
      print(updateDone);
      if (updateDone == true) {
        userRepo.getUserByID(instance.get<UserGlobal>().id.toString());
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
