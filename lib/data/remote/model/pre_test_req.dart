class PreTestReq {
  int? sumQ;
  int? score;
  int? trueQ;
  String? userID;
  int? falseQ;
  String? dateSave;

  PreTestReq(
      {this.sumQ,
        this.score,
        this.trueQ,
        this.userID,
        this.falseQ,
        this.dateSave});

  PreTestReq.fromJson(Map<String, dynamic> json) {
    sumQ = json['sumQ'];
    score = json['score'];
    trueQ = json['trueQ'];
    userID = json['userID'];
    falseQ = json['falseQ'];
    dateSave = json['dateSave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sumQ'] = this.sumQ;
    data['score'] = this.score;
    data['trueQ'] = this.trueQ;
    data['userID'] = this.userID;
    data['falseQ'] = this.falseQ;
    data['dateSave'] = this.dateSave;
    return data;
  }
}
