import 'package:math/data/remote/model/pre_test_req.dart';
import 'package:math/data/remote/model/quiz_test_req.dart';
import 'package:math/data/remote/model/quiz_test_res.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import 'package:math/data/remote/model/user_api_res.dart';

import '../../model/detail_quiz_hw_req.dart';
import '../../model/detail_quiz_hw_response.dart';
import '../../model/pre_quiz_game_req.dart';
import '../../model/pre_quiz_game_response.dart';
import '../../model/pre_quiz_hw_response.dart';
import '../../model/pre_test_res.dart';
import '../../model/quiz_game_req.dart';
import '../../model/quiz_game_response.dart';
import '../../model/result_quiz_hw_req.dart';

abstract class UserAPIRepo {
  Future<UserAPIModel?> getUserByEmailAndPass(String email, String pass);
  Future<UserAPIModel?> getUserByID(String id);
  Future<UserAPIModel?> getUserByEmail(String email);
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
  Future<bool?> deleteResultHWNotDo(
      String resultID);
  Future<List<ResultQuizHWAPIModel>?> getALlResultQuizHWByUserID(String uid);
  Future<List<PreQuizHWResAPIModel>?> getALlPreQuizHW();
  Future<PreQuizHWResAPIModel?> getLatestPreQuizHW();
  Future<bool?> saveQuizDetailHW(DetailQuizHWAPIReq model);
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByResultID(
      String resultID);
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByUserIDAndWeek(
      String userID, String week);
  Future<List<QuizGameAPIModel>?> getALlQuizGameByPreGameID(String preID);
  Future<List<PreQuizGameAPIModel>?> getALlPreQuizGameByUidandOptionGame(
      String uid, String option);
  Future<PreQuizGameAPIModel?> createPreQuizGame(PreQuizGameAPIReq preQuizReq);
  Future<PreTestAPIRes?> createPreQuizTest(PreTestReq preQuizReq);
  Future<PreQuizGameAPIModel?> updatePreQuizGameByID(
      PreQuizGameAPIReq preQuizReq, String preID);
  Future<bool?> updatePreQuizTestByID(PreTestReq preQuizReq, String preID);
  Future<bool?> createQuizGame(QuizGameAPIReq quizReq);
  Future<bool?> createQuizTest(QuizTestReq quizReq);
  Future<List<QuizTestAPIRes>?> getALlQuizTestByPreTestID(String preID);
  Future<List<PreTestAPIRes>?> getALlPreQuizTestByUid(String uid);
  Future<bool?> deleteTestingNotDoByPreTestId(
      String preID);
}
