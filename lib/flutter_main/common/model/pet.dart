import 'package:petzola/flutter_main/common/model/breed.dart';

class Pet {
  String _name;
  String id;
  String _image;
  Breed breed;
  dynamic _additionalInfo;
  int _displaySequence;

  Pet(this.id, this._name, this._image);

  String get name => _name;

  dynamic get additionalInfo => _additionalInfo;

  int get displaySequence => _displaySequence;

  Pet.fromJson(dynamic json) {
    _name = json["name"];
    _image = json["img"];
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
