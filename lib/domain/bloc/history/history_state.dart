part of 'history_cubit.dart';

class HistoryState extends Equatable {
  String timePraNow;
  String timeTestNow;

  HistoryState({
    required this.timePraNow,
    required this.timeTestNow,
    //this.user,
  });
  factory HistoryState.initial() {
    return HistoryState(
      timePraNow: formatDateInput.format(DateTime.now()),
      timeTestNow: formatDateInput.format(DateTime.now()),
      //user: null,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
    timeTestNow,timePraNow

  ];

  HistoryState copyWith({
    String? timeTestNow,
    String? timePraNow,
    // auth.user? user,
  }) {
    return HistoryState(
      timeTestNow: timeTestNow ?? this.timeTestNow,
      timePraNow: timePraNow ?? this.timePraNow,
      //user: user ?? this.user,
    );
  }
}
