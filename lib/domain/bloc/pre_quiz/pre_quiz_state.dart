part of 'pre_quiz_cubit.dart';

class PreQuizState extends Equatable {
  int id;
  String? idServer;
  PreQuizStatus status;

  PreQuizState({
    required this.id,
    this.idServer,
    required this.status,
    //this.user,
  });
  factory PreQuizState.initial() {
    return PreQuizState(
      idServer: '',
      status: PreQuizStatus.initial,
      id: 1,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        id,
        idServer,
        status,
      ];

  PreQuizState copyWith({
    int? id,
    String? idServer,
    PreQuizStatus? status,
  }) {
    return PreQuizState(
      id: id ?? this.id,
      idServer: idServer ?? this.idServer,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
