part of 'history_test_cubit.dart';

class HistoryTestState extends Equatable {
  String timeNow;

  HistoryTestState({
    required this.timeNow,
    //this.user,
  });
  factory HistoryTestState.initial() {
    return HistoryTestState(
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

  HistoryTestState copyWith({
    String? timeNow,
    // auth.user? user,
  }) {
    return HistoryTestState(
      timeNow: timeNow ?? this.timeNow,
      //user: user ?? this.user,
    );
  }
}
