class QuizHWAPIReq {
  int? answer;
  int? answerSelect;
  bool? infoQuiz;
  String? quiz;
  String? resultHWID;

  QuizHWAPIReq(
      {this.answer,
      this.answerSelect,
      this.infoQuiz,
      this.quiz,
      this.resultHWID});

  QuizHWAPIReq.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
    quiz = json['quiz'];
    resultHWID = json['resultHWID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    data['quiz'] = this.quiz;
    data['resultHWID'] = this.resultHWID;
    return data;
  }
}
