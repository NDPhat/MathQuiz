import 'package:math/data/remote/model/user_model.dart';

abstract class UserAPIRepo{
  Future<UserModel> getUserByEmailAndPass(String email,String pass);
}