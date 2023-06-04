class GetQuizTestAPIRes {
  int? iCount;
  Null? nLast;
  List<QuizTestAPIRes>? lItems;

  GetQuizTestAPIRes({this.iCount, this.nLast, this.lItems});

  GetQuizTestAPIRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <QuizTestAPIRes>[];
      json['_items'].forEach((v) {
        lItems!.add(new QuizTestAPIRes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_count'] = this.iCount;
    data['_last'] = this.nLast;
    if (this.lItems != null) {
      data['_items'] = this.lItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizTestAPIRes {
  int? answer;
  int? answerSelect;
  bool? infoQuiz;
  String? key;
  String? preTestID;
  String? quiz;

  QuizTestAPIRes(
      {this.answer,
        this.answerSelect,
        this.infoQuiz,
        this.key,
        this.preTestID,
        this.quiz});

  QuizTestAPIRes.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
    key = json['key'];
    preTestID = json['preTestID'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    data['key'] = this.key;
    data['preTestID'] = this.preTestID;
    data['quiz'] = this.quiz;
    return data;
  }
}
