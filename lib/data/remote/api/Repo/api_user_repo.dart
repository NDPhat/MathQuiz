import 'package:math/data/remote/model/user_model.dart';

abstract class UserLocalAPIRepo{
  Future<UserModel> getUserByEmailAndPass(String email,String pass);
}