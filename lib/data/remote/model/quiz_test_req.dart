class QuizTestAPIReq {
  String? quiz;
  String? preTestId;
  int? answer;
  int? answerSelect;
  bool? infoQuiz;

  QuizTestAPIReq(
      {this.quiz,
      this.preTestId,
      this.answer,
      this.answerSelect,
      this.infoQuiz});

  QuizTestAPIReq.fromJson(Map<String, dynamic> json) {
    quiz = json['quiz'];
    preTestId = json['preTestId'];
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz'] = this.quiz;
    data['preTestId'] = this.preTestId;
    data['answer'] = this.answer;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    return data;
  }
}
