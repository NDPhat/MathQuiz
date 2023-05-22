import 'package:math/data/remote/model/user_model.dart';

abstract class UserAPIRepo{
  Future<UserModel?> getUserByEmailAndPass(String email,String pass);
  Future<UserModel?> submitEmailForGetOTPForgetPass(String email);
  Future<UserModel?> reSendOTPMAIL(String email);
  Future<UserModel?> checkOTPCode(String email,String otp);
}