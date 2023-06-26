class SentencesQuizRes {
  String? key;
  String? quiz;
  String? sign;
  String? answer;

  SentencesQuizRes({this.key, this.quiz, this.sign,this.answer});

  SentencesQuizRes.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    quiz = json['quiz'];
    sign = json['sign'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['quiz'] = this.quiz;
    data['sign'] = this.sign;
    data['answer'] = this.answer;
    return data;
  }
}