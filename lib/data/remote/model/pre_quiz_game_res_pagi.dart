import 'package:math/data/remote/model/pre_quiz_game_response.dart';

class PreQuizGameAPIResPagi {
  List<PreQuizGameAPIModel>? data;
  int? total;
  int? count;

  PreQuizGameAPIResPagi({this.data, this.total, this.count});

  PreQuizGameAPIResPagi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PreQuizGameAPIModel>[];
      json['data'].forEach((v) {
        data!.add(new PreQuizGameAPIModel.fromJson(v));
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
