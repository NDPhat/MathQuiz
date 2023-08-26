part of 'history_cubit.dart';

class HistoryState extends Equatable {
  String timePraNow;
  String timeTestNow;
  int pagePraNow;
  int pageTestNow;
  int lengthPra;
  int lengthTest;

  HistoryState({
    required this.timePraNow,
    required this.timeTestNow,
    required this.pagePraNow,
    required this.pageTestNow,
    required this.lengthPra,
    required this.lengthTest,
    //this.user,
  });
  factory HistoryState.initial() {
    return HistoryState(
      timePraNow: formatDateInput.format(DateTime.now()),
      pagePraNow: 1,
      pageTestNow: 1,
      lengthPra: 1,
      lengthTest: 1,
      timeTestNow: formatDateInput.format(DateTime.now()),
      //user: null,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [timeTestNow, timePraNow, pagePraNow, lengthPra, lengthTest, pageTestNow];

  HistoryState copyWith({
    String? timeTestNow,
    String? timePraNow,
    int? pagePraNow,
    int? pageTestNow,
    int? lengthPra,
    int? lengthTest,
    // auth.user? user,
  }) {
    return HistoryState(
      timeTestNow: timeTestNow ?? this.timeTestNow,
      timePraNow: timePraNow ?? this.timePraNow,
      pagePraNow: pagePraNow ?? this.pagePraNow,
      pageTestNow: pageTestNow ?? this.pageTestNow,
      lengthPra: lengthPra ?? this.lengthPra,
      lengthTest: lengthTest ?? this.lengthTest,
      //user: user ?? this.user,
    );
  }
}
