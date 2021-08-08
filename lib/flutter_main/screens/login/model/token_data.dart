/// roles : ["ROLE_USER"]
/// exp : 1620847711213
/// userId : "3"

class TokenData {
  String _roles;
  String _exp;
  String _userId;

  String get roles => _roles;

  String get exp => _exp;

  String get userId => _userId;

  TokenData({String roles, String exp, String userId}) {
    _roles = roles;
    _exp = exp;
    _userId = userId;
  }

  TokenData.fromJson(dynamic response) {
    response = response.toString().trim().replaceAll("\"", "");
    response = response.toString().trim().replaceAll("{", "");
    response = response.toString().trim().replaceAll("}", "");

    var dataSp = response.split(',');
    Map<String, String> mapData = Map();
    dataSp.forEach(
        (element) => mapData[element.split(':')[0]] = element.split(':')[1]);

    var x = dataSp;
    // response = json.decode(response);

    _roles = dataSp[0].split(":").last;
    _exp = dataSp[1].toString()..split(":").last;
    _userId = dataSp[2].toString().split(":").last;
    // _roles = response["roles"] != null ? response["roles"] : '';
    // _exp = response["exp"];
    // _userId = response["userId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["roles"] = _roles;
    map["exp"] = _exp;
    map["userId"] = _userId;
    return map;
  }
}
