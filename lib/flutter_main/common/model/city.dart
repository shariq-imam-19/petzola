/// name : "دبى"
/// additionalInfo : "area=JBR,BARSHA,ABUHAIL"

class City {
  String _name;
  String _additionalInfo;

  String get name => _name;

  String get additionalInfo => _additionalInfo;

  City({String name, String additionalInfo}) {
    _name = name;
    _additionalInfo = additionalInfo;
  }

  City.fromJson(dynamic json) {
    _name = json["name"];
    _additionalInfo = json["additionalInfo"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["additionalInfo"] = _additionalInfo;
    return map;
  }
}
