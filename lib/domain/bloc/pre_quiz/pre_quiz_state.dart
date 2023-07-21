part of 'pre_quiz_cubit.dart';

class PreQuizState extends Equatable {
  int id;
  String? optionGame;
  String? idServer;
  PreQuizStatus status;

  PreQuizState({
    required this.optionGame,
    required this.id,
    this.idServer,
    required this.status,
    //this.user,
  });
  factory PreQuizState.initial() {
    return PreQuizState(
      idServer: '',
      optionGame: "input",
      status: PreQuizStatus.initial,
      id: 0,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, idServer, status, optionGame];

  PreQuizState copyWith({
    int? id,
    String? idServer,
    String? optionGame,
    PreQuizStatus? status,
  }) {
    return PreQuizState(
      id: id ?? this.id,
      optionGame: optionGame ?? this.optionGame,
      idServer: idServer ?? this.idServer,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
