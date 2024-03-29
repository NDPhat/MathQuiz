class QuizPraAPIReq {
  String? quiz;
  String? prePraId;
  int? answer;
  String? sign;
  int? answerSelect;
  bool? infoQuiz;

  QuizPraAPIReq(
      {this.quiz,
      this.prePraId,
      this.answer,
      this.sign,
      this.answerSelect,
      this.infoQuiz});

  QuizPraAPIReq.fromJson(Map<String, dynamic> json) {
    quiz = json['quiz'];
    prePraId = json['prePraId'];
    answer = json['answer'];
    sign = json['sign'];
    answerSelect = json['answerSelect'];
    infoQuiz = json['infoQuiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz'] = this.quiz;
    data['prePraId'] = this.prePraId;
    data['answer'] = this.answer;
    data['sign'] = this.sign;
    data['answerSelect'] = this.answerSelect;
    data['infoQuiz'] = this.infoQuiz;
    return data;
  }
}
