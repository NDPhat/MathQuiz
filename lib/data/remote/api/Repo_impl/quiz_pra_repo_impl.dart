import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:math/data/remote/model/quiz_pra_req.dart';
import 'package:math/data/remote/model/quiz_pra_res.dart';
import '../../../../application/cons/endpoint.dart';
import '../../model/quiz_pra_res_pagi.dart';
import '../Repo/quiz_pra_repo.dart';

class QuizPraRepoImpl extends QuizPraRepo {
  @override
  Future<bool?> createQuizGame(QuizPraAPIReq quizReq) async {
    try {
      const url = "${endpoint}create_quiz_game";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(quizReq.toJson()));
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
  Future<List<QuizPraAPIModel>?> getALlQuizGameByPreGameID(String preID) async {
    try {
      final url = "${endpoint}getAllQuizGameByPreID?preID=$preID";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizPraAPIModel>? result = QuizPraAPIRes.fromJson(parsed).lItems;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizPraAPIModel>? result = QuizPraAPIRes.fromJson(parsed).lItems;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }

  @override
  Future<List<QuizPraAPIModel>?> getALlQuizGameByPreGameIDWithPagination(
      String preID, int page) async {
    try {
      final url =
          "${endpoint}getAllQuizGameByPreIDWithPagination?preID=$preID&page_num=$page&page_size=10";
      final req = await http.get(Uri.parse(url), headers: requestHeaders);
      if (req.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizPraAPIModel>? result = QuizPraAPIResPagi.fromJson(parsed).data;
        return result;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(req.body);
        List<QuizPraAPIModel>? result = QuizPraAPIResPagi.fromJson(parsed).data;
        return result;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occurred');
    }
  }
}
