import 'dart:convert';
import 'dart:io';

import 'package:math/data/remote/api/Repo/api_teacher_repo.dart';
import 'package:math/data/remote/model/pre_quiz_hw_request.dart';
import 'package:http/http.dart' as http;

import '../../../../application/cons/endpoint.dart';
import '../../model/pre_quiz_hw_response.dart';

class TeacherLocalAPIRepoImpl extends TeacherLocalAPIRepo {
  @override
  Future<bool> createPreQuizForHW(PreQuizHWRequest preQuizHWRequest) async {
    try {
      const url = "${endpoint}create_prequiz";
      final req = await http.post(Uri.parse(url),
          headers: requestHeaders, body: jsonEncode(preQuizHWRequest.toJson()));
      if (req.statusCode == 200) {
        return true;
      } else {
        // log(req.body);
        return false;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }

  @override
  Future<PreQuizHWResponse> getPreQuizForHW(String weak) async {
    try {
      final url = "${endpoint}getPreQuizByWeak?weak=$weak";
      final res = await http.get(Uri.parse(url), headers: requestHeaders);
      if (res.statusCode == 200) {
        Map<String, dynamic> parsed = json.decode(res.body);
        final preQuizRes = GetPreQuizHWResponse.fromJson(parsed).lItems!.first;
        // log(addressModel.predictions![1].description.toString());
        return preQuizRes;
      } else {
        // log(req.body);
        Map<String, dynamic> parsed = json.decode(res.body);
        final preQuizRes = GetPreQuizHWResponse.fromJson(parsed).lItems!.first;
        return preQuizRes;
      }
    } on SocketException catch (_) {
      return Future.error('No network found');
    } catch (_) {
      return Future.error('Something occured');
    }
  }
}
