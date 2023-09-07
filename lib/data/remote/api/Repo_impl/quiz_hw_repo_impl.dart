import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:math/data/remote/model/quiz_hw_req.dart';
import 'package:math/data/remote/model/quiz_hw_res.dart';
import 'package:math/data/remote/model/result_hw_res.dart';

import '../../../../application/cons/endpoint.dart';
import '../Repo/quiz_hw_repo.dart';

class QuizHWRepoImpl extends QuizHWRepo {
  @override
  Future<List<QuizHWAPIModel>?> getALlQuizDetailByResultID(
      String resultID) async {
    try {
      final url = "${endpoint}getAllQuizHWByResultID?resultID=$resultID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizHWAPIModel>? result = QuizHWAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizHWAPIModel>? result = QuizHWAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<QuizHWAPIModel>?> getALlQuizDetailByUserIDAndWeek(
      String userID, String week) async {
    try {
      final url = "${endpoint}getAllResultQuizHWByUId?userID=$userID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<ResultHWAPIModel>? result = ResultHWAPIRes.fromJson(parsed).lItems;
        String? resultID;
        List<QuizHWAPIModel>? listDetailQuiz;
        result?.forEach((element) {
          if (element.week == week) {
            resultID = element.key;
          }
        });
        listDetailQuiz = await getALlQuizDetailByResultID(resultID!);
        return listDetailQuiz;
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
  Future<bool?> saveQuizDetailHW(QuizHWAPIReq model) async {
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
}
