class PreTestAPIReq {
  int? numQ;
  int? score;
  int? trueQ;
  String? userId;
  int? falseQ;
  String? dateSave;
  String? status;

  PreTestAPIReq(
      {this.numQ,
      this.score,
      this.trueQ,
      this.userId,
      this.falseQ,
      this.status,
      this.dateSave});

  PreTestAPIReq.fromJson(Map<String, dynamic> json) {
    numQ = json['numQ'];
    score = json['score'];
    trueQ = json['trueQ'];
    userId = json['userId'];
    falseQ = json['falseQ'];
    dateSave = json['dateSave'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numQ'] = this.numQ;
    data['score'] = this.score;
    data['trueQ'] = this.trueQ;
    data['userId'] = this.userId;
    data['falseQ'] = this.falseQ;
    data['dateSave'] = this.dateSave;
    data['status'] = this.status;
    return data;
  }
}
