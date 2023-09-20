import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/application/di/event_local.dart';
import 'package:math/data/remote/authen/authen.dart';
import 'package:math/main.dart';

import '../../../application/enum/add_player_status.dart';
import '../../../data/local/driff/db/db_app.dart';
import '../../../data/local/repo/player_local/player_local_repo.dart';
part 'add_player_state.dart';

class AddPlayerCubit extends Cubit<AddPlayerState> {
  final PlayerLocalRepo playerLocalRepo;
  String nameMess = "";
  AddPlayerCubit({required PlayerLocalRepo playerLocalRepo})
      : playerLocalRepo = playerLocalRepo,
        super(AddPlayerState.initial());
  void addPlayerToLocal(String imageLink) async {
    if (checkName() == true) {
      try {
        int userID = await playerLocalRepo.insertPlayerLocal(
            PlayerLocalEntityCompanion(
                name: Value(state.name),
                imageUser: Value(imageLink),
                score: const Value(0),
                participate: const Value(0)));
        UserEventLocal.updateUserLocal(PlayerLocalEntityData(
            id: userID,
            name: state.name,
            imageUser: imageLink,
            score: 0,
            participate: 0));
        instance.get<AuthenRepository>().handleLocalAutoLoginApp(true);
        instance.get<AuthenRepository>().handleIDLocalPlayerLoginApp(userID);
        emit(state.copyWith(status: AddPlayerStatus.success));
      } on Exception catch (e) {
        emit(state.copyWith(status: AddPlayerStatus.error));
      }
    } else {
      emit(state.copyWith(status: AddPlayerStatus.error, nameError: nameMess));
    }
  }

  void nameChanged(String name) {
    state.name = name;
  }

  void imageChanged(String imageUser) {
    state.imageUser = imageUser;
  }

  void clearData() {
    emit(state.copyWith(status: AddPlayerStatus.clear, nameError: ""));
  }

  bool checkName() {
    if (state.name != "") {
      nameMess = "";
      return true;
    } else {
      nameMess = "Enter this field";
      return false;
    }
  }
}
