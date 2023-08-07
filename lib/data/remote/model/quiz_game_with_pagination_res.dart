import 'package:math/data/remote/model/quiz_game_response.dart';

class QuizGamePagiAPIRes {
  List<QuizGameAPIModel>? data;
  int? total;
  int? count;
  QuizGamePagiAPIRes({this.data, this.total, this.count});

  QuizGamePagiAPIRes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuizGameAPIModel>[];
      json['data'].forEach((v) {
        data!.add(new QuizGameAPIModel.fromJson(v));
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
