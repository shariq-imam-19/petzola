import 'package:petzola/flutter_main/common/model/pet.dart';

/// data : [{"img":null,"name":"as"},{"img":null,"name":"doggy"},{"img":null,"name":"name"},{"img":null,"name":"namee"}]

class UserPetResponse {
  List<Pet> _pets;

  List<Pet> get data => _pets;

  UserPetResponse({List<Pet> data}) {
    _pets = data;
  }

  UserPetResponse.fromJson(dynamic json) {
    if (json["data"] != null) {
      _pets = [];
      json["data"].forEach((v) {
        _pets.add(Pet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_pets != null) {
      map["data"] = _pets.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
