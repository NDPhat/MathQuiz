part of 'add_player_cubit.dart';

class AddPlayerState extends Equatable {
  String name;
  String nameError;
  String imageUser;
  bool choose;
  AddPlayerStatus status;

  AddPlayerState({
    required this.name,
    required this.nameError,
    this.choose = false,
    required this.imageUser,
    required this.status,
    //this.user,
  });
  factory AddPlayerState.initial() {
    return AddPlayerState(
        name: "Player 0",
        nameError: '',
        imageUser: '',
        choose: false,
        status: AddPlayerStatus.initial
        //user: null,
        );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, nameError, status, imageUser, choose];

  AddPlayerState copyWith({
    String? name,
    String? imageUser,
    bool? choose,
    String? nameError,
    AddPlayerStatus? status,
  }) {
    return AddPlayerState(
        name: name ?? this.name,
        choose: choose ?? this.choose,
        imageUser: imageUser ?? this.imageUser,
        nameError: nameError ?? this.nameError,
        status: status ?? this.status
        //user: user ?? this.user,
        );
  }
}
