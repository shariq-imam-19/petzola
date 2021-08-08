class Service {
  String _language;
  List<LookupData> _lookupData;

  String get language => _language;

  List<LookupData> get lookupData => _lookupData;

  Service({String language, List<LookupData> lookupData}) {
    _language = language;
    _lookupData = lookupData;
  }

  Service.fromJson(dynamic json) {
    _language = json["language"];
    if (json["lookupData"] != null) {
      _lookupData = [];
      json["lookupData"].forEach((v) {
        _lookupData.add(LookupData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["language"] = _language;
    if (_lookupData != null) {
      map["lookupData"] = _lookupData.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "Grooming"
/// additionalInfo : null

class LookupData {
  String _name;
  dynamic _additionalInfo;

  String get name => _name;

  dynamic get additionalInfo => _additionalInfo;

  LookupData({String name, dynamic additionalInfo}) {
    _name = name;
    _additionalInfo = additionalInfo;
  }

  LookupData.fromJson(dynamic json) {
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
