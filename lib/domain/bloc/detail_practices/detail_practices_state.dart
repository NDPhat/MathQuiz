part of 'detail_practices_cubit.dart';

class DetailPracticesState extends Equatable {
  int pageNow;
  int lengthNow;
  bool scoreChoose;
  bool dayChoose;
  List<String> signFilter;
  List<PrePraAPIModel>? posts;
  DetailPracticesState({
    required this.pageNow,
    required this.scoreChoose,
    required this.dayChoose,
    required this.signFilter,
    required this.lengthNow,
    required this.posts,
    //this.user,
  });
  factory DetailPracticesState.initial() {
    return DetailPracticesState(
        pageNow: 1,
        scoreChoose: false,
        dayChoose: false,
        signFilter: [],
        posts: [],
        lengthNow: 1);
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [pageNow, scoreChoose, dayChoose, signFilter, lengthNow, posts];

  DetailPracticesState copyWith({
    int? pageNow,
    int? lengthNow,
    bool? scoreChoose,
    bool? dayChoose,
    List<String>? signFilter,
    List<PrePraAPIModel>? posts,

    // auth.user? user,
  }) {
    return DetailPracticesState(
      pageNow: pageNow ?? this.pageNow,
      lengthNow: lengthNow ?? this.lengthNow,
      scoreChoose: scoreChoose ?? this.scoreChoose,
      dayChoose: dayChoose ?? this.dayChoose,
      signFilter: signFilter ?? this.signFilter,
      posts: posts ?? this.posts,
      //user: user ?? this.user,
    );
  }
}
