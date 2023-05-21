part of 'login_cubit.dart';

class LoginState extends Equatable {
  bool loginsuccess;

  LoginState({required this.loginsuccess
      //this.user,
      });
  factory LoginState.initial() {
    return LoginState(loginsuccess: false
        //user: null,
        );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [loginsuccess];

  LoginState copyWith({bool? loginsuccess}) {
    return LoginState(
      loginsuccess: loginsuccess ?? this.loginsuccess,
      //user: user ?? this.user,
    );
  }
}
