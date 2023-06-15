import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:math/data/remote/model/pre_quiz_game_response.dart';
import 'package:math/data/remote/model/pre_test_req.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/data/remote/model/quiz_game_req.dart';
import 'package:math/data/remote/model/quiz_game_response.dart';
import 'package:math/data/remote/model/quiz_test_req.dart';
import 'package:math/data/remote/model/quiz_test_res.dart';
import 'package:math/data/remote/model/result_quiz_hw_req.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import 'package:math/data/remote/model/user_api_res.dart';

import '../../../../application/cons/endpoint.dart';
import '../../../../application/di/event_local.dart';
import '../../model/detail_quiz_hw_req.dart';
import '../../model/detail_quiz_hw_response.dart';
import '../../model/pre_quiz_game_req.dart';
import '../../model/pre_quiz_hw_response.dart';

import 'package:http/http.dart' as http;

import '../Repo/api_user_repo.dart';

class UserAPIRepoImpl extends UserAPIRepo {
  @override
  Future<UserAPIModel?> getUserByEmailAndPass(String email, String pass) async {
    try {
      final url =
          "${endpoint}getUserByEmailAndPassword?email=$email&password=$pass";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        if (userModel!.role == "user") {
          UserEventLocal.updateUserGlobal(userModel);
          return userModel;
        } else {
          return null;
        }
        UserEventLocal.updateUserGlobal(userModel);
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        UserEventLocal.updateUserGlobal(userModel);

        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<UserAPIModel?> submitEmailForGetOTPForgetPass(String email) async {
    try {
      final url = "${endpoint}forgetPassWordAndGetOTP?email=$email";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<UserAPIModel?> reSendOTPMAIL(String email) async {
    try {
      final url = "${endpoint}forgetPassWordAndGetOTP?email=$email";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<UserAPIModel?> checkOTPCode(String email, String otp) async {
    try {
      final url = "${endpoint}checkOTPCode?email=$email&otp=$otp";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> updatePasswordUser(String email, UserAPIModel user) async {
    try {
      final url = "${endpoint}updateUserByEmail?email=$email";
      final res = await http.patch(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(user.toJson()));

      if (res.statusCode == 200) {
        return true;
      } else {
        // log(req.body);
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool?> updateProfileUser(String keyId, UserAPIModel user) async {
    try {
      final url = "${endpoint}updateUserById?id=$keyId";
      final res = await http.patch(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(user.toJson()));
      if (res.statusCode == 200) {
        return true;
      } else {
        // log(req.body);
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<UserAPIModel?> getUserByID(String id) async {
    try {
      final url = "${endpoint}getUserById?uId=$id";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIModel.fromJson(parsed);
        UserEventLocal.updateUserGlobal(userModel);
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIModel.fromJson(parsed);
        UserEventLocal.updateUserGlobal(userModel);

        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<PreQuizHWResAPIModel?> getPreQuizHWByWeek(String week) async {
    try {
      final url = "${endpoint}getPreQuizHWByWeek?week=$week";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final preQuizModel =
            PreQuizHWAPIResponse.fromJson(parsed).lItems!.first;
        return preQuizModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final preQuizModel =
            PreQuizHWAPIResponse.fromJson(parsed).lItems!.first;
        return preQuizModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool?> updateInfoHomeWorkWeek(
      ResultQuizHWAPIReq requestBody, String resultID) async {
    try {
      final url = "${endpoint}updateResultQuizHWById?id=$resultID";
      final req = await http.patch(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(requestBody.toJson()));
      if (req.statusCode == 200) {
        return true;
      } else {
        // log(req.body);
        return false;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<ResultQuizHWAPIModel>?> getALlResultQuizHWByUserID(
      String uid) async {
    try {
      final url = "${endpoint}getAllResultQuizHWByUId?userID=$uid";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<ResultQuizHWAPIModel>? result =
            ResultQuizHWAPIResponse.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<ResultQuizHWAPIModel>? result =
            ResultQuizHWAPIResponse.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<PreQuizHWResAPIModel>?> getALlPreQuizHW() async {
    try {
      const url = "${endpoint}getAllPreQuizHW";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreQuizHWResAPIModel>? result =
            PreQuizHWAPIResponse.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreQuizHWResAPIModel>? result =
            PreQuizHWAPIResponse.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<PreQuizHWResAPIModel?> getOnGoingPreHWandNotDO(String uid) async {
    try {
      const url = "${endpoint}getPreWStatusOnGoing";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      Map<String, dynamic> parsed = json.decode(req.body);
      PreQuizHWResAPIModel? result =
          PreQuizHWAPIResponse.fromJson(parsed).lItems!.first;
      ResultQuizHWAPIModel? data =
          await getResultQuizHWByUserIDAndWeek(uid, result.week!);
      if (data == null) {
        return result;
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool?> saveQuizDetailHW(DetailQuizHWAPIReq model) async {
    try {
      const url = "${endpoint}create_quiz_detail";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(model.toJson()));
      if (req.statusCode == 200) {
        return true;
      } else {
        // log(req.body);
        return false;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<ResultQuizHWAPIModel?> createResultHomeWorkWeek(
      ResultQuizHWAPIReq resultQuizHWReq) async {
    try {
      const url = "${endpoint}create_result_quiz";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(resultQuizHWReq.toJson()));
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        ResultQuizHWAPIModel? result =
            ResultQuizHWAPIResponse.fromJson(parsed).lItems!.first;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        ResultQuizHWAPIModel? result =
            ResultQuizHWAPIResponse.fromJson(parsed).lItems!.first;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByResultID(
      String resultID) async {
    try {
      final url = "${endpoint}getAllQuizHWByResultID?resultID=$resultID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<DetailQuizHWAPIModel>? result =
            DetailQuizHWAPIResponse.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<DetailQuizHWAPIModel>? result =
            DetailQuizHWAPIResponse.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByUserIDAndWeek(
      String userID, String week) async {
    try {
      final url = "${endpoint}getAllResultQuizHWByUId?userID=$userID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<ResultQuizHWAPIModel>? result =
            ResultQuizHWAPIResponse.fromJson(parsed).lItems;
        String? resultID;
        List<DetailQuizHWAPIModel>? listDetailQuiz;
        result?.forEach((element) {
          if (element.week == week) {
            resultID = element!.key;
          }
        });
        listDetailQuiz = await getALlQuizDetailByResultID(resultID!);
        return listDetailQuiz;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<ResultQuizHWAPIModel>? result =
            ResultQuizHWAPIResponse.fromJson(parsed).lItems;
        List<String> resultID = [];
        List<DetailQuizHWAPIModel>? listDetailQuiz;
        result?.forEach((element) {
          resultID.add(element!.key.toString());
        });
        for (String element in resultID) {
          List<DetailQuizHWAPIModel>? newList =
              await getALlQuizDetailByResultID(element);
          listDetailQuiz!.addAll(newList!);
        }
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<PreQuizGameAPIModel?> createPreQuizGame(
      PreQuizGameAPIReq preQuizReq) async {
    try {
      const url = "${endpoint}create_prequiz_game";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizReq.toJson()));
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        PreQuizGameAPIModel? result =
            PreQuizGameAPIResponse.fromJson(parsed).lItems!.first;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> createQuizGame(QuizGameAPIReq quizReq) async {
    try {
      const url = "${endpoint}create_quiz_game";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(quizReq.toJson()));
      if (req.statusCode == 200) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<PreQuizGameAPIModel?> updatePreQuizGameByID(
      PreQuizGameAPIReq preQuizReq, String preID) async {
    try {
      final url = "${endpoint}updatePreQuizGameById?id=$preID";
      final req = await http.patch(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizReq.toJson()));
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        PreQuizGameAPIModel? result = PreQuizGameAPIModel.fromJson(parsed);
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);
        PreQuizGameAPIModel? result = PreQuizGameAPIModel.fromJson(parsed);
        return result;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<UserAPIModel?> getUserByEmail(String email) async {
    try {
      final url = "${endpoint}getUserByEmail?email=$email";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        UserEventLocal.updateUserGlobal(userModel);
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        UserEventLocal.updateUserGlobal(userModel);

        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<QuizGameAPIModel>?> getALlQuizGameByPreGameID(
      String preID) async {
    try {
      final url = "${endpoint}getAllQuizGameByPreID?preID=$preID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizGameAPIModel>? result =
            QuizGameAPIResponse.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizGameAPIModel>? result =
            QuizGameAPIResponse.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<PreQuizGameAPIModel>?> getALlPreQuizGameByUidandOptionGame(
      String uid, String option) async {
    try {
      final url =
          "${endpoint}getAllPreQuizGameByUIdAndOptionGame?uid=$uid&optionGame=$option";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreQuizGameAPIModel>? result =
            PreQuizGameAPIResponse.fromJson(parsed).lItems;
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);

        // log(req.body);
        List<PreQuizGameAPIModel>? result =
            PreQuizGameAPIResponse.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<PreTestAPIRes?> createPreQuizTest(PreTestReq preQuizReq) async {
    try {
      const url = "${endpoint}create_prequiz_test";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizReq.toJson()));
      Map<String, dynamic> parsed = json.decode(req.body);
      PreTestAPIRes? result = GetPreTestAPIRes.fromJson(parsed).lItems!.first;
      return result;
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> createQuizTest(QuizTestReq quizReq) async {
    try {
      const url = "${endpoint}create_quiz_test";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(quizReq.toJson()));
      if (req.statusCode == 200) {
        return true;
      } else {
        // log(req.body);
        return false;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> updatePreQuizTestByID(
      PreTestReq preQuizReq, String preID) async {
    try {
      final url = "${endpoint}updatePreQuizTesteById?id=$preID";
      final req = await http.patch(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizReq.toJson()));
      if (req.statusCode == 200) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<PreTestAPIRes>?> getALlPreQuizTestByUid(String uid) async {
    try {
      final url = "${endpoint}getAllPreQuizTestByUId?uid=$uid";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreTestAPIRes>? result = GetPreTestAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreTestAPIRes>? result = GetPreTestAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<QuizTestAPIRes>?> getALlQuizTestByPreTestID(String preID) async {
    try {
      final url = "${endpoint}getAllQuizTestByPreID?preID=$preID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizTestAPIRes>? result =
            GetQuizTestAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizTestAPIRes>? result =
            GetQuizTestAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> deleteResultHWNotDo(String resultID) async {
    try {
      final url = "${endpoint}deleteResultQHWResultId?resultID=$resultID";
      final req = await http.delete(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool?> deleteTestingNotDoByPreTestId(String preID) async {
    try {
      final url = "${endpoint}deletePreTestByID?id=$preID";
      final req = await http.delete(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<ResultQuizHWAPIModel?> getResultQuizHWByUserIDAndWeek(
      String uid, String week) async {
    try {
      final url =
          "${endpoint}getResultQuizHWByUIdAndWeek?userID=$uid&week=$week";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        int count = ResultQuizHWAPIResponse.fromJson(parsed).iCount!;
        if (count == 0) {
          return null;
        } else {
          return ResultQuizHWAPIResponse.fromJson(parsed).lItems!.first;
        }
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        ResultQuizHWAPIModel? result = ResultQuizHWAPIModel.fromJson(parsed);
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> deletePreQuizGame(String id) async {
    try {
      final url = "${endpoint}deletePreGameByID?id=$id";
      final req = await http.delete(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<PreQuizGameAPIModel>?> getALlPreQuizGameByUidandStatus(
      String uid) async {
    try {
      final url = "${endpoint}getAllPreQuizGameByUIdAndStatus?uid=$uid";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreQuizGameAPIModel>? result =
            PreQuizGameAPIResponse.fromJson(parsed).lItems;
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);

        // log(req.body);
        List<PreQuizGameAPIModel>? result =
            PreQuizGameAPIResponse.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }
}
