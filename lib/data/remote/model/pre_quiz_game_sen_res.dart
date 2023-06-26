class PreQuizGameSenAPIRes {
  int? iCount;
  Null? nLast;
  List<PreQuizGameSenModelRes>? lItems;

  PreQuizGameSenAPIRes({this.iCount, this.nLast, this.lItems});

  PreQuizGameSenAPIRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <PreQuizGameSenModelRes>[];
      json['_items'].forEach((v) {
        lItems!.add(new PreQuizGameSenModelRes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_count'] = this.iCount;
    data['_last'] = this.nLast;
    if (this.lItems != null) {
      data['_items'] = this.lItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class PreQuizGameSenModelRes{
  String? dateSave;
  String? key;
  int? score;
  String? status;
  String? userID;

  PreQuizGameSenModelRes({this.dateSave, this.key, this.score, this.status, this.userID});

  PreQuizGameSenModelRes.fromJson(Map<String, dynamic> json) {
    dateSave = json['dateSave'];
    key = json['key'];
    score = json['score'];
    status = json['status'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateSave'] = this.dateSave;
    data['key'] = this.key;
    data['score'] = this.score;
    data['status'] = this.status;
    data['userID'] = this.userID;
    return data;
  }
}