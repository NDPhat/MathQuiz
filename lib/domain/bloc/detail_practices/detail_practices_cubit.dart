import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/api/Repo/pre_pra_repo.dart';
import '../../../application/utils/func.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/model/pre_pra_res.dart';
import '../../../data/remote/model/pre_pra_res_pagi.dart';
import '../../../main.dart';

part 'detail_practices_state.dart';

class DetailPracticesCubit extends Cubit<DetailPracticesState> {
  final PrePraRepo prePraRepo;
  DetailPracticesCubit({required this.prePraRepo})
      : super(DetailPracticesState.initial());

  Future<void> signChange(List<String> signList, String type) async {
    List<PrePraAPIModel>? newPost = [];
    if (signList.isNotEmpty) {
      String valueSign = signList.reduce((value, element) => '$value,$element');
      newPost = state.posts;
      newPost = newPost!.where((e) => e.sign == valueSign).toList();
      if (newPost.isNotEmpty) {
        emit(state.copyWith(signFilter: signList, posts: newPost));
      } else {
        emit(state.copyWith(signFilter: signList, posts: newPost));
      }
    } else {
      newPost = await getBackList(type);
      emit(state.copyWith(signFilter: signList, posts: newPost));
    }
  }

  Future<void> dayChoose(String type) async {
    bool choose = state.dayChoose;
    List<PrePraAPIModel>? newPost = [];
    List<PrePraAPIModel>? oldPost = [...state.posts!];

    ///FALSE - > TRUE
    if (choose == false) {
      newPost = state.posts;
      newPost!.sort((a, b) => a.dateSave!.compareTo(b.dateSave!));
      emit(state.copyWith(dayChoose: true, posts: newPost, scoreChoose: false));
    }

    /// TRUE -> FALSE
    else {
      if (state.signFilter.isNotEmpty) {
        emit(state.copyWith(
            dayChoose: false, posts: oldPost, scoreChoose: false));
      } else {
        newPost = await getBackList(type);
        emit(state.copyWith(
            dayChoose: false, posts: newPost, scoreChoose: false));
      }
    }
  }

  Future<void> scoreChoose(String type) async {
    bool choose = state.scoreChoose;
    List<PrePraAPIModel>? newPost = [];
    List<PrePraAPIModel>? oldPost = [...state.posts!];

    ///FALSE - > TRUE
    if (choose == false) {
      newPost = state.posts;
      newPost!.sort((a, b) => a.score!.compareTo(b.score!));
      emit(state.copyWith(
          scoreChoose: !choose, posts: newPost, dayChoose: false));
    }

    /// TRUE -> FALSE
    else {
      if (state.signFilter.isNotEmpty) {
        emit(state.copyWith(
            scoreChoose: !choose, posts: oldPost, dayChoose: false));
      } else {
        newPost = await getBackList(type);
        emit(state.copyWith(
            scoreChoose: !choose, posts: newPost, dayChoose: false));
      }
    }
  }

  void deleteALlPrePraByUidAndType(String type) {
    prePraRepo.deleteAllPreQuizGameByUidAndType(
        instance.get<UserGlobal>().id!, type);
  }

  void deleteLowScore(String type) {
    prePraRepo.deleteAllPreQuizGameLowScoreByUidAndType(
        instance.get<UserGlobal>().id!, type);
  }

  Future<void> pagePlus(String type) async {
    if (state.pageNow < findLength((state.lengthNow))) {
      List<PrePraAPIModel>? dataList = [...state.posts!];
      dataList.clear();
      int pageNow = state.pageNow;
      pageNow = pageNow + 1;
      state.pageNow = pageNow;
      dataList = await getMoreData(type);
      emit(state.copyWith(
          pageNow: pageNow,
          posts: dataList,
          dayChoose: false,
          scoreChoose: false,
          signFilter: []));
    }
  }

  Future<void> initPage(String type) async {
    late PrePraAPIResPagi? dataPagination;
    List<PrePraAPIModel>? dataList = [...state.posts!];
    dataPagination =
        await prePraRepo.getALlPreQuizGameByUidandOptionGameWithPagi(
            instance.get<UserGlobal>().id.toString(), type, state.pageNow);
    dataList = dataPagination!.data;
    int length = dataPagination.total!;
    if (dataList!.isNotEmpty) {
      emit(state.copyWith(posts: dataList, pageNow: 1, lengthNow: length));
    }
  }

  Future<List<PrePraAPIModel>?> getBackList(String type) async {
    late PrePraAPIResPagi? dataPagination;
    List<PrePraAPIModel>? dataList = [];
    dataPagination =
        await prePraRepo.getALlPreQuizGameByUidandOptionGameWithPagi(
            instance.get<UserGlobal>().id.toString(), type, state.pageNow);
    dataList = dataPagination!.data;
    if (dataList!.isNotEmpty) {
      return dataList;
    }
    return null;
  }

  Future<List<PrePraAPIModel>?> getMoreData(String type) async {
    late PrePraAPIResPagi? dataPagination;
    List<PrePraAPIModel>? dataList = [...state.posts!];
    dataList.clear();
    dataPagination =
        await prePraRepo.getALlPreQuizGameByUidandOptionGameWithPagi(
            instance.get<UserGlobal>().id.toString(), type, state.pageNow);
    dataList = dataPagination!.data;
    if (dataList!.isNotEmpty) {
      return dataList;
    }
    return null;
  }

  Future<void> pageMinus(String type) async {
    if (state.pageNow != 1) {
      List<PrePraAPIModel>? dataList = [...state.posts!];
      dataList.clear();
      int pageNow = state.pageNow;
      pageNow = pageNow - 1;
      state.pageNow = pageNow;
      dataList = await getMoreData(type);
      emit(state.copyWith(
          pageNow: pageNow,
          posts: dataList,
          dayChoose: false,
          scoreChoose: false,
          signFilter: []));
    }
  }
}
