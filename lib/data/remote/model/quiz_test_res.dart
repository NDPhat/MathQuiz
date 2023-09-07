class QuizTestAPIRes {
  int? iCount;
  Null? nLast;
  List<QuizTestAPIModel>? lItems;

  QuizTestAPIRes({this.iCount, this.nLast, this.lItems});

  QuizTestAPIRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <QuizTestAPIModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new QuizTestAPIModel.fromJson(v));
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

class QuizTestAPIModel {
  int? answer;
  int? answerSelect;
  bool? infoQuiz;
  String? key;
  String? preTestId;
  String? quiz;

  QuizTestAPIModel(
      {this.answer,
        this.answerSelect,
        this.infoQuiz,
        this.key,
        this.preTestId,
        this.quiz});

  QuizTestAPIModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
    key = json['key'];
    preTestId = json['preTestId'];
    quiz = json['quiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    data['key'] = this.key;
    data['preTestId'] = this.preTestId;
    data['quiz'] = this.quiz;
    return data;
  }
}
