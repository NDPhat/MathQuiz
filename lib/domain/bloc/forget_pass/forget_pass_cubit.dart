import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';

import '../../../application/enum/foget_pass_status.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  String emailMessage = "";
  final UserAPIRepo userAPIRepo;
  ForgetPassCubit({required UserAPIRepo userAPIRepo})
      : userAPIRepo = userAPIRepo,
        super(ForgetPassState.initial());
  bool isEmailValid(email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }

  void emailChanged(value) {
    state.email = value;
  }

  Future<void> submitEmailForGetOTPResetPass(String email) async {
    emit(state.copyWith(status: ForgetPassStatus.onLoading));
    if (isEmailValid(email)) {
      final userModel =
          await userAPIRepo.submitEmailForGetOTPForgetPass(email);
      if (userModel != null) {
        emailMessage = "";
        emit(state.copyWith(
            emailErrorMessage: emailMessage, status: ForgetPassStatus.success));
      } else {
        emailMessage = " Could not find any account with this email.";
        emit(state.copyWith(
            emailErrorMessage: emailMessage, status: ForgetPassStatus.error));
      }
    } else {
      emailMessage = "This is not an email. Please try again.";
      emit(state.copyWith(
          emailErrorMessage: emailMessage, status: ForgetPassStatus.error));
    }
  }
}
