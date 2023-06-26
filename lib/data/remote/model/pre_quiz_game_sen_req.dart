class PreQuizGameSenReq {
  String? userID;
  String? dateSave;
  int? score;
  String? status;

  PreQuizGameSenReq({this.userID, this.dateSave, this.score, this.status});

  PreQuizGameSenReq.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    dateSave = json['dateSave'];
    score = json['score'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['dateSave'] = this.dateSave;
    data['score'] = this.score;
    data['status'] = this.status;
    return data;
  }
}
