class PreQuizGameAPIResponse {
  int? iCount;
  Null? nLast;
  List<PreQuizGameAPIModel>? lItems;

  PreQuizGameAPIResponse({this.iCount, this.nLast, this.lItems});

  PreQuizGameAPIResponse.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <PreQuizGameAPIModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new PreQuizGameAPIModel.fromJson(v));
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

class PreQuizGameAPIModel {
  String? dateSave;
  int? eNum;
  String? key;
  int? numQ;
  String? optionGame;
  int? sNum;
  int? score;
  String? sign;
  String? status;
  String? userID;

  PreQuizGameAPIModel(
      {this.dateSave,
        this.eNum,
        this.key,
        this.numQ,
        this.optionGame,
        this.sNum,
        this.score,
        this.sign,
        this.status,
        this.userID});

  PreQuizGameAPIModel.fromJson(Map<String, dynamic> json) {
    dateSave = json['dateSave'];
    eNum = json['eNum'];
    key = json['key'];
    numQ = json['numQ'];
    optionGame = json['optionGame'];
    sNum = json['sNum'];
    score = json['score'];
    sign = json['sign'];
    status = json['status'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateSave'] = this.dateSave;
    data['eNum'] = this.eNum;
    data['key'] = this.key;
    data['numQ'] = this.numQ;
    data['optionGame'] = this.optionGame;
    data['sNum'] = this.sNum;
    data['score'] = this.score;
    data['sign'] = this.sign;
    data['status'] = this.status;
    data['userID'] = this.userID;
    return data;
  }
}
