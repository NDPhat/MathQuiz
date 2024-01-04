import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:math/data/remote/api/Repo/result_hw_repo.dart';
import 'package:math/data/remote/model/pre_hw_res.dart';
import 'package:math/data/remote/model/result_hw_req.dart';
import 'package:math/data/remote/model/result_hw_res.dart';
import 'package:math/data/remote/model/result_hw_res_pagi.dart';
import '../../../../application/cons/endpoint.dart';

class ResultHWRepoImpl extends ResultHWRepo {
  @override
  Future<ResultHWAPIModel?> createResultHomeWorkWeek(
      ResultHWAPIReq resultQuizHWReq) async {
    try {
      const url = "${endpoint}create_result_quiz";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(resultQuizHWReq.toJson()));
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        ResultHWAPIModel? result =
            ResultHWAPIRes.fromJson(parsed).lItems!.first;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        ResultHWAPIModel? result =
            ResultHWAPIRes.fromJson(parsed).lItems!.first;
        return result;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool?> deleteResultHWNotDo(String resultID) async {
    try {
      final url = "${endpoint}deleteResultQHWResultId?resultID=$resultID";
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
  Future<List<PreHWAPIModel>?> getALlPreQuizHW() async {
    try {
      const url = "${endpoint}getAllPreQuizHW";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreHWAPIModel>? result = PreHWAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<PreHWAPIModel>? result = PreHWAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<ResultHWAPIModel>?> getALlResultQuizHWByUserID(String uid) async {
    try {
      final url = "${endpoint}getAllResultQuizHWByUId?userID=$uid";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<ResultHWAPIModel>? result = ResultHWAPIRes.fromJson(parsed).lItems;
        List<ResultHWAPIModel>? data = [];
        result!.forEach((element) {
          if(element.numQ == 11){
            data.add(element);
          }
        });
        return data;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<ResultHWAPIModel>? result = ResultHWAPIRes.fromJson(parsed).lItems;
        List<ResultHWAPIModel>? data = [];
        result!.forEach((element) {
          if(element.numQ == 11){
            data.add(element);
          }
        });
        return data;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<ResultHWAPIResPagi?> getALlResultQuizHWByUserIDWithPagi(
      String uid, int page) async {
    // TODO: implement getALlResultQuizHWByUserIDWithPagi
    try {
      final url =
          "${endpoint}getAllResultQuizHWByUIdWithPagi?userID=$uid&page_num=$page&page_size=5";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        ResultHWAPIResPagi? result = ResultHWAPIResPagi.fromJson(parsed);
        return result;
      } else {
        Map<String, dynamic> parsed = json.decode(req.body);
        ResultHWAPIResPagi? result = ResultHWAPIResPagi.fromJson(parsed);
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<PreHWAPIModel?> getOnGoingPreHWandNotDO(String uid, String lop) async {
    try {
      final url = "${endpoint}getPreWStatusOnGoingByClass?lop=$lop";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      Map<String, dynamic> parsed = json.decode(req.body);
      PreHWAPIModel? result = PreHWAPIRes.fromJson(parsed).lItems!.first;
      ResultHWAPIModel? data =
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
  Future<PreHWAPIModel?> getPreQuizHWByWeek(String week, String lop) async {
    try {
      final url = "${endpoint}getPreQuizHWByWeekAndClass?week=$week&lop=$lop";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final preQuizModel = PreHWAPIRes.fromJson(parsed).lItems!.first;
        return preQuizModel;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final preQuizModel = PreHWAPIRes.fromJson(parsed).lItems!.first;
        return preQuizModel;
      }
    } on SocketException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<ResultHWAPIModel?> getResultQuizHWByUserIDAndWeek(
      String uid, String week) async {
    try {
      final url =
          "${endpoint}getResultQuizHWByUIdAndWeek?userID=$uid&week=$week";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        int count = ResultHWAPIRes.fromJson(parsed).iCount!;
        if (count == 0) {
          return null;
        } else {
          return ResultHWAPIRes.fromJson(parsed).lItems!.first;
        }
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        ResultHWAPIModel? result = ResultHWAPIModel.fromJson(parsed);
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<bool?> updateInfoHomeWorkWeek(
      ResultHWAPIReq resultQuizHWReq, String resultID) async {
    try {
      final url = "${endpoint}updateResultQuizHWById?id=$resultID";
      final req = await http.patch(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(resultQuizHWReq.toJson()));
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
}
