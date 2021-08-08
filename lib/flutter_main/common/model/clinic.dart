class Clinic {
  String _clinicName;
  String _city;
  String _area;
  String _serviceCategory;
  String _segment;

  String get clinicName => _clinicName;

  String get city => _city;

  String get area => _area;

  String get serviceCategory => _serviceCategory;

  String get segment => _segment;

  Clinic(
      {String clinicName,
      String city,
      String area,
      String serviceCategory,
      String segment}) {
    _clinicName = clinicName;
    _city = city;
    _area = area;
    _serviceCategory = serviceCategory;
    _segment = segment;
  }

  Clinic.fromJson(dynamic json) {
    _clinicName = json["clinicName"];
    _city = json["city"];
    _area = json["area"];
    _serviceCategory = json["serviceCategory"];
    _segment = json["segment"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["clinicName"] = _clinicName;
    map["city"] = _city;
    map["area"] = _area;
    map["serviceCategory"] = _serviceCategory;
    map["segment"] = _segment;
    return map;
  }
}
