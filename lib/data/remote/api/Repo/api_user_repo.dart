import 'package:math/data/remote/model/pre_test_req.dart';
import 'package:math/data/remote/model/quiz_test_req.dart';
import 'package:math/data/remote/model/quiz_test_res.dart';
import 'package:math/data/remote/model/quiz_test_with_pagination_res.dart';
import 'package:math/data/remote/model/result_quiz_hw_res_pagi.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import 'package:math/data/remote/model/user_api_res.dart';

import '../../model/detail_quiz_hw_req.dart';
import '../../model/detail_quiz_hw_response.dart';
import '../../model/pre_quiz_game_req.dart';
import '../../model/pre_quiz_game_res_pagi.dart';
import '../../model/pre_quiz_game_response.dart';
import '../../model/pre_quiz_game_sen_req.dart';
import '../../model/pre_quiz_game_sen_res.dart';
import '../../model/pre_quiz_hw_response.dart';
import '../../model/pre_test_res.dart';
import '../../model/pre_test_res_pagi.dart';
import '../../model/quiz_game_req.dart';
import '../../model/quiz_game_response.dart';
import '../../model/quiz_game_with_pagination_res.dart';
import '../../model/result_quiz_hw_req.dart';
import '../../model/sentences_quiz_res.dart';
import '../../model/user_req.dart';

abstract class UserAPIRepo {
  Future<UserAPIModel?> getUserByEmailAndPass(String email, String pass);
  Future<UserAPIModel?> getUserByID(String id);
  Future<UserAPIModel?> getUserByEmail(String email);
  Future<PreQuizHWResAPIModel?> getPreQuizHWByWeek(String week);
  Future<UserAPIModel?> submitEmailForGetOTPForgetPass(String email);
  Future<UserAPIModel?> reSendOTPMAIL(String email);
  Future<UserAPIModel?> checkOTPCode(String email, String otp);
  Future<bool> updatePasswordUser(String email, UserAPIModel user);
  Future<bool?> updateProfileUser(String keyId, UserAPIReq user);
  Future<ResultQuizHWAPIModel?> createResultHomeWorkWeek(
      ResultQuizHWAPIReq resultQuizHWReq);
  Future<bool?> updateInfoHomeWorkWeek(
      ResultQuizHWAPIReq resultQuizHWReq, String resultID);
  Future<bool?> deleteResultHWNotDo(String resultID);
  Future<List<ResultQuizHWAPIModel>?> getALlResultQuizHWByUserID(String uid);
  Future<ResultQuizHWResPagi?> getALlResultQuizHWByUserIDWithPagi(String uid,int page);
  Future<ResultQuizHWAPIModel?> getResultQuizHWByUserIDAndWeek(
      String uid, String week);
  Future<List<PreQuizHWResAPIModel>?> getALlPreQuizHW();
  Future<PreQuizHWResAPIModel?> getOnGoingPreHWandNotDO(String uid);
  Future<bool?> saveQuizDetailHW(DetailQuizHWAPIReq model);
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByResultID(
      String resultID);
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByUserIDAndWeek(
      String userID, String week);
  Future<List<QuizGameAPIModel>?> getALlQuizGameByPreGameID(String preID);
  Future<List<QuizGameAPIModel>?> getALlQuizGameByPreGameIDWithPagination(
      String preID, int page);
  Future<List<PreQuizGameAPIModel>?> getALlPreQuizGameByUidandOptionGame(
      String uid, String option);
  Future<PreQuizGameAPIResPagi?> getALlPreQuizGameByUidandOptionGameWithPagi(
      String uid, String option, int page);
  Future<List<PreQuizGameAPIModel>?> getALlPreQuizGameByUidandStatus(
      String uid);
  Future<PreQuizGameAPIModel?> createPreQuizGame(PreQuizGameAPIReq preQuizReq);
  Future<PreQuizGameSenModelRes?> createPreQuizSenGame(
      PreQuizGameSenReq preQuizSenReq);
  Future<bool?> deletePreQuizGame(String id);
  Future<bool?> deletePreQuizSenGame(String id);
  Future<PreTestAPIRes?> createPreQuizTest(PreTestReq preQuizReq);
  Future<PreQuizGameAPIModel?> updatePreQuizGameByID(
      PreQuizGameAPIReq preQuizReq, String preID);
  Future<PreQuizGameSenModelRes?> updatePreQuizSenGameByID(
      PreQuizGameSenReq preQuizSenReq, String preID);
  Future<bool?> updatePreQuizTestByID(PreTestReq preQuizReq, String preID);
  Future<bool?> createQuizGame(QuizGameAPIReq quizReq);
  Future<bool?> createQuizTest(QuizTestReq quizReq);
  Future<List<QuizTestAPIRes>?> getALlQuizTestByPreTestID(String preID);
  Future<List<QuizTestAPIRes>?> getALlQuizTestByPreTestIDWithPagi(
      String preID, int page);
  Future<List<SentencesQuizRes>?> getRandomeListQuiz();
  Future<List<PreTestAPIRes>?> getALlPreQuizTestByUid(String uid);
  Future<PreTestAPIResPagi?> getALlPreQuizTestByUidWithPagi(String uid,int page);
  Future<bool?> deleteTestingNotDoByPreTestId(String preID);
}
