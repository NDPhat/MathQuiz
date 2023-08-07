import 'package:math/data/remote/model/result_quiz_hw_response.dart';

class ResultQuizHWResPagi {
  List<ResultQuizHWAPIModel>? data;
  int? total;
  int? count;

  ResultQuizHWResPagi({this.data, this.total, this.count});

  ResultQuizHWResPagi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ResultQuizHWAPIModel>[];
      json['data'].forEach((v) {
        data!.add(new ResultQuizHWAPIModel.fromJson(v));
      });
    }
    total = json['total'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['count'] = this.count;
    return data;
  }
}
