part of 'pre_quiz_cubit.dart';

class PreQuizState extends Equatable {
  int numQ;
  int eNum;
  int sNum;
  String numQMess;
  String sNumMess;
  String eNumMess;
  int time;
  PreQuizStatus status;

  PreQuizState({
    required this.numQ,
    required this.sNum,
    required this.eNum,
    required this.numQMess,
    required this.eNumMess,
    required this.sNumMess,
    required this.time,
    required this.status,
    //this.user,
  });
  factory PreQuizState.initial() {
    return PreQuizState(
      sNum: 1,
      eNum: 10,
      time: 5,
      numQMess: "",
      sNumMess: "",
      eNumMess: "",
      numQ: 10,
      status: PreQuizStatus.initial,
      //user: null,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        sNum,
        eNum,
        numQ,
        numQMess,
        sNumMess,
        eNumMess,
        time,
        status,
      ];

  PreQuizState copyWith({
    int? numQ,
    int? sNum,
    int? eNum,
    String? numQMess,
    String? sNumMess,
    String? eNumMess,
    int? time,
    PreQuizStatus? status,
  }) {
    return PreQuizState(
      numQ: numQ ?? this.numQ,
      sNum: sNum ?? this.sNum,
      eNum: eNum ?? this.eNum,
      numQMess: numQMess ?? this.numQMess,
      sNumMess: sNumMess ?? this.sNumMess,
      eNumMess: eNumMess ?? this.eNumMess,
      time: time ?? this.time,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
