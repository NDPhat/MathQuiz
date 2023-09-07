import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:math/data/remote/model/quiz_test_req.dart';
import 'package:math/data/remote/model/quiz_test_res.dart';

import '../../../../application/cons/endpoint.dart';
import '../../model/quiz_test_res_pagi.dart';
import '../Repo/quiz_test_repo.dart';

class QuizTestRepoImpl extends QuizTestRepo {
  @override
  Future<bool?> createQuizTest(QuizTestAPIReq quizReq) async {
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
  Future<List<QuizTestAPIModel>?> getALlQuizTestByPreTestID(
      String preID) async {
    try {
      final url = "${endpoint}getAllQuizTestByPreID?preID=$preID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizTestAPIModel>? result = QuizTestAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizTestAPIModel>? result = QuizTestAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<QuizTestAPIModel>?> getALlQuizTestByPreTestIDWithPagi(
      String preID, int page) async {
    // TODO: implement getALlQuizTestByPreTestIDWithPagi
    try {
      final url =
          "${endpoint}getAllQuizTestByPreIDWithPagination?preID=$preID&page_num=$page&page_size=10";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizTestAPIModel>? result =
            QuizTestAPIResPagi.fromJson(parsed).data;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizTestAPIModel>? result =
            QuizTestAPIResPagi.fromJson(parsed).data;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }
}
