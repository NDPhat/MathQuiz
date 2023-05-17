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
  String? _email;
  String? _key;
  String? _lop;
  String? _name;
  String? _password;
  int? _scoreHomeWork;
  int? _scoreTest;

  UserModel(
      {String? email,
        String? key,
        String? lop,
        String? name,
        String? password,
        int? scoreHomeWork,
        int? scoreTest}) {
    if (email != null) {
      this._email = email;
    }
    if (key != null) {
      this._key = key;
    }
    if (lop != null) {
      this._lop = lop;
    }
    if (name != null) {
      this._name = name;
    }
    if (password != null) {
      this._password = password;
    }
    if (scoreHomeWork != null) {
      this._scoreHomeWork = scoreHomeWork;
    }
    if (scoreTest != null) {
      this._scoreTest = scoreTest;
    }
  }

  String? get email => _email;
  set email(String? email) => _email = email;
  String? get key => _key;
  set key(String? key) => _key = key;
  String? get lop => _lop;
  set lop(String? lop) => _lop = lop;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get password => _password;
  set password(String? password) => _password = password;
  int? get scoreHomeWork => _scoreHomeWork;
  set scoreHomeWork(int? scoreHomeWork) => _scoreHomeWork = scoreHomeWork;
  int? get scoreTest => _scoreTest;
  set scoreTest(int? scoreTest) => _scoreTest = scoreTest;

  UserModel.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _key = json['key'];
    _lop = json['lop'];
    _name = json['name'];
    _password = json['password'];
    _scoreHomeWork = json['scoreHomeWork'];
    _scoreTest = json['scoreTest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['key'] = this._key;
    data['lop'] = this._lop;
    data['name'] = this._name;
    data['password'] = this._password;
    data['scoreHomeWork'] = this._scoreHomeWork;
    data['scoreTest'] = this._scoreTest;
    return data;
  }
}
