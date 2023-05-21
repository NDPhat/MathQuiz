import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/api/Repo/api_user_repo.dart';
import 'package:math/data/remote/model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserAPIRepo userAPIRepo;
  LoginCubit({required UserAPIRepo userAPIRepo})
      : userAPIRepo = userAPIRepo,
        super(LoginState.initial());
  Future<void> loginAppWithEmailandPass(String email, String pass) async {
    UserModel user = await userAPIRepo.getUserByEmailAndPass(email, pass);
    if (user != null) {
      print(user.lop);
      emit(state.copyWith(loginsuccess: true));
    }
    emit(state.copyWith(loginsuccess: false));
  }
}
