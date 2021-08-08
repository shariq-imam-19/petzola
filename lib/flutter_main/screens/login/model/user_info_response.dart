/// data : {"name":"ddopik","email":"ddopik.01@gmail.com","mobile":"012345678899"}

class UserInfoResponse {
  Data _data;

  Data get data => _data;

  UserInfoResponse({
      Data data}){
    _data = data;
}

  UserInfoResponse.fromJson(dynamic json) {
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

/// name : "ddopik"
/// email : "ddopik.01@gmail.com"
/// mobile : "012345678899"

class Data {
  String _name;
  String _email;
  String _mobile;

  String get name => _name;
  String get email => _email;
  String get mobile => _mobile;

  Data({
      String name, 
      String email, 
      String mobile}){
    _name = name;
    _email = email;
    _mobile = mobile;
}

  Data.fromJson(dynamic json) {
    _name = json["name"];
    _email = json["email"];
    _mobile = json["mobile"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["email"] = _email;
    map["mobile"] = _mobile;
    return map;
  }

}