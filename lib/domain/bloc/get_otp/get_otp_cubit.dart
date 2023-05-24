import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/application/enum/get_otp_status.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';

part 'get_otp_state.dart';

class GetOTPCubit extends Cubit<GetOTPState> {
  String codeMessage = "";
  final UserAPIRepo userAPIRepo;

  GetOTPCubit({required UserAPIRepo userAPIRepo})
      : userAPIRepo = userAPIRepo,
        super(GetOTPState.initial());

  bool codeValidator(String code) {
    if (code.length < 5) {
      codeMessage = 'Wrong verification code. Please type again.';
      return false;
    } else {
      codeMessage = "";
      return true;
    }
  }

  void number1Changed(String value) {
    state.num1 = value;
  }

  void number2Changed(String value) {
    state.num2 = value;
  }

  void number3Changed(String value) {
    state.num3 = value;
  }

  void number4Changed(String value) {
    state.num4 = value;
  }

  void number5Changed(String value) {
    state.num5 = value;
  }

  Future<void> reSendOTPCode(String emailReset) async {
    await userAPIRepo.reSendOTPMAIL(emailReset);
  }

  Future<void> checkOTPCode(String emailReset, String otp) async {
    emit(state.copyWith(status: GetOTPStatus.onLoading));
    if (codeValidator(otp)) {
      final userModel = await userAPIRepo.checkOTPCode(emailReset, otp);
      if (userModel != null) {
        emit(state.copyWith(
            verificationErrorMessage: codeMessage,
            status: GetOTPStatus.success));
      } else {
        codeMessage = 'Wrong verification code. Please type again.';
        emit(state.copyWith(
            verificationErrorMessage: codeMessage, status: GetOTPStatus.error));
      }
    } else {
      emit(state.copyWith(
          verificationErrorMessage: codeMessage, status: GetOTPStatus.error));
    }
  }
}
