import 'package:math/data/remote/model/pre_quiz_hw_request.dart';
import 'package:math/data/remote/model/user_model.dart';

import '../../model/pre_quiz_hw_response.dart';

abstract class TeacherLocalAPIRepo{
  Future<bool> createPreQuizForHW(PreQuizHWRequest preQuizHWRequest);
  Future<PreQuizHWResponse> getPreQuizForHW(String weak);
}