part of 'generated.dart';

class CreatePlaceVariablesBuilder {
  String name;
  Optional<String> _description = Optional.optional(nativeFromJson, nativeToJson);
  String coordinates;
  Optional<List<String>> _images = Optional.optional(listDeserializer(nativeFromJson), listSerializer(nativeToJson));

  final FirebaseDataConnect _dataConnect;  CreatePlaceVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }
  CreatePlaceVariablesBuilder images(List<String>? t) {
   _images.value = t;
   return this;
  }

  CreatePlaceVariablesBuilder(this._dataConnect, {required  this.name,required  this.coordinates,});
  Deserializer<CreatePlaceData> dataDeserializer = (dynamic json)  => CreatePlaceData.fromJson(jsonDecode(json));
  Serializer<CreatePlaceVariables> varsSerializer = (CreatePlaceVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreatePlaceData, CreatePlaceVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreatePlaceData, CreatePlaceVariables> ref() {
    CreatePlaceVariables vars= CreatePlaceVariables(name: name,description: _description,coordinates: coordinates,images: _images,);
    return _dataConnect.mutation("CreatePlace", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreatePlacePlaceInsert {
  final String placeId;
  CreatePlacePlaceInsert.fromJson(dynamic json):
  
  placeId = nativeFromJson<String>(json['placeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreatePlacePlaceInsert otherTyped = other as CreatePlacePlaceInsert;
    return placeId == otherTyped.placeId;
    
  }
  @override
  int get hashCode => placeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['placeId'] = nativeToJson<String>(placeId);
    return json;
  }

  CreatePlacePlaceInsert({
    required this.placeId,
  });
}

@immutable
class CreatePlaceData {
  final CreatePlacePlaceInsert place_insert;
  CreatePlaceData.fromJson(dynamic json):
  
  place_insert = CreatePlacePlaceInsert.fromJson(json['place_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreatePlaceData otherTyped = other as CreatePlaceData;
    return place_insert == otherTyped.place_insert;
    
  }
  @override
  int get hashCode => place_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['place_insert'] = place_insert.toJson();
    return json;
  }

  CreatePlaceData({
    required this.place_insert,
  });
}

@immutable
class CreatePlaceVariables {
  final String name;
  late final Optional<String>description;
  final String coordinates;
  late final Optional<List<String>>images;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreatePlaceVariables.fromJson(Map<String, dynamic> json):
  
  name = nativeFromJson<String>(json['name']),
  coordinates = nativeFromJson<String>(json['coordinates']) {
  
  
  
    description = Optional.optional(nativeFromJson, nativeToJson);
    description.value = json['description'] == null ? null : nativeFromJson<String>(json['description']);
  
  
  
    images = Optional.optional(listDeserializer(nativeFromJson), listSerializer(nativeToJson));
    images.value = json['images'] == null ? null : (json['images'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList();
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreatePlaceVariables otherTyped = other as CreatePlaceVariables;
    return name == otherTyped.name && 
    description == otherTyped.description && 
    coordinates == otherTyped.coordinates && 
    images == otherTyped.images;
    
  }
  @override
  int get hashCode => Object.hashAll([name.hashCode, description.hashCode, coordinates.hashCode, images.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    if(description.state == OptionalState.set) {
      json['description'] = description.toJson();
    }
    json['coordinates'] = nativeToJson<String>(coordinates);
    if(images.state == OptionalState.set) {
      json['images'] = images.toJson();
    }
    return json;
  }

  CreatePlaceVariables({
    required this.name,
    required this.description,
    required this.coordinates,
    required this.images,
  });
}

