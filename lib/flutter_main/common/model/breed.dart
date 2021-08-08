class Breed{
  Breed(this.id, this._name);
  String _name;
  String id;
  String image;
  Breed breed;
  dynamic _additionalInfo;
  int _displaySequence;



  String get name => _name;

  dynamic get additionalInfo => _additionalInfo;

  int get displaySequence => _displaySequence;

  Breed.fromJson(dynamic json) {
    _name = json["name"];
    _additionalInfo = json["additionalInfo"];
    _displaySequence = json["displaySequence"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["additionalInfo"] = _additionalInfo;
    map["displaySequence"] = _displaySequence;
    return map;
  }
}