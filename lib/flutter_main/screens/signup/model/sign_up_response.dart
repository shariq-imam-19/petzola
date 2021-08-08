/// code : "00"
/// status : "200"
/// message : "\"User registered successfully!\""

class SignUpResponse {
  String _code;
  String _status;
  String _message;

  String get code => _code;
  String get status => _status;
  String get message => _message;

  SignUpResponse({
      String code, 
      String status, 
      String message}){
    _code = code;
    _status = status;
    _message = message;
}

  SignUpResponse.fromJson(dynamic json) {
    _code = json["code"];
    _status = json["status"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["status"] = _status;
    map["message"] = _message;
    return map;
  }

}