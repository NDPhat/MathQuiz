import 'package:math/data/remote/model/quiz_test_res.dart';

class QuizTestAPIResPagi {
  List<QuizTestAPIModel>? data;
  int? total;
  int? count;
  QuizTestAPIResPagi({this.data, this.total, this.count});

  QuizTestAPIResPagi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuizTestAPIModel>[];
      json['data'].forEach((v) {
        data!.add(new QuizTestAPIModel.fromJson(v));
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
