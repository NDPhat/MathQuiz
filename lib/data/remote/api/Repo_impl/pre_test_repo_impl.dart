import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/data/remote/model/pre_test_res_pagi.dart';
import '../../../../application/cons/endpoint.dart';
import '../Repo/pre_test_repo.dart';

class PreTestRepoImpl extends PreTestRepo {
  @override
  @override
  Future<PreTestAPIModel?> createPreQuizTest(PreTestAPIModel preQuizReq) async {
    try {
      const url = "${endpoint}create_prequiz_test";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizReq.toJson()));
      Map<String, dynamic> parsed = json.decode(req.body);
      PreTestAPIModel? result = PreTestAPIRes.fromJson(parsed).lItems!.first;
      return result;
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> deleteTestingNotDoByPreTestId(String preID) async {
    try {
      final url = "${endpoint}deletePreTestByID?id=$preID";
      final req = await http.delete(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<PreTestAPIModel>?> getALlPreQuizTestByUid(String uid) async {
    try {
      final url = "${endpoint}getAllPreQuizTestByUId?uid=$uid";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreTestAPIModel>? result = PreTestAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreTestAPIModel>? result = PreTestAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<PreTestAPIResPagi?> getALlPreQuizTestByUidWithPagi(
      String uid, int page) async {
    try {
      final url =
          "${endpoint}getAllPreQuizTestByUIdWithPagi?uid=$uid&page_num=$page&page_size=5";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        PreTestAPIResPagi? result = PreTestAPIResPagi.fromJson(parsed);
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);
        PreTestAPIResPagi? result = PreTestAPIResPagi.fromJson(parsed);
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> updatePreQuizTestByID(
      PreTestAPIModel preQuizReq, String preID) async {
    try {
      final url = "${endpoint}updatePreQuizTesteById?id=$preID";
      final req = await http.patch(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizReq.toJson()));
      if (req.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool?> deletePreTestById(String preID) async {
    try {
      final url = "${endpoint}deletePreTestByID?id=$preID";
      final req = await http.delete(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool?> deleteAllPreTestByUid(String uid) async {
    try {
      final url = "${endpoint}deleteAllPreTestByUID?userID=$uid";
      final req = await http.delete(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool?> deleteAllPreTestLowScoreByuId(String uId) async {
    try {
      final url = "${endpoint}deleteAllPreTestLowScoreByUID?userID=$uId";
      final req = await http.delete(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }
}
