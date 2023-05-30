class DetailQuizHWAPIResponse {
  int? iCount;
  Null? nLast;
  List<DetailQuizHWAPIModel>? lItems;

  DetailQuizHWAPIResponse({this.iCount, this.nLast, this.lItems});

  DetailQuizHWAPIResponse.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <DetailQuizHWAPIModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new DetailQuizHWAPIModel.fromJson(v));
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

class DetailQuizHWAPIModel {
  int? answer;
  int? answerSelect;
  bool? infoQuiz;
  String? key;
  String? quiz;
  String? resultHWID;

  DetailQuizHWAPIModel(
      {this.answer,
      this.answerSelect,
      this.infoQuiz,
      this.key,
      this.quiz,
      this.resultHWID});

  DetailQuizHWAPIModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
    key = json['key'];
    quiz = json['quiz'];
    resultHWID = json['resultHWID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    data['key'] = this.key;
    data['quiz'] = this.quiz;
    data['resultHWID'] = this.resultHWID;
    return data;
  }
}
