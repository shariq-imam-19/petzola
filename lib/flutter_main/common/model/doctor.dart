/// name : "amgad"
/// speciality : ""
/// experience : ""

class Doctor {
  String _name;
  String _speciality;
  String _experience;

  String get name => _name;

  String get speciality => _speciality;

  String get experience => _experience;

  Doctor({String name, String speciality, String experience}) {
    _name = name;
    _speciality = speciality;
    _experience = experience;
  }

  Doctor.fromJson(dynamic json) {
    _name = json["name"];
    _speciality = json["speciality"];
    _experience = json["experience"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["speciality"] = _speciality;
    map["experience"] = _experience;
    return map;
  }
}
