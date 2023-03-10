part of 'game_cubit.dart';

class GameState extends Equatable {
  int trueQ;
  int falseQ;
  int qNow;
  int score;

  GameStatus status;

  GameState({
    required this.trueQ,
    required this.falseQ,
    required this.qNow,
    required this.score,
    required this.status,
    //this.user,
  });
  factory GameState.initial() {
    return GameState(
      trueQ: 0,
      falseQ: 0,
      score: 0, qNow: 1,
      status: GameStatus.initial,
      //user: null,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        trueQ,
        falseQ,
        score,
        qNow,
        status,
      ];

  GameState copyWith({
    int? trueQ,
    int? falseQ,
    int? score,
    int? qNow,
    GameStatus? status,
  }) {
    return GameState(
      trueQ: trueQ ?? this.trueQ,
      falseQ: falseQ ?? this.falseQ,
      score: score ?? this.score,
      qNow: qNow ?? this.qNow,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
