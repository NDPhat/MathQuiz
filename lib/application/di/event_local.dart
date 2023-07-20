import 'package:math/data/remote/model/user_api_res.dart';

import '../../data/local/driff/db/db_app.dart';
import '../../data/model/user_global.dart';
import '../../data/model/user_local.dart';
import '../../main.dart';

class UserEventLocal {
  static void updateUserGlobal(UserAPIModel a) {
    instance.get<UserGlobal>().fullName = a.name;
    instance.get<UserGlobal>().id = a.key;
    instance.get<UserGlobal>().email = a.email;
    instance.get<UserGlobal>().lop = a.lop;
    instance.get<UserGlobal>().gender = a.sex;
    instance.get<UserGlobal>().phone = a.phone;
    instance.get<UserGlobal>().linkImage = a.linkImage;
    instance.get<UserGlobal>().deleteHash = a.deleteHash;
    instance.get<UserGlobal>().address = a.add;
    instance.get<UserGlobal>().dateOfBirth = a.birthDate;
    instance.get<UserGlobal>().password = a.password;
  }

  static void updateUserLocal(PlayerLocalEntityData a) {
    instance.get<UserLocal>().id = a.id;
    instance.get<UserLocal>().name = a.name;
    instance.get<UserLocal>().imageLink = a.imageUser;
  }
}
