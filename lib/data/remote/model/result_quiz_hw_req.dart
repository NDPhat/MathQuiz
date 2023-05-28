class ResultQuizHWReq {
  String? weak;
  int? numQ;
  String? userHWId;
  int? score;
  int? trueQ;
  int? falseQ;

  ResultQuizHWReq(
      {this.weak,
        this.numQ,
        this.userHWId,
        this.score,
        this.trueQ,
        this.falseQ});

  ResultQuizHWReq.fromJson(Map<String, dynamic> json) {
    weak = json['weak'];
    numQ = json['numQ'];
    userHWId = json['userHWId'];
    score = json['score'];
    trueQ = json['trueQ'];
    falseQ = json['falseQ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weak'] = this.weak;
    data['numQ'] = this.numQ;
    data['userHWId'] = this.userHWId;
    data['score'] = this.score;
    data['trueQ'] = this.trueQ;
    data['falseQ'] = this.falseQ;
    return data;
  }
}