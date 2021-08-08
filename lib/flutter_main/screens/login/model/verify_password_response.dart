/// data : {"token":"string"}

class VerifyPasswordResponse {
  Data _data;

  Data get data => _data;

  VerifyPasswordResponse({
      Data data}){
    _data = data;
}

  VerifyPasswordResponse.fromJson(dynamic json) {
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// token : "string"

class Data {
  String _token;

  String get token => _token;

  Data({
      String token}){
    _token = token;
}

  Data.fromJson(dynamic json) {
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    return map;
  }

}