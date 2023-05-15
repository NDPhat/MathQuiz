part of 'pre_quiz_cubit.dart';

class PreQuizState extends Equatable {
  int  id;
  int ? numQ;
  int ? eNum;
  int ? sNum;
  String numQMess;
  String sNumMess;
  String eNumMess;
  int  time;
  PreQuizStatus status;

  PreQuizState({
     required this.id,
     this.numQ,
     this.sNum,
     this.eNum,
    required this.numQMess,
    required this.eNumMess,
    required this.sNumMess,
     required this.time,
    required this.status,
    //this.user,
  });
  factory PreQuizState.initial() {
    return PreQuizState(

      numQMess: "",
      sNumMess: "",
      eNumMess: "",
      status: PreQuizStatus.initial, id: 1, time: 5,
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
        id,
        sNumMess,
        eNumMess,
        time,
        status,
      ];

  PreQuizState copyWith({
    int? numQ,
    int? sNum,
    int? eNum,
    int? id,
    String? numQMess,
    String? sNumMess,
    String? eNumMess,
    int? time,
    PreQuizStatus? status,
  }) {
    return PreQuizState(
      id: id ?? this.id,
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
