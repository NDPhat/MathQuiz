import '../../model/pre_pra_req.dart';
import '../../model/pre_pra_res.dart';
import '../../model/pre_pra_res_pagi.dart';

abstract class PrePraRepo {
  Future<PrePraAPIModel?> createPreQuizGame(PrePraAPIReq preQuizReq);
  Future<bool?> deletePreQuizGame(String id);
  Future<bool?> deletePreQuizGameErrorServer(String uId);
  Future<PrePraAPIModel?> updatePreQuizGameByID(
      PrePraAPIReq preQuizReq, String preID);
  Future<List<PrePraAPIModel>?> getALlPreQuizGameByUidandOptionGame(
      String uid, String option);
  Future<PrePraAPIResPagi?> getALlPreQuizGameByUidandOptionGameWithPagi(
      String uid, String option, int page);
  Future<List<PrePraAPIModel>?> getALlPreQuizGameByUidandStatus(String uid);
  Future<PrePraAPIModel?> getPreQuizGameByUidOnGoing(String uid);
}
