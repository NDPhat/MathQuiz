import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';

import '../../../application/enum/update_pass_status.dart';
import '../../../data/remote/model/user_api_res.dart';

part 'update_pass_state.dart';

class UpdatePassCubit extends Cubit<UpdatePassState> {
  final UserAPIRepo userAPIRepo;
  String confirmPassMessage = "";
  String passMessage = "";

  UpdatePassCubit({required UserAPIRepo userAPIRepo})
      : userAPIRepo = userAPIRepo,
        super(UpdatePassState.initial());

  void passChanged(String value) {
    state.password = value;
  }

  void confirmPassChange(String value) {
    state.confirmPass = value;
  }

  bool passValidator(String pass) {
    if (pass.isEmpty || pass.length < 8) {
      passMessage = "Password must have least 8 characters";
      return false;
    } else {
      passMessage = "";
      return true;
    }
  }

  bool confirmPassValidator(String confirmPass) {
    if (confirmPass.isEmpty || confirmPass.compareTo(state.password) != 0) {
      confirmPassMessage = "Your passwords don't match";
      return false;
    } else {
      confirmPassMessage = "";
      return true;
    }
  }

  bool formValidator() {
    if (confirmPassValidator(state.confirmPass) &&
        passValidator(state.password)) {
      return true;
    }
    return false;
  }

  Future<void> updatePassWithCredentials(String email) async {
    emit(state.copyWith(status: UpdatePassStatus.onLoading));
    if (formValidator()) {
      bool updateDone = await userAPIRepo.updatePasswordUser(
          email, UserAPIModel(password: state.password));
      if (updateDone) {
        emit(state.copyWith(
            passErrorMessage: "",
            confirmPassErrorMessage: "",
            status: UpdatePassStatus.success));
      } else {
        emit(state.copyWith(
            passErrorMessage: "Internal server error",
            confirmPassErrorMessage: "Internal server error",
            status: UpdatePassStatus.error));
      }
    } else {
      emit(state.copyWith(
          passErrorMessage: passMessage,
          confirmPassErrorMessage: confirmPassMessage,
          status: UpdatePassStatus.error));
    }
  }
}
