import 'dart:convert' show utf8;
import 'dart:convert';
import 'dart:io';
import 'package:math/data/remote/model/user_res.dart';
import '../../../../application/cons/endpoint.dart';
import '../../../../application/di/event_local.dart';
import 'package:http/http.dart' as http;
import '../../model/user_req.dart';
import '../Repo/user_repo.dart';

class UserRepoImpl extends UserRepo {
  @override
  Future<UserAPIModel?> getUserByEmailAndPass(String email, String pass) async {
    try {
      final url =
          "${endpoint}getUserByEmailAndPassword?email=$email&password=$pass";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final userModel = UserAPIRes.fromJson(parsed).lItems!.first;
        if (userModel.role == "user") {
          UserEventLocal.updateUserGlobal(userModel);
          return userModel;
        } else {
          return null;
        }
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
  Future<bool?> updateProfileUser(String keyId, UserAPIReq user) async {
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
}
