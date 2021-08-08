class LoginResponse {
  int _id;
  String _username;
  String _email;
  List<String> _roles;
  MessageResponse _messageResponse;
  String _accessToken;
  String _tokenType;

  int get id => _id;

  String get username => _username;

  String get email => _email;

  List<String> get roles => _roles;

  MessageResponse get messageResponse => _messageResponse;

  String get accessToken => _accessToken;

  String get tokenType => _tokenType;

  LoginResponse(
      {int id,
      String username,
      String email,
      List<String> roles,
      MessageResponse messageResponse,
      String accessToken,
      String tokenType}) {
    _id = id;
    _username = username;
    _email = email;
    _roles = roles;
    _messageResponse = messageResponse;
    _accessToken = accessToken;
    _tokenType = tokenType;
  }

  set accessToken(String token) {
    _accessToken = token;
  }

  LoginResponse.fromJson(dynamic json) {
    _id = json["id"];
    _username = json["name"];
    _email = json["email"];
    _roles = json["roles"] != null ? json["roles"].cast<String>() : [];
    _messageResponse = json["messageResponse"] != null
        ? MessageResponse.fromJson(json["messageResponse"])
        : null;
    _accessToken = json["accessToken"];
    _tokenType = json["tokenType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["username"] = _username;
    map["email"] = _email;
    map["roles"] = _roles;
    if (_messageResponse != null) {
      map["messageResponse"] = _messageResponse.toJson();
    }
    map["accessToken"] = _accessToken;
    map["tokenType"] = _tokenType;
    return map;
  }
}

/// code : "00"
/// status : "200"
/// message : "authenticate User successfully"

class MessageResponse {
  String _code;
  String _status;
  String _message;

  String get code => _code;

  String get status => _status;

  String get message => _message;

  MessageResponse({String code, String status, String message}) {
    _code = code;
    _status = status;
    _message = message;
  }

  MessageResponse.fromJson(dynamic json) {
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
