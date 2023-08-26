import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/data/remote/model/pre_test_res.dart';
import 'package:math/data/remote/model/pre_test_res_pagi.dart';
import '../../../application/utils/func.dart';
import '../../../data/model/user_global.dart';
import '../../../data/remote/api/Repo/api_user_repo.dart';
import '../../../main.dart';

part 'detail_test_state.dart';

class DetailTestCubit extends Cubit<DetailTestState> {
  final UserAPIRepo userAPIRepo;
  DetailTestCubit({required this.userAPIRepo})
      : super(DetailTestState.initial());

  Future<void> dayChoose() async {
    bool choose = state.dayChoose;
    List<PreTestAPIRes>? newPost = [];

    ///FALSE - > TRUE
    if (choose == false) {
      newPost = state.posts;
      newPost!.sort((a, b) => a.dateSave!.compareTo(b.dateSave!));
      emit(state.copyWith(dayChoose: true, posts: newPost, scoreChoose: false));
    }

    /// TRUE -> FALSE
    else {
      newPost = await getBackList();
      emit(
          state.copyWith(dayChoose: false, posts: newPost, scoreChoose: false));
    }
  }

  Future<void> scoreChoose() async {
    bool choose = state.scoreChoose;
    List<PreTestAPIRes>? newPost = [];

    ///FALSE - > TRUE
    if (choose == false) {
      newPost = state.posts;
      newPost!.sort((a, b) => a.score!.compareTo(b.score!));
      emit(state.copyWith(
          scoreChoose: !choose, posts: newPost, dayChoose: false));
    }

    /// TRUE -> FALSE
    else {
      newPost = await getBackList();
      emit(state.copyWith(
          scoreChoose: !choose, posts: newPost, dayChoose: false));
    }
  }

  Future<void> pagePlus() async {
    if (state.pageNow < findLength((state.lengthNow))) {
      List<PreTestAPIRes>? dataList = [...state.posts!];
      dataList.clear();
      int pageNow = state.pageNow;
      pageNow = pageNow + 1;
      state.pageNow = pageNow;
      dataList = await getMoreData();
      emit(state.copyWith(
        pageNow: pageNow,
        posts: dataList,
        dayChoose: false,
        scoreChoose: false,
      ));
    }
  }

  Future<void> initPage() async {
    late PreTestAPIResPagi? dataPagination;
    List<PreTestAPIRes>? dataList = [...state.posts!];
    dataPagination = await instance
        .get<UserAPIRepo>()
        .getALlPreQuizTestByUidWithPagi(
            instance.get<UserGlobal>().id.toString(), state.pageNow);
    dataList = dataPagination!.data;
    int length = dataPagination.total!;
    if (dataList!.isNotEmpty) {
      emit(state.copyWith(posts: dataList, pageNow: 1, lengthNow: length));
    }
  }

  Future<List<PreTestAPIRes>?> getBackList() async {
    late PreTestAPIResPagi? dataPagination;
    List<PreTestAPIRes>? dataList = [];
    dataPagination = await instance
        .get<UserAPIRepo>()
        .getALlPreQuizTestByUidWithPagi(
            instance.get<UserGlobal>().id.toString(), state.pageNow);
    dataList = dataPagination!.data;
    if (dataList!.isNotEmpty) {
      return dataList;
    }
    return null;
  }

  Future<List<PreTestAPIRes>?> getMoreData() async {
    late PreTestAPIResPagi? dataPagination;
    List<PreTestAPIRes>? dataList = [...state.posts!];
    dataList.clear();
    dataPagination = await instance
        .get<UserAPIRepo>()
        .getALlPreQuizTestByUidWithPagi(
            instance.get<UserGlobal>().id.toString(), state.pageNow);
    dataList = dataPagination!.data;
    if (dataList!.isNotEmpty) {
      return dataList;
    }
    return null;
  }

  Future<void> pageMinus() async {
    if (state.pageNow != 1) {
      List<PreTestAPIRes>? dataList = [...state.posts!];
      dataList.clear();
      int pageNow = state.pageNow;
      pageNow = pageNow - 1;
      state.pageNow = pageNow;
      dataList = await getMoreData();
      emit(state.copyWith(
        pageNow: pageNow,
        posts: dataList,
        dayChoose: false,
        scoreChoose: false,
      ));
    }
  }
}
