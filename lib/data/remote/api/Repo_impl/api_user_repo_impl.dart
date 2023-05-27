import 'dart:convert';
import 'dart:io';

import 'package:math/data/remote/model/pre_quiz_hw_res.dart';

import '../../../../application/cons/endpoint.dart';
import '../../../../application/di/event_local.dart';
import '../../model/pre_quiz_hw_response.dart';
import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

import '../Repo/api_user_repo.dart';

class UserAPIRepoImpl extends UserAPIRepo {
  @override
  Future<UserModel?> getUserByEmailAndPass(String email, String pass) async {
    try {
      final url =
          "${endpoint}getUserByEmailAndPassword?email=$email&password=$pass";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserRes.fromJson(parsed).lItems!.first;
        UserEventLocal.updateUserGlobal(userModel);
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserRes.fromJson(parsed).lItems!.first;
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
  Future<UserModel?> submitEmailForGetOTPForgetPass(String email) async {
    try {
      final url = "${endpoint}forgetPassWordAndGetOTP?email=$email";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserRes.fromJson(parsed).lItems!.first;
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserRes.fromJson(parsed).lItems!.first;
        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<UserModel?> reSendOTPMAIL(String email) async {
    try {
      final url = "${endpoint}forgetPassWordAndGetOTP?email=$email";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserRes.fromJson(parsed).lItems!.first;
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserRes.fromJson(parsed).lItems!.first;
        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<UserModel?> checkOTPCode(String email, String otp) async {
    try {
      final url = "${endpoint}checkOTPCode?email=$email&otp=$otp";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserRes.fromJson(parsed).lItems!.first;
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserRes.fromJson(parsed).lItems!.first;
        return userModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> updatePasswordUser(String email, UserModel user) async {
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
  Future<bool?> updateProfileUser(String keyId, UserModel user) async {
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
  Future<UserModel?> getUserByID(String id) async {
    try {
      final url = "${endpoint}getUserById?uId=$id";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserModel.fromJson(parsed);
        UserEventLocal.updateUserGlobal(userModel);
        return userModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserModel.fromJson(parsed);
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
  Future<PreQuizHW?> getPreQuizHWByWeek(String week) async {
    try {
      final url = "${endpoint}getPreQuizByWeak?weak=$week";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final preQuizModel = PreQuizHWRes.fromJson(parsed).lItems!.first;
        return preQuizModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final preQuizModel = PreQuizHWRes.fromJson(parsed).lItems!.first;
        return preQuizModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }
}
