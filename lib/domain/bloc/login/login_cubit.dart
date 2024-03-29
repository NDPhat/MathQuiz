import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/authen/authen.dart';

import '../../../application/enum/login_status.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/user_repo.dart';
import '../../../main.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepo userRepo;
  final AuthenRepository authenRepository;
  String emailMess = "";
  String passMess = "";
  LoginCubit(
      {required UserRepo userAPIRepo,
      required AuthenRepository authenRepository})
      : userRepo = userAPIRepo,
        authenRepository = authenRepository,
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

  void clearData() {
    emit(state.copyWith(
        emailError: "", passError: "", status: LoginStatus.clear));
  }

  Future<void> loginAppWithEmailAndPass() async {
    emit(state.copyWith(status: LoginStatus.onLoading));
    if (isEmailValid(state.email)) {
      final user =
          await userRepo.getUserByEmailAndPass(state.email, state.pass);
      if (user != null) {
        authenRepository.handleAutoLoginApp(true);
        authenRepository.handleMailLoginApp(state.email.toString());
        instance.get<UserGlobal>().onLogin = true;
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
