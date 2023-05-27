import 'package:math/data/remote/model/user_model.dart';

import '../../data/model/user_global.dart';
import '../../main.dart';

class UserEventLocal {
  static void updateUserGlobal(UserModel a) {
    instance.get<UserGlobal>().fullName = a.name;
    instance.get<UserGlobal>().id = a.key;
    instance.get<UserGlobal>().email = a.email;
    instance.get<UserGlobal>().lop = a.lop;
    instance.get<UserGlobal>().gender = a.sex;
    instance.get<UserGlobal>().phone = a.phone;
    instance.get<UserGlobal>().address = a.add;
    instance.get<UserGlobal>().dateOfBirth = a.birthDate;
    instance.get<UserGlobal>().password = a.password;
  }
}
