import 'package:math/data/remote/model/pre_test_res.dart';

class PreTestAPIResPagi {
  List<PreTestAPIRes>? data;
  int? total;
  int? count;

  PreTestAPIResPagi({this.data, this.total, this.count});

  PreTestAPIResPagi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PreTestAPIRes>[];
      json['data'].forEach((v) {
        data!.add(new PreTestAPIRes.fromJson(v));
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
