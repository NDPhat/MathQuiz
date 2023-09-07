
import 'package:math/data/remote/model/user_res.dart';
import '../../model/user_req.dart';

abstract class UserRepo {
  Future<UserAPIModel?> getUserByEmailAndPass(String email, String pass);
  Future<UserAPIModel?> getUserByID(String id);
  Future<UserAPIModel?> getUserByEmail(String email);
  Future<UserAPIModel?> submitEmailForGetOTPForgetPass(String email);
  Future<UserAPIModel?> reSendOTPMAIL(String email);
  Future<UserAPIModel?> checkOTPCode(String email, String otp);
  Future<bool> updatePasswordUser(String email, UserAPIModel user);
  Future<bool?> updateProfileUser(String keyId, UserAPIReq user);
}
