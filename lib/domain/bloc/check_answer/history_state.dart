part of 'history_cubit.dart';

class HistoryState extends Equatable {
  String timeNow;

  HistoryState({
    required this.timeNow,
    //this.user,
  });
  factory HistoryState.initial() {
    return HistoryState(
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

  HistoryState copyWith({
    String? timeNow,
    // auth.user? user,
  }) {
    return HistoryState(
      timeNow: timeNow ?? this.timeNow,
      //user: user ?? this.user,
    );
  }
}
