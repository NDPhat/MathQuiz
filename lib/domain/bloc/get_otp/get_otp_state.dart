part of 'get_otp_cubit.dart';

class GetOTPState extends Equatable {
  String num1, num2, num3, num4, num5;
  GetOTPStatus status;
  String verificationErrorMessage;

  //final auth.user? user;

  GetOTPState({
    required this.num1,
    required this.num2,
    required this.num3,
    required this.num4,
    required this.num5,
    required this.status,
    required this.verificationErrorMessage,
    //this.user,
  });

  factory GetOTPState.initial() {
    return GetOTPState(
      num1: '',
      num2: '',
      num3: '',
      num4: '',
      num5: '',

      verificationErrorMessage: '',
      status: GetOTPStatus.initial,

      //user: null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        num1,
        num2,
        num3,
        num4,
        num5,
        status,
        verificationErrorMessage,
      ];

  GetOTPState copyWith({
    String? num1,
    num2,
    num3,
    num4,
    num5,
    String? verificationErrorMessage,
    GetOTPStatus? status,
    // auth.user? user,
  }) {
    return GetOTPState(
      num1: num1 ?? this.num1,
      num2: num2 ?? this.num2,
      num3: num3 ?? this.num3,
      num4: num4 ?? this.num4,
      num5: num5 ?? this.num5,
      verificationErrorMessage:
          verificationErrorMessage ?? this.verificationErrorMessage,
      status: status ?? this.status,

      //user: user ?? this.user,
    );
  }
}
