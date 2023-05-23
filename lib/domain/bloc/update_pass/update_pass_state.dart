part of 'update_pass_cubit.dart';

class UpdatePassState extends Equatable {
  String password;
  String confirmPass;
  UpdatePassStatus status;
  String confirmPassErrorMessage;
  String passErrorMessage;

  //final auth.user? user;

  UpdatePassState({
    required this.password,
    required this.confirmPass,
    required this.status,
    required this.passErrorMessage,
    required this.confirmPassErrorMessage,
    //this.user,
  });

  factory UpdatePassState.initial() {
    return UpdatePassState(
        password: '',
        confirmPass: '',
        status: UpdatePassStatus.initial,
        confirmPassErrorMessage: '',
        passErrorMessage: ''
        //user: null,
        );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        password,
        confirmPass,
        status,
        confirmPassErrorMessage,
        passErrorMessage
      ];

  UpdatePassState copyWith({
    String? password,
    String? confirmPass,
    String? confirmPassErrorMessage,
    String? passErrorMessage,
    UpdatePassStatus? status,
    // auth.user? user,
  }) {
    return UpdatePassState(
        password: password ?? this.password,
        confirmPass: confirmPass ?? this.confirmPass,
        confirmPassErrorMessage:
            confirmPassErrorMessage ?? this.confirmPassErrorMessage,
        status: status ?? this.status,
        passErrorMessage: passErrorMessage ?? this.passErrorMessage
        //user: user ?? this.user,
        );
  }
}
