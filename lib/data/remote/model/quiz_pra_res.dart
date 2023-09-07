class QuizPraAPIRes {
  int? iCount;
  Null? nLast;
  List<QuizPraAPIModel>? lItems;

  QuizPraAPIRes({this.iCount, this.nLast, this.lItems});

  QuizPraAPIRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <QuizPraAPIModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new QuizPraAPIModel.fromJson(v));
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

class QuizPraAPIModel {
  int? answer;
  int? answerSelect;
  bool? infoQuiz;
  String? key;
  String? prePraId;
  String? quiz;
  String? userId;

  QuizPraAPIModel(
      {this.answer,
        this.answerSelect,
        this.infoQuiz,
        this.key,
        this.prePraId,
        this.quiz,
        this.userId});

  QuizPraAPIModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
    key = json['key'];
    prePraId = json['prePraId'];
    quiz = json['quiz'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    data['key'] = this.key;
    data['prePraId'] = this.prePraId;
    data['quiz'] = this.quiz;
    data['userId'] = this.userId;
    return data;
  }
}
