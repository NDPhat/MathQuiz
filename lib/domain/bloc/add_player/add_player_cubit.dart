import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/authen/authen.dart';

import '../../../application/enum/add_player_status.dart';
import '../../../data/local/repo/player_local/player_local_repo.dart';
part 'add_player_state.dart';

class AddPlayerCubit extends Cubit<AddPlayerState> {
  final PlayerLocalRepo playerLocalRepo;
  String nameMess = "";
  AddPlayerCubit({required PlayerLocalRepo playerLocalRepo})
      : playerLocalRepo = playerLocalRepo,
        super(AddPlayerState.initial());
  void addPlayerToLocal() {}
  void onTapAvaPlayer(bool value,String imageLink) {
    emit(state.copyWith(choose: value,imageUser: imageLink));
  }
}
