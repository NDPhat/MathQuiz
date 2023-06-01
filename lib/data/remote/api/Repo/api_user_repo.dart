import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import 'package:math/data/remote/model/user_api_res.dart';

import '../../model/detail_quiz_hw_response.dart';
import '../../model/pre_quiz_game_response.dart';
import '../../model/pre_quiz_hw_response.dart';
import '../../model/quiz_game_response.dart';
import '../../model/result_quiz_hw_req.dart';

abstract class UserAPIRepo {
  Future<UserAPIModel?> getUserByEmailAndPass(String email, String pass);
  Future<UserAPIModel?> getUserByID(String id);
  Future<PreQuizHWResAPIModel?> getPreQuizHWByWeek(String week);
  Future<UserAPIModel?> submitEmailForGetOTPForgetPass(String email);
  Future<UserAPIModel?> reSendOTPMAIL(String email);
  Future<UserAPIModel?> checkOTPCode(String email, String otp);
  Future<bool> updatePasswordUser(String email, UserAPIModel user);
  Future<bool?> updateProfileUser(String keyId, UserAPIModel user);
  Future<ResultQuizHWAPIModel?> createResultHomeWorkWeek(
      ResultQuizHWAPIReq resultQuizHWReq);
  Future<bool?> updateInfoHomeWorkWeek(
      ResultQuizHWAPIReq resultQuizHWReq, String resultID);
  Future<List<ResultQuizHWAPIModel>?> getALlResultQuizHWByUserID(String uid);
  Future<List<PreQuizHWResAPIModel>?> getALlPreQuizHW();
  Future<PreQuizHWResAPIModel?> getLatestPreQuizHW();
  Future<bool?> saveQuizDetailHW(DetailQuizHWAPIModel model);
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByResultID(
      String resultID);
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByUserIDAndWeek(
      String userID, String week);
  Future<PreQuizGameAPIModel?> createPreQuizGame(
      PreQuizGameAPIModel preQuizReq);
  Future<PreQuizGameAPIModel?> updatePreQuizGameByID(
      PreQuizGameAPIModel preQuizReq, String preID);
  Future<QuizGameAPIModel?> createQuizGame(QuizGameAPIModel quizReq);
}
