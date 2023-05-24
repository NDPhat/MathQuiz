class GetUserByMailAndPassRes {
  int? iCount;
  Null? nLast;
  List<UserModel>? lItems;

  GetUserByMailAndPassRes({this.iCount, this.nLast, this.lItems});

  GetUserByMailAndPassRes.fromJson(Map<String, dynamic> json) {
    iCount = json['_count'];
    nLast = json['_last'];
    if (json['_items'] != null) {
      lItems = <UserModel>[];
      json['_items'].forEach((v) {
        lItems!.add(new UserModel.fromJson(v));
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

class UserModel {
  String? email;
  String? key;
  String? lop;
  String? name;
  String? otp;
  String? password;

  UserModel({this.email, this.key, this.lop, this.name, this.otp, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
  email = json['email'];
  key = json['key'];
  lop = json['lop'];
  name = json['name'];
  otp = json['otp'];
  password = json['password'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['email'] = this.email;
  data['key'] = this.key;
  data['lop'] = this.lop;
  data['name'] = this.name;
  data['otp'] = this.otp;
  data['password'] = this.password;
  return data;
  }
  }