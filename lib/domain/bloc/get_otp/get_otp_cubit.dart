import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math/application/enum/status.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';

part 'get_otp_state.dart';

class GetOTPCubit extends Cubit<GetOTPState> {
  String codeMessage = "";
  String codeVerify = "";
  final UserAPIRepo userAPIRepo;

  GetOTPCubit({required UserAPIRepo userAPIRepo})
      : userAPIRepo = userAPIRepo,
        super(GetOTPState.initial());

  bool codeValidator(String code) {
    code = state.num1.trim().toString() +
        state.num2.trim().toString() +
        state.num3.trim().toString() +
        state.num4.trim().toString() +
        state.num5.trim().toString();
    if (code.length < 5) {
      codeMessage = "";
      return false;
    } else {
      codeVerify = code;
      codeMessage = "";
      return true;
    }
  }

  void number1Changed(String value) {
    state.num1 = value;
    if (state.verificationErrorMessage.isNotEmpty) {
      emit(state.copyWith(verificationErrorMessage: ""));
    }
  }

  void number2Changed(String value) {
    state.num2 = value;
    if (state.verificationErrorMessage.isNotEmpty) {
      emit(state.copyWith(verificationErrorMessage: ""));
    }
  }

  void number3Changed(String value) {
    state.num3 = value;
    if (state.verificationErrorMessage.isNotEmpty) {
      emit(state.copyWith(verificationErrorMessage: ""));
    }
  }

  void number4Changed(String value) {
    state.num4 = value;
    if (state.verificationErrorMessage.isNotEmpty) {
      emit(state.copyWith(verificationErrorMessage: ""));
    }
  }

  void number5Changed(String value) {
    state.num5 = value;
    if (state.verificationErrorMessage.isNotEmpty) {
      emit(state.copyWith(verificationErrorMessage: ""));
    }
  }

  Future<void> sendOTPCode(String emailReset) async {
    emit(state.copyWith(status: Status.onLoading));
  }
}
