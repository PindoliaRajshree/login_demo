class ErrorResponse {
  late List<Errors> _list;

  List<Errors> get list => _list;

  ErrorResponse(this._list);

  ErrorResponse.fromJson(dynamic json) {
    if (json['errors'] != null) {
      _list = [];
      json['errors'].forEach((v) {
        _list.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_list != null) {
      map['errors'] = _list.map((e) => e.toJson()).toList();
    }
    return map;
  }
}

class Errors {
  String? _code;
  String? _message;

  String? get code => _code;

  String? get message => _message;

   Errors(this._code, this._message);

  Errors.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    return map;
  }
}
