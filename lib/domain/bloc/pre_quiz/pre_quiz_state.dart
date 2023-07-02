part of 'pre_quiz_cubit.dart';

class PreQuizState extends Equatable {
  int id;
  int? eNum;
  int? sNum;
  String? idServer;
  String sNumMess;
  String eNumMess;
  int time;
  PreQuizStatus status;

  PreQuizState({
    required this.id,
    this.sNum,
    this.eNum,
    this.idServer,
    required this.eNumMess,
    required this.sNumMess,
    required this.time,
    required this.status,
    //this.user,
  });
  factory PreQuizState.initial() {
    return PreQuizState(
      idServer: '',
      sNumMess: "",
      eNumMess: "",
      sNum: 1,
      eNum: 20,
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

        id,
        sNumMess,
        eNumMess,
        idServer,
        time,
        status,
      ];

  PreQuizState copyWith({
    int? sNum,
    int? eNum,
    int? id,
    String? idServer,
    String? sNumMess,
    String? eNumMess,
    int? time,
    PreQuizStatus? status,
  }) {
    return PreQuizState(
      id: id ?? this.id,
      sNum: sNum ?? this.sNum,
      eNum: eNum ?? this.eNum,
      sNumMess: sNumMess ?? this.sNumMess,
      eNumMess: eNumMess ?? this.eNumMess,
      idServer: idServer ?? this.idServer,
      time: time ?? this.time,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
