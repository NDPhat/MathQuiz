class QuizTestReq {
  String? quiz;
  String? preTestID;
  int? answer;
  int? answerSelect;
  bool? infoQuiz;

  QuizTestReq(
      {this.quiz,
        this.preTestID,
        this.answer,
        this.answerSelect,
        this.infoQuiz});

  QuizTestReq.fromJson(Map<String, dynamic> json) {
    quiz = json['quiz'];
    preTestID = json['preTestID'];
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz'] = this.quiz;
    data['preTestID'] = this.preTestID;
    data['answer'] = this.answer;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    return data;
  }
}
