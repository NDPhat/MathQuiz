part of 'detail_test_cubit.dart';

class DetailTestState extends Equatable {
  int pageNow;
  int lengthNow;
  bool scoreChoose;
  bool dayChoose;
  List<PreTestAPIModel>? posts;
  DetailTestState({
    required this.pageNow,
    required this.scoreChoose,
    required this.dayChoose,
    required this.lengthNow,
    required this.posts,
    //this.user,
  });
  factory DetailTestState.initial() {
    return DetailTestState(
        pageNow: 1,
        scoreChoose: false,
        dayChoose: false,
        posts: [],
        lengthNow: 1);
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [pageNow, scoreChoose, dayChoose, lengthNow, posts];

  DetailTestState copyWith({
    int? pageNow,
    int? lengthNow,
    bool? scoreChoose,
    bool? dayChoose,
    List<PreTestAPIModel>? posts,

    // auth.user? user,
  }) {
    return DetailTestState(
      pageNow: pageNow ?? this.pageNow,
      lengthNow: lengthNow ?? this.lengthNow,
      scoreChoose: scoreChoose ?? this.scoreChoose,
      dayChoose: dayChoose ?? this.dayChoose,
      posts: posts ?? this.posts,
      //user: user ?? this.user,
    );
  }
}
