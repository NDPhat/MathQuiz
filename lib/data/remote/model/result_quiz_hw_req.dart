class ResultQuizHWAPIReq{
  String? week;
  int? numQ;
  String? userId;
  int? score;
  int? trueQ;
  int? falseQ;

  ResultQuizHWAPIReq(
      {this.week, this.numQ, this.userId, this.score, this.trueQ, this.falseQ});

  ResultQuizHWAPIReq.fromJson(Map<String, dynamic> json) {
    week = json['week'];
    numQ = json['numQ'];
    userId = json['userId'];
    score = json['score'];
    trueQ = json['trueQ'];
    falseQ = json['falseQ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['week'] = this.week;
    data['numQ'] = this.numQ;
    data['userId'] = this.userId;
    data['score'] = this.score;
    data['trueQ'] = this.trueQ;
    data['falseQ'] = this.falseQ;
    return data;
  }
}
