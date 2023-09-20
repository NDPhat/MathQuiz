import 'dart:convert';
import 'dart:io';
import 'package:math/data/remote/api/Repo/pre_pra_repo.dart';
import 'package:math/data/remote/model/pre_pra_req.dart';
import 'package:math/data/remote/model/pre_pra_res.dart';
import 'package:math/data/remote/model/pre_pra_res_pagi.dart';
import 'package:http/http.dart' as http;
import '../../../../application/cons/endpoint.dart';

class PrePraRepoImpl extends PrePraRepo {
  @override
  Future<PrePraAPIModel?> createPreQuizGame(PrePraAPIReq preQuizReq) async {
    try {
      const url = "${endpoint}create_prequiz_game";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizReq.toJson()));
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        PrePraAPIModel? result = PrePraAPIRes.fromJson(parsed).lItems!.first;
        return result;
      } else {
        return null;
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
  Future<List<PrePraAPIModel>?> getALlPreQuizGameByUidandOptionGame(
      String uid, String option) async {
    try {
      final url =
          "${endpoint}getAllPreQuizGameByUIdAndOptionGame?uid=$uid&optionGame=$option";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PrePraAPIModel>? result = PrePraAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);

        // log(req.body);
        List<PrePraAPIModel>? result = PrePraAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<PrePraAPIResPagi?> getALlPreQuizGameByUidandOptionGameWithPagi(
      String uid, String option, int page) async {
    try {
      final url =
          "${endpoint}getAllPreQuizGameByUIdAndOptionGameWithPage?uid=$uid&optionGame=$option&page_num=$page&page_size=5";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        PrePraAPIResPagi? result = PrePraAPIResPagi.fromJson(parsed);
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);
        PrePraAPIResPagi? result = PrePraAPIResPagi.fromJson(parsed);
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<PrePraAPIModel>?> getALlPreQuizGameByUidandStatus(
      String uid) async {
    try {
      final url = "${endpoint}getAllPreQuizGameByUIdAndStatus?uid=$uid";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PrePraAPIModel>? result = PrePraAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);

        // log(req.body);
        List<PrePraAPIModel>? result = PrePraAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<PrePraAPIModel?> updatePreQuizGameByID(
      PrePraAPIReq preQuizReq, String preID) async {
    try {
      final url = "${endpoint}updatePreQuizGameById?id=$preID";
      final req = await http.patch(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizReq.toJson()));
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        PrePraAPIModel? result = PrePraAPIModel.fromJson(parsed);
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);
        PrePraAPIModel? result = PrePraAPIModel.fromJson(parsed);
        return result;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<PrePraAPIModel?> getPreQuizGameByUidOnGoing(String uid) async {
    try {
      final url = "${endpoint}getPreQuizGameByUidOnGoing?uid=$uid";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PrePraAPIModel>? result = PrePraAPIRes.fromJson(parsed).lItems;
        int length = PrePraAPIRes.fromJson(parsed).iCount!;
        if (length != 0 && result!.isNotEmpty) {
          return result.first;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> deletePreQuizGameErrorServer(String uId) async {
    try {
      final url = "${endpoint}deletePreGameByUIdAndDoing?userID=$uId";
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
  Future<bool?> deleteAllPreQuizGameByUidAndType(
      String uId, String type) async {
    try {
      final url =
          "${endpoint}deleteAllPreQuizGameByUIDAndOptionGame?userID=$uId&option=$type";
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
  Future<bool?> deleteAllPreQuizGameLowScoreByUidAndType(
      String uId, String type) async {
    try {
      final url =
          "${endpoint}deleteAllPreQuizGameLowScoreByUIDAndOptionGame?userID=$uId&option=$type";
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
