import 'package:math/data/remote/model/pre_pra_res.dart';

class PrePraAPIResPagi {
  List<PrePraAPIModel>? data;
  int? total;
  int? count;

  PrePraAPIResPagi({this.data, this.total, this.count});

  PrePraAPIResPagi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PrePraAPIModel>[];
      json['data'].forEach((v) {
        data!.add(new PrePraAPIModel.fromJson(v));
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
