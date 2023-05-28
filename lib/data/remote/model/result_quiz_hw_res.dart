class GetAllResultQuizHWRes {
  int? iCount;
  Null? nLast;
  List<ResultQuizHWRes>? lItems;

  GetAllResultQuizHWRes({this.iCount, this.nLast, this.lItems});

  GetAllResultQuizHWRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <ResultQuizHWRes>[];
      json['_items'].forEach((v) {
        lItems!.add(new ResultQuizHWRes.fromJson(v));
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

class ResultQuizHWRes {
  int? falseQ;
  String? key;
  int? numQ;
  int? score;
  int? trueQ;
  String? userHWId;
  String? weak;

  ResultQuizHWRes(
      {this.falseQ,
        this.key,
        this.numQ,
        this.score,
        this.trueQ,
        this.userHWId,
        this.weak});

  ResultQuizHWRes.fromJson(Map<String, dynamic> json) {
    falseQ = json['falseQ'];
    key = json['key'];
    numQ = json['numQ'];
    score = json['score'];
    trueQ = json['trueQ'];
    userHWId = json['userHWId'];
    weak = json['weak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['falseQ'] = this.falseQ;
    data['key'] = this.key;
    data['numQ'] = this.numQ;
    data['score'] = this.score;
    data['trueQ'] = this.trueQ;
    data['userHWId'] = this.userHWId;
    data['weak'] = this.weak;
    return data;
  }
}
