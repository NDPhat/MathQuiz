class QuizGameAPIResponse {
  int? iCount;
  Null? nLast;
  List<QuizGameAPIModel>? lItems;

  QuizGameAPIResponse({this.iCount, this.nLast, this.lItems});

  QuizGameAPIResponse.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <QuizGameAPIModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new QuizGameAPIModel.fromJson(v));
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

class QuizGameAPIModel {
  int? answer;
  int? answerSelect;
  bool? infoQuiz;
  String? key;
  String? prequizGameID;
  String? quiz;
  String? userId;

  QuizGameAPIModel(
      {this.answer,
        this.answerSelect,
        this.infoQuiz,
        this.key,
        this.prequizGameID,
        this.quiz,
        this.userId});

  QuizGameAPIModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
    key = json['key'];
    prequizGameID = json['prequizGameID'];
    quiz = json['quiz'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    data['key'] = this.key;
    data['prequizGameID'] = this.prequizGameID;
    data['quiz'] = this.quiz;
    data['userId'] = this.userId;
    return data;
  }
}
