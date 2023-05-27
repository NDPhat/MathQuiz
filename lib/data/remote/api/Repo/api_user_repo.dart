import 'package:math/data/remote/model/pre_quiz_hw_res.dart';
import 'package:math/data/remote/model/user_model.dart';

abstract class UserAPIRepo {
  Future<UserModel?> getUserByEmailAndPass(String email, String pass);
  Future<UserModel?> getUserByID(String id);
  Future<PreQuizHW?> getPreQuizHWByWeek(String week);
  Future<UserModel?> submitEmailForGetOTPForgetPass(String email);
  Future<UserModel?> reSendOTPMAIL(String email);
  Future<UserModel?> checkOTPCode(String email, String otp);
  Future<bool> updatePasswordUser(String email, UserModel user);
  Future<bool?> updateProfileUser(String keyId, UserModel user);

}
