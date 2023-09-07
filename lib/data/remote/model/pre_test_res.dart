class PreTestAPIRes {
  int? iCount;
  Null? nLast;
  List<PreTestAPIModel>? lItems;

  PreTestAPIRes({this.iCount, this.nLast, this.lItems});

  PreTestAPIRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <PreTestAPIModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new PreTestAPIModel.fromJson(v));
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

class PreTestAPIModel {
  String? dateSave;
  int? falseQ;
  String? key;
  int? score;
  int? numQ;
  int? trueQ;
  String? userId;

  PreTestAPIModel(
      {this.dateSave,
      this.falseQ,
      this.key,
      this.score,
      this.numQ,
      this.trueQ,
      this.userId});

  PreTestAPIModel.fromJson(Map<String, dynamic> json) {
    dateSave = json['dateSave'];
    falseQ = json['falseQ'];
    key = json['key'];
    score = json['score'];
    numQ = json['numQ'];
    trueQ = json['trueQ'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateSave'] = this.dateSave;
    data['falseQ'] = this.falseQ;
    data['key'] = this.key;
    data['score'] = this.score;
    data['numQ'] = this.numQ;
    data['trueQ'] = this.trueQ;
    data['userId'] = this.userId;
    return data;
  }
}
