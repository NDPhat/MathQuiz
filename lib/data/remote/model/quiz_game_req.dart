class QuizGameAPIReq {
  String? quiz;
  String? prequizGameID;
  int? answer;
  String? userId;
  String? sign;
  int? answerSelect;
  bool? infoQuiz;

  QuizGameAPIReq(
      {this.quiz,
      this.prequizGameID,
      this.answer,
      this.userId,
      this.sign,
      this.answerSelect,
      this.infoQuiz});

  QuizGameAPIReq.fromJson(Map<String, dynamic> json) {
    quiz = json['quiz'];
    prequizGameID = json['prequizGameID'];
    answer = json['answer'];
    userId = json['userId'];
    sign = json['sign'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz'] = this.quiz;
    data['prequizGameID'] = this.prequizGameID;
    data['answer'] = this.answer;
    data['userId'] = this.userId;
    data['sign'] = this.sign;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    return data;
  }
}
