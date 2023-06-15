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
  String? key;
  String? userID;
  String? sign;
  String? optionGame;
  String? dateSave;
  int? sNum;
  int? eNum;
  int? numQ;
  int? timePerQuiz;
  int? score;
  String? status;

  PreQuizGameAPIModel(
      {this.dateSave,
      this.eNum,
      this.key,
      this.numQ,
      this.status,
      this.optionGame,
      this.sNum,
      this.score,
      this.sign,
      this.timePerQuiz,
      this.userID});

  PreQuizGameAPIModel.fromJson(Map<String, dynamic> json) {
    dateSave = json['dateSave'];
    eNum = json['eNum'];
    key = json['key'];
    numQ = json['numQ'];
    optionGame = json['optionGame'];
    sNum = json['sNum'];
    score = json['score'];
    status = json['status'];
    sign = json['sign'];
    timePerQuiz = json['timePerQuiz'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateSave'] = this.dateSave;
    data['eNum'] = this.eNum;
    data['key'] = this.key;
    data['numQ'] = this.numQ;
    data['status'] = this.status;
    data['optionGame'] = this.optionGame;
    data['sNum'] = this.sNum;
    data['score'] = this.score;
    data['sign'] = this.sign;
    data['timePerQuiz'] = this.timePerQuiz;
    data['userID'] = this.userID;
    return data;
  }
}
