/// error : {"status":"BAD_REQUEST","timestamp":"01-06-2021 09:27:23","message":"Invalid username or password","debugMessage":"Bad credentials"}

class ErrorResponse {
  Error _error;

  Error get error => _error;

  ErrorResponse({
      Error error}){
    _error = error;
}

  ErrorResponse.fromJson(dynamic json) {
    _error = json["error"] != null ? Error.fromJson(json["error"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_error != null) {
      map["error"] = _error.toJson();
    }
    return map;
  }

}

/// status : "BAD_REQUEST"
/// timestamp : "01-06-2021 09:27:23"
/// message : "Invalid username or password"
/// debugMessage : "Bad credentials"

class Error {
  String _status;
  String _timestamp;
  String _message;
  String _debugMessage;

  String get status => _status;
  String get timestamp => _timestamp;
  String get message => _message;
  String get debugMessage => _debugMessage;

  Error({
      String status, 
      String timestamp, 
      String message, 
      String debugMessage}){
    _status = status;
    _timestamp = timestamp;
    _message = message;
    _debugMessage = debugMessage;
}

  Error.fromJson(dynamic json) {
    _status = json["status"];
    _timestamp = json["timestamp"];
    _message = json["message"];
    _debugMessage = json["debugMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["timestamp"] = _timestamp;
    map["message"] = _message;
    map["debugMessage"] = _debugMessage;
    return map;
  }

}