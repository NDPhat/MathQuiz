class PrePraAPIReq {
  String? userId;
  String? sign;
  String? optionGame;
  String? dateSave;
  int? numQ;
  int? score;
  String? status;

  PrePraAPIReq(
      {this.userId,
      this.sign,
      this.optionGame,
      this.dateSave,
      this.numQ,
      this.score,
      this.status});

  PrePraAPIReq.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    sign = json['sign'];
    optionGame = json['optionGame'];
    dateSave = json['dateSave'];
    numQ = json['numQ'];
    score = json['score'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['sign'] = this.sign;
    data['optionGame'] = this.optionGame;
    data['dateSave'] = this.dateSave;
    data['numQ'] = this.numQ;
    data['score'] = this.score;
    data['status'] = this.status;
    return data;
  }
}
