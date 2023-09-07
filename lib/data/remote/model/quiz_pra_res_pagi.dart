import 'package:math/data/remote/model/quiz_pra_res.dart';

class QuizPraAPIResPagi {
  List<QuizPraAPIModel>? data;
  int? total;
  int? count;
  QuizPraAPIResPagi({this.data, this.total, this.count});

  QuizPraAPIResPagi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuizPraAPIModel>[];
      json['data'].forEach((v) {
        data!.add(new QuizPraAPIModel.fromJson(v));
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
