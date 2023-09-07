part of 'pre_pra_cubit.dart';

class PrePraState extends Equatable {
  int id;
  String? optionGame;
  String? idServer;
  PreQuizStatus status;

  PrePraState({
    required this.optionGame,
    required this.id,
    this.idServer,
    required this.status,
    //this.user,
  });
  factory PrePraState.initial() {
    return PrePraState(
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

  PrePraState copyWith({
    int? id,
    String? idServer,
    String? optionGame,
    PreQuizStatus? status,
  }) {
    return PrePraState(
      id: id ?? this.id,
      optionGame: optionGame ?? this.optionGame,
      idServer: idServer ?? this.idServer,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
