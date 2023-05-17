class PreQuizHWRequest {
  String? weak;
  int? numQ;
  String? sign;
  int? timePerQuiz;
  int? sNum;
  int? eNum;

  PreQuizHWRequest(
      {this.weak,
      this.numQ,
      this.sign,
      this.timePerQuiz,
      this.sNum,
      this.eNum});

  PreQuizHWRequest.fromJson(Map<String, dynamic> json) {
    weak = json['weak'];
    numQ = json['numQ'];
    sign = json['sign'];
    timePerQuiz = json['timePerQuiz'];
    sNum = json['sNum'];
    eNum = json['eNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weak'] = this.weak;
    data['numQ'] = this.numQ;
    data['sign'] = this.sign;
    data['timePerQuiz'] = this.timePerQuiz;
    data['sNum'] = this.sNum;
    data['eNum'] = this.eNum;
    return data;
  }
}
