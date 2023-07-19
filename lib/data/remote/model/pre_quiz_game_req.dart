class PreQuizGameAPIReq {
  String? userID;
  String? sign;
  String? optionGame;
  String? dateSave;
  int? numQ;
  int? score;
  String? status;

  PreQuizGameAPIReq(
      {this.userID,
      this.sign,
      this.optionGame,
      this.dateSave,
      this.numQ,
      this.score,
      this.status});

  PreQuizGameAPIReq.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    sign = json['sign'];
    optionGame = json['optionGame'];
    dateSave = json['dateSave'];
    numQ = json['numQ'];
    score = json['score'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['sign'] = this.sign;
    data['optionGame'] = this.optionGame;
    data['dateSave'] = this.dateSave;
    data['numQ'] = this.numQ;
    data['score'] = this.score;
    data['status'] = this.status;
    return data;
  }
}
