class PrePraAPIRes {
  int? iCount;
  Null? nLast;
  List<PrePraAPIModel>? lItems;

  PrePraAPIRes({this.iCount, this.nLast, this.lItems});

  PrePraAPIRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <PrePraAPIModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new PrePraAPIModel.fromJson(v));
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

class PrePraAPIModel {
  String? dateSave;
  String? key;
  int? numQ;
  String? optionGame;
  int? score;
  String? sign;
  String? status;
  String? userId;

  PrePraAPIModel(
      {this.dateSave,
        this.key,
        this.numQ,
        this.optionGame,
        this.score,
        this.sign,
        this.status,
        this.userId});

  PrePraAPIModel.fromJson(Map<String, dynamic> json) {
    dateSave = json['dateSave'];
    key = json['key'];
    numQ = json['numQ'];
    optionGame = json['optionGame'];
    score = json['score'];
    sign = json['sign'];
    status = json['status'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateSave'] = this.dateSave;
    data['key'] = this.key;
    data['numQ'] = this.numQ;
    data['optionGame'] = this.optionGame;
    data['score'] = this.score;
    data['sign'] = this.sign;
    data['status'] = this.status;
    data['userId'] = this.userId;
    return data;
  }
}
