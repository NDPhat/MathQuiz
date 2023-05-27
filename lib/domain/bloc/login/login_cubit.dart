import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/user_model.dart';

import '../../../application/enum/login_status.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserAPIRepo userAPIRepo;
  String emailMess = "";
  String passMess = "";
  LoginCubit({required UserAPIRepo userAPIRepo})
      : userAPIRepo = userAPIRepo,
        super(LoginState.initial());
  void emailChanged(String value) {
    state.email = value;
  }

  bool isEmailValid(email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }

  void passChanged(String value) {
    state.pass = value;
  }

  Future<void> loginAppWithEmailAndPass() async {
    emit(state.copyWith(status: LoginStatus.onLoading));
    if (isEmailValid(state.email)) {
      final user =
          await userAPIRepo.getUserByEmailAndPass(state.email, state.pass);
      if (user != null) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        passMess = "Your password do not match";
        emit(state.copyWith(status: LoginStatus.error, passError: passMess));
      }
    } else {
      emailMess = "This is not an email!";
      emit(state.copyWith(status: LoginStatus.error, emailError: emailMess));
    }
  }
}
