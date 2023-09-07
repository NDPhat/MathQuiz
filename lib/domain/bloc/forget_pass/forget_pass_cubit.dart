import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../application/enum/foget_pass_status.dart';
import '../../../data/remote/api/Repo/user_repo.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  String emailMessage = "";
  final UserRepo userRepo;
  ForgetPassCubit({required this.userRepo}) : super(ForgetPassState.initial());
  bool isEmailValid(email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }

  void emailChanged(value) {
    state.email = value;
  }

  void clearData() {
    emit(state.copyWith(emailErrorMessage: "", status: ForgetPassStatus.clear));
  }

  Future<void> submitEmailForGetOTPResetPass(String email) async {
    emit(state.copyWith(status: ForgetPassStatus.onLoading));
    if (isEmailValid(email)) {
      final userModel = await userRepo.submitEmailForGetOTPForgetPass(email);
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
