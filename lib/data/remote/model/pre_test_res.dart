class GetPreTestAPIRes {
  int? iCount;
  Null? nLast;
  List<PreTestAPIRes>? lItems;

  GetPreTestAPIRes({this.iCount, this.nLast, this.lItems});

  GetPreTestAPIRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <PreTestAPIRes>[];
      json['_items'].forEach((v) {
        lItems!.add(new PreTestAPIRes.fromJson(v));
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

class PreTestAPIRes {
  String? dateSave;
  int? falseQ;
  String? key;
  int? score;
  int? sumQ;
  int? trueQ;
  String? userID;

  PreTestAPIRes(
      {this.dateSave,
        this.falseQ,
        this.key,
        this.score,
        this.sumQ,
        this.trueQ,
        this.userID});

  PreTestAPIRes.fromJson(Map<String, dynamic> json) {
    dateSave = json['dateSave'];
    falseQ = json['falseQ'];
    key = json['key'];
    score = json['score'];
    sumQ = json['sumQ'];
    trueQ = json['trueQ'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateSave'] = this.dateSave;
    data['falseQ'] = this.falseQ;
    data['key'] = this.key;
    data['score'] = this.score;
    data['sumQ'] = this.sumQ;
    data['trueQ'] = this.trueQ;
    data['userID'] = this.userID;
    return data;
  }
}
