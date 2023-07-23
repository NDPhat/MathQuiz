part of 'take_hard_cubit.dart';

class TakeHardState extends Equatable {
  int id;
  String idServer;
  TakeHardStatus status;
  TakeHardState({
    required this.id,
    required this.idServer,
    required this.status,
    //this.user,
  });
  factory TakeHardState.initial() {
    return TakeHardState(
      idServer: "",
      id: 1,
      status: TakeHardStatus.initial,
      //user: null,
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

  TakeHardState copyWith({
    int? id,
    String? idServer,
    TakeHardStatus? status,
  }) {
    return TakeHardState(
      id: id ?? this.id,
      idServer: idServer ?? this.idServer,
      status: status ?? this.status,
      //user: user ?? this.user,
    );
  }
}
