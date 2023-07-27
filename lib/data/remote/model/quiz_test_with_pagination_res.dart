class QuizTestPagiAPIRes {
  List<QuizTestAPIPagiModel>? data;
  int? total;
  int? count;
  QuizTestPagiAPIRes({this.data, this.total, this.count});

  QuizTestPagiAPIRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuizTestAPIPagiModel>[];
      json['data'].forEach((v) {
        data!.add(new QuizTestAPIPagiModel.fromJson(v));
      });
    }
    total = json['total'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['count'] = this.count;
    return data;
  }
}

class QuizTestAPIPagiModel {
  int? answer;
  int? answerSelect;
  bool? infoQuiz;
  String? key;
  String? prequizGameID;
  String? quiz;
  String? sign;
  String? userId;

  QuizTestAPIPagiModel(
      {this.answer,
      this.answerSelect,
      this.infoQuiz,
      this.key,
      this.prequizGameID,
      this.quiz,
      this.sign,
      this.userId});

  QuizTestAPIPagiModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
    key = json['key'];
    prequizGameID = json['prequizGameID'];
    quiz = json['quiz'];
    sign = json['sign'];
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
    data['sign'] = this.sign;
    data['userId'] = this.userId;
    return data;
  }
}
