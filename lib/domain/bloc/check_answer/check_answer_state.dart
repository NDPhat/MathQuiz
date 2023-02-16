part of 'check_answer_cubit.dart';

class CheckAnswerState extends Equatable {
  String timeNow;

  CheckAnswerState({
    required this.timeNow,
    //this.user,
  });
  factory CheckAnswerState.initial() {
    return CheckAnswerState(
      timeNow: formatDateInput.format(DateTime.now()),
      //user: null,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
    timeNow,

  ];

  CheckAnswerState copyWith({
    String? timeNow,
    // auth.user? user,
  }) {
    return CheckAnswerState(
      timeNow: timeNow ?? this.timeNow,
      //user: user ?? this.user,
    );
  }
}
