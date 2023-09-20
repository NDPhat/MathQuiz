import '../../model/pre_hw_res.dart';
import '../../model/result_hw_req.dart';
import '../../model/result_hw_res.dart';
import '../../model/result_hw_res_pagi.dart';

abstract class ResultHWRepo {
  Future<PreHWAPIModel?> getPreQuizHWByWeek(String week,String lop);
  Future<ResultHWAPIModel?> createResultHomeWorkWeek(
      ResultHWAPIReq resultQuizHWReq);
  Future<bool?> updateInfoHomeWorkWeek(
      ResultHWAPIReq resultQuizHWReq, String resultID);
  Future<bool?> deleteResultHWNotDo(String resultID);
  Future<List<ResultHWAPIModel>?> getALlResultQuizHWByUserID(String uid);
  Future<ResultHWAPIResPagi?> getALlResultQuizHWByUserIDWithPagi(
      String uid, int page);
  Future<ResultHWAPIModel?> getResultQuizHWByUserIDAndWeek(
      String uid, String week);
  Future<List<PreHWAPIModel>?> getALlPreQuizHW();
  Future<PreHWAPIModel?> getOnGoingPreHWandNotDO(String uid,String lop);
}
