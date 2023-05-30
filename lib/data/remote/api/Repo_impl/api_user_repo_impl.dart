import 'dart:convert';
import 'dart:io';

import 'package:math/data/remote/model/result_quiz_hw_req.dart';
import 'package:math/data/remote/model/result_quiz_hw_response.dart';
import 'package:math/data/remote/model/user_api_res.dart';

import '../../../../application/cons/endpoint.dart';
import '../../../../application/di/event_local.dart';
import '../../model/detail_quiz_hw_response.dart';
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
      final url = "${endpoint}getAllReultQuizHWByUId?userID=$uid";
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
  Future<PreQuizHWResAPIModel?> getLatestPreQuizHW() async {
    try {
      const url = "${endpoint}getLatestPreQuizHW";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      Map<String, dynamic> parsed = json.decode(req.body);
      PreQuizHWResAPIModel? result =
          PreQuizHWAPIResponse.fromJson(parsed).lItems!.first;
      return result;
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool?> saveQuizDetailHW(DetailQuizHWAPIModel model) async {
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
  Future<List<DetailQuizHWAPIModel>?> getALlQuizDetailByResultID(String resultID) async {
    try {
      final url = "${endpoint}getAllQuizHWByResultID?resultID=$resultID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<DetailQuizHWAPIModel>?result =
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
}
