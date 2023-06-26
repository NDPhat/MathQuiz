class PreQuizHWAPIResponse {
  int? iCount;
  Null? nLast;
  List<PreQuizHWResAPIModel>? lItems;

  PreQuizHWAPIResponse({this.iCount, this.nLast, this.lItems});

  PreQuizHWAPIResponse.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <PreQuizHWResAPIModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new PreQuizHWResAPIModel.fromJson(v));
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

class PreQuizHWResAPIModel {
  String? color;
  String? dend;
  String? dstart;
  int? differentTime;
  int? eNum;
  String? key;
  int? numQ;
  int? sNum;
  List<String>? sign;
  String? status;
  String? week;
  String? lop;

  PreQuizHWResAPIModel(
      {this.color,
      this.dend,
      this.dstart,
      this.eNum,
      this.key,
      this.numQ,
      this.sNum,
        this.lop,
      this.sign,
      this.status,
      this.week});

  PreQuizHWResAPIModel.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    dend = json['dend'];
    dstart = json['dstart'];
    eNum = json['eNum'];
    key = json['key'];
    numQ = json['numQ'];
    lop = json['lop'];
    sNum = json['sNum'];
    sign = json['sign'].cast<String>();
    status = json['status'];
    week = json['week'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['dend'] = this.dend;
    data['dstart'] = this.dstart;
    data['eNum'] = this.eNum;
    data['key'] = this.key;
    data['numQ'] = this.numQ;
    data['sNum'] = this.sNum;
    data['lop'] = this.lop;
    data['sign'] = this.sign;
    data['status'] = this.status;
    data['week'] = this.week;
    return data;
  }
}
