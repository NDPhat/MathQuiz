part of 'history_pra_cubit.dart';

class HistoryPraState extends Equatable {
  String timeNow;

  HistoryPraState({
    required this.timeNow,
    //this.user,
  });
  factory HistoryPraState.initial() {
    return HistoryPraState(
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

  HistoryPraState copyWith({
    String? timeNow,
    // auth.user? user,
  }) {
    return HistoryPraState(
      timeNow: timeNow ?? this.timeNow,
      //user: user ?? this.user,
    );
  }
}
