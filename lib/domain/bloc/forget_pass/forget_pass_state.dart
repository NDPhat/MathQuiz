part of 'forget_pass_cubit.dart';

class ForgetPassState extends Equatable {
  String email;
  Status status;
  String emailErrorMessage;

  //final auth.user? user;

  ForgetPassState({
    required this.email,
    required this.emailErrorMessage,
    required this.status,
    //this.user,
  });

  factory ForgetPassState.initial() {
    return ForgetPassState(
      email: '',
      emailErrorMessage: '',
      status: Status.initial,
      //user: null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, status, emailErrorMessage];

  ForgetPassState copyWith({
    String? email,
    String? emailErrorMessage,
    Status? status,
    // auth.user? user,
  }) {
    return ForgetPassState(
      email: email ?? this.email,
      emailErrorMessage: emailErrorMessage ?? this.emailErrorMessage,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
