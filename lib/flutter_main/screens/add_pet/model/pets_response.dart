import 'package:petzola/flutter_main/common/model/pet.dart';

/// lookupGroups : [{"category":"SERVICE_PROFILE","lookups":[{"code":"SERVICE_TYPE","lookupLocales":[{"language":"en","lookupData":[{"name":"Grooming","additionalInfo":null,"displaySequence":1}]}]}]},{"category":"PET_PROFILE","lookups":[{"code":"PET_TYPE","lookupLocales":[{"language":"en","lookupData":[{"name":"Dog","additionalInfo":"dogBreed=German Shepherd,German Shepherd Pit Bull,Boxer,Labrador Retriever,Great Dane,Saint Bernard,Rottweiler,Doberman Pinscher,Dalmatian,Bulldog,Neapolitan Mastiff,Old English Sheepdog\n","displaySequence":1},{"name":"Cat","additionalInfo":"catBreed=Abyssinian,Aegean,American Bobtail,American Curl,American Ringtail,American Shorthair,American Wirehair,Aphrodite Giant,Arabian Mau,Asian,Asian Semi-longhair","displaySequence":2},{"name":"Fish","additionalInfo":null,"displaySequence":3},{"name":"Parrot","additionalInfo":null,"displaySequence":4},{"name":"Camels","additionalInfo":null,"displaySequence":5},{"name":"Horse","additionalInfo":null,"displaySequence":6},{"name":"Hamsters","additionalInfo":null,"displaySequence":7},{"name":"Indoor Birds","additionalInfo":null,"displaySequence":8},{"name":"Eagle","additionalInfo":null,"displaySequence":9},{"name":"Rabbit","additionalInfo":null,"displaySequence":10},{"name":"Rats and mice","additionalInfo":null,"displaySequence":11},{"name":"Reptiles","additionalInfo":null,"displaySequence":12},{"name":"Amphibian","additionalInfo":null,"displaySequence":13},{"name":"Falcon","additionalInfo":null,"displaySequence":14},{"name":"Parakeet","additionalInfo":null,"displaySequence":15},{"name":"Ferrets","additionalInfo":null,"displaySequence":16},{"name":"Rats","additionalInfo":null,"displaySequence":17},{"name":"Wild Animals","additionalInfo":null,"displaySequence":18}]}]}]},{"category":"DOCTOR_PROFILE","lookups":[{"code":"SPECIALITY","lookupLocales":[{"language":"en","lookupData":[{"name":"General consultation","additionalInfo":null,"displaySequence":1},{"name":"Vaccinations","additionalInfo":null,"displaySequence":2},{"name":"Certification","additionalInfo":null,"displaySequence":3},{"name":"Dentistry","additionalInfo":null,"displaySequence":4},{"name":"Internal Medicine","additionalInfo":null,"displaySequence":5},{"name":"Digestive System","additionalInfo":null,"displaySequence":6},{"name":"Dermatology","additionalInfo":null,"displaySequence":7},{"name":"Cardiology","additionalInfo":null,"displaySequence":8},{"name":"Neurology","additionalInfo":null,"displaySequence":9},{"name":"Orthopedics/Bones","additionalInfo":null,"displaySequence":10},{"name":"Microchips implanting","additionalInfo":null,"displaySequence":11},{"name":"Surgery","additionalInfo":null,"displaySequence":12},{"name":"bone surgery & lameness","additionalInfo":null,"displaySequence":13},{"name":"Soft tissue Surgery","additionalInfo":null,"displaySequence":14},{"name":"Orthopedic Surgery","additionalInfo":null,"displaySequence":15},{"name":"Gynecology","additionalInfo":null,"displaySequence":16},{"name":"Medical Care","additionalInfo":null,"displaySequence":17},{"name":"Fleas & Ticks Control Program","additionalInfo":null,"displaySequence":18},{"name":"Deworming","additionalInfo":null,"displaySequence":19},{"name":"Radiology & Ultra-Sonography","additionalInfo":null,"displaySequence":20},{"name":"Ultrasound","additionalInfo":null,"displaySequence":21},{"name":"Sedation","additionalInfo":null,"displaySequence":22},{"name":"X-Ray","additionalInfo":null,"displaySequence":23},{"name":"Digital X-ray","additionalInfo":null,"displaySequence":24},{"name":"Dental X-ray","additionalInfo":null,"displaySequence":25},{"name":"Holistic Medicine","additionalInfo":null,"displaySequence":26},{"name":"Acupuncture","additionalInfo":null,"displaySequence":27},{"name":"Preventative Medicine","additionalInfo":null,"displaySequence":28},{"name":"Exotic Medicine","additionalInfo":null,"displaySequence":29}]}]},{"code":"VISIT_TYPE","lookupLocales":[{"language":"en","lookupData":[{"name":"Physical","additionalInfo":null,"displaySequence":1},{"name":"Video","additionalInfo":null,"displaySequence":2}]}]}]}]

class PetsResponse {
  List<LookupGroups> _lookupGroups;

  List<LookupGroups> get lookupGroups => _lookupGroups;

  PetsResponse({
      List<LookupGroups> lookupGroups}){
    _lookupGroups = lookupGroups;
}

  PetsResponse.fromJson(dynamic json) {
    if (json["lookupGroups"] != null) {
      _lookupGroups = [];
      json["lookupGroups"].forEach((v) {
        _lookupGroups.add(LookupGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_lookupGroups != null) {
      map["lookupGroups"] = _lookupGroups.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category : "SERVICE_PROFILE"
/// lookups : [{"code":"SERVICE_TYPE","lookupLocales":[{"language":"en","lookupData":[{"name":"Grooming","additionalInfo":null,"displaySequence":1}]}]}]

class LookupGroups {
  String _category;
  List<Lookups> _lookups;

  String get category => _category;
  List<Lookups> get lookups => _lookups;

  LookupGroups({
      String category, 
      List<Lookups> lookups}){
    _category = category;
    _lookups = lookups;
}

  LookupGroups.fromJson(dynamic json) {
    _category = json["category"];
    if (json["lookups"] != null) {
      _lookups = [];
      json["lookups"].forEach((v) {
        _lookups.add(Lookups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["category"] = _category;
    if (_lookups != null) {
      map["lookups"] = _lookups.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// code : "SERVICE_TYPE"
/// lookupLocales : [{"language":"en","lookupData":[{"name":"Grooming","additionalInfo":null,"displaySequence":1}]}]

class Lookups {
  String _code;
  List<LookupLocales> _lookupLocales;

  String get code => _code;
  List<LookupLocales> get lookupLocales => _lookupLocales;

  Lookups({
      String code, 
      List<LookupLocales> lookupLocales}){
    _code = code;
    _lookupLocales = lookupLocales;
}

  Lookups.fromJson(dynamic json) {
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

/// language : "en"
/// lookupData : [{"name":"Grooming","additionalInfo":null,"displaySequence":1}]

class LookupLocales {
  String _language;
  List<Pet> _lookupData;

  String get language => _language;
  List<Pet> get lookupData => _lookupData;

  LookupLocales({
      String language, 
      List<Pet> lookupData}){
    _language = language;
    _lookupData = lookupData;
}

  LookupLocales.fromJson(dynamic json) {
    _language = json["language"];
    if (json["lookupData"] != null) {
      _lookupData = [];
      json["lookupData"].forEach((v) {
        _lookupData.add(Pet.fromJson(v));
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
/// displaySequence : 1

