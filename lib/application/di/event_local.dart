import 'package:drift/drift.dart';
import 'package:math/data/local/repo/player_local/player_local_repo.dart';
import 'package:math/data/remote/model/user_res.dart';

import '../../data/local/driff/db/db_app.dart';
import '../../data/local/repo/pre_quiz/pre_pra_local_repo.dart';
import '../../data/model/user_global.dart';
import '../../data/model/user_local.dart';
import '../../main.dart';

class UserEventLocal {
  static void updateUserGlobal(UserAPIModel a) {
    instance.get<UserGlobal>().fullName = a.fullName;
    instance.get<UserGlobal>().id = a.key;
    instance.get<UserGlobal>().email = a.email;
    instance.get<UserGlobal>().lop = a.lop;
    instance.get<UserGlobal>().gender = a.sex;
    instance.get<UserGlobal>().phone = a.phone;
    instance.get<UserGlobal>().linkImage = a.linkImage;
    instance.get<UserGlobal>().deleteHash = a.deleteHash;
    instance.get<UserGlobal>().address = a.address;
    instance.get<UserGlobal>().dateOfBirth = a.birthDay;
    instance.get<UserGlobal>().password = a.password;
  }

  static Future<void> getScoreAndJoinForLocal() async {
    double scoreGame = await instance.get<PrePraLocalRepo>().getAverageScore();
    int intGame =
        await instance.get<PrePraLocalRepo>().getLengthAllPreQuizGame();
    if (scoreGame.isNaN) {
      scoreGame = 0;
    }
    if (intGame.isNaN) {
      intGame = 0;
    }
    instance.get<UserLocal>().score = scoreGame;
    instance.get<UserLocal>().participate = intGame;
    instance.get<PlayerLocalRepo>().updatePlayerLocal(
        PlayerLocalEntityCompanion(
            score: Value(scoreGame), participate: Value(intGame)),
        instance.get<UserLocal>().id!);
  }

  static void updateUserLocal(PlayerLocalEntityData a) {
    getScoreAndJoinForLocal();
    instance.get<UserLocal>().id = a.id;
    instance.get<UserLocal>().name = a.name;
    instance.get<UserLocal>().imageLink = a.imageUser;
    instance.get<UserLocal>().score = a.score;
    instance.get<UserLocal>().participate = a.participate;
  }
}
