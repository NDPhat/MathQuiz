class PreQuizHWRes {
  int? iCount;
  Null? nLast;
  List<PreQuizHW>? lItems;

  PreQuizHWRes({this.iCount, this.nLast, this.lItems});

  PreQuizHWRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <PreQuizHW>[];
      json['_items'].forEach((v) {
        lItems!.add(new PreQuizHW.fromJson(v));
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

class PreQuizHW {
  int? eNum;
  String? key;
  int? numQ;
  int? sNum;
  List<String>? sign;
  int? timePerQuiz;
  String? weak;

  PreQuizHW(
      {this.eNum,
        this.key,
        this.numQ,
        this.sNum,
        this.sign,
        this.timePerQuiz,
        this.weak});

  PreQuizHW.fromJson(Map<String, dynamic> json) {
    eNum = json['eNum'];
    key = json['key'];
    numQ = json['numQ'];
    sNum = json['sNum'];
    sign = json['sign'].cast<String>();
    timePerQuiz = json['timePerQuiz'];
    weak = json['weak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eNum'] = this.eNum;
    data['key'] = this.key;
    data['numQ'] = this.numQ;
    data['sNum'] = this.sNum;
    data['sign'] = this.sign;
    data['timePerQuiz'] = this.timePerQuiz;
    data['weak'] = this.weak;
    return data;
  }
}