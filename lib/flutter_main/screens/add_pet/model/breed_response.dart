import 'package:petzola/flutter_main/common/model/breed.dart';

/// code : "REFERENCE_LOOKUP"
/// lookupLocales : [{"language":null,"lookupData":[{"name":"German Shepherd","additionalInfo":null,"displaySequence":0},{"name":"German Shepherd Pit Bull","additionalInfo":null,"displaySequence":0},{"name":"Boxer","additionalInfo":null,"displaySequence":0},{"name":"Labrador Retriever","additionalInfo":null,"displaySequence":0},{"name":"Great Dane","additionalInfo":null,"displaySequence":0},{"name":"Saint Bernard","additionalInfo":null,"displaySequence":0},{"name":"Rottweiler","additionalInfo":null,"displaySequence":0},{"name":"Doberman Pinscher","additionalInfo":null,"displaySequence":0},{"name":"Dalmatian","additionalInfo":null,"displaySequence":0},{"name":"Bulldog","additionalInfo":null,"displaySequence":0},{"name":"Neapolitan Mastiff","additionalInfo":null,"displaySequence":0},{"name":"Old English Sheepdog\n","additionalInfo":null,"displaySequence":0}]}]

class BreedResponse {
  String _code;
  List<LookupLocales> _lookupLocales;

  String get code => _code;
  List<LookupLocales> get lookupLocales => _lookupLocales;

  BreedResponse({
      String code, 
      List<LookupLocales> lookupLocales}){
    _code = code;
    _lookupLocales = lookupLocales;
}

  BreedResponse.fromJson(dynamic json) {
    _code = json["code"];
    if (json["lookupLocales"] != null) {
      _lookupLocales = [];
      json["lookupLocales"].forEach((v) {
        _lookupLocales.add(LookupLocales.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    if (_lookupLocales != null) {
      map["lookupLocales"] = _lookupLocales.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// language : null
/// lookupData : [{"name":"German Shepherd","additionalInfo":null,"displaySequence":0},{"name":"German Shepherd Pit Bull","additionalInfo":null,"displaySequence":0},{"name":"Boxer","additionalInfo":null,"displaySequence":0},{"name":"Labrador Retriever","additionalInfo":null,"displaySequence":0},{"name":"Great Dane","additionalInfo":null,"displaySequence":0},{"name":"Saint Bernard","additionalInfo":null,"displaySequence":0},{"name":"Rottweiler","additionalInfo":null,"displaySequence":0},{"name":"Doberman Pinscher","additionalInfo":null,"displaySequence":0},{"name":"Dalmatian","additionalInfo":null,"displaySequence":0},{"name":"Bulldog","additionalInfo":null,"displaySequence":0},{"name":"Neapolitan Mastiff","additionalInfo":null,"displaySequence":0},{"name":"Old English Sheepdog\n","additionalInfo":null,"displaySequence":0}]

class LookupLocales {
  dynamic _language;
  List<Breed> _lookupData;

  dynamic get language => _language;
  List<Breed> get lookupData => _lookupData;

  LookupLocales({
      dynamic language, 
      List<Breed> lookupData}){
    _language = language;
    _lookupData = lookupData;
}

  LookupLocales.fromJson(dynamic json) {
    _language = json["language"];
    if (json["lookupData"] != null) {
      _lookupData = [];
      json["lookupData"].forEach((v) {
        _lookupData.add(Breed.fromJson(v));
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

