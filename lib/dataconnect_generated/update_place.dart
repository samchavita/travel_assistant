part of 'generated.dart';

class UpdatePlaceVariablesBuilder {
  String placeId;
  Optional<String> _name = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _description = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _coordinates = Optional.optional(nativeFromJson, nativeToJson);
  Optional<List<String>> _images = Optional.optional(listDeserializer(nativeFromJson), listSerializer(nativeToJson));

  final FirebaseDataConnect _dataConnect;  UpdatePlaceVariablesBuilder name(String? t) {
   _name.value = t;
   return this;
  }
  UpdatePlaceVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }
  UpdatePlaceVariablesBuilder coordinates(String? t) {
   _coordinates.value = t;
   return this;
  }
  UpdatePlaceVariablesBuilder images(List<String>? t) {
   _images.value = t;
   return this;
  }

  UpdatePlaceVariablesBuilder(this._dataConnect, {required  this.placeId,});
  Deserializer<UpdatePlaceData> dataDeserializer = (dynamic json)  => UpdatePlaceData.fromJson(jsonDecode(json));
  Serializer<UpdatePlaceVariables> varsSerializer = (UpdatePlaceVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdatePlaceData, UpdatePlaceVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdatePlaceData, UpdatePlaceVariables> ref() {
    UpdatePlaceVariables vars= UpdatePlaceVariables(placeId: placeId,name: _name,description: _description,coordinates: _coordinates,images: _images,);
    return _dataConnect.mutation("UpdatePlace", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdatePlacePlaceUpdate {
  final String placeId;
  UpdatePlacePlaceUpdate.fromJson(dynamic json):
  
  placeId = nativeFromJson<String>(json['placeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdatePlacePlaceUpdate otherTyped = other as UpdatePlacePlaceUpdate;
    return placeId == otherTyped.placeId;
    
  }
  @override
  int get hashCode => placeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['placeId'] = nativeToJson<String>(placeId);
    return json;
  }

  UpdatePlacePlaceUpdate({
    required this.placeId,
  });
}

@immutable
class UpdatePlaceData {
  final UpdatePlacePlaceUpdate? place_update;
  UpdatePlaceData.fromJson(dynamic json):
  
  place_update = json['place_update'] == null ? null : UpdatePlacePlaceUpdate.fromJson(json['place_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdatePlaceData otherTyped = other as UpdatePlaceData;
    return place_update == otherTyped.place_update;
    
  }
  @override
  int get hashCode => place_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (place_update != null) {
      json['place_update'] = place_update!.toJson();
    }
    return json;
  }

  UpdatePlaceData({
    this.place_update,
  });
}

@immutable
class UpdatePlaceVariables {
  final String placeId;
  late final Optional<String>name;
  late final Optional<String>description;
  late final Optional<String>coordinates;
  late final Optional<List<String>>images;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdatePlaceVariables.fromJson(Map<String, dynamic> json):
  
  placeId = nativeFromJson<String>(json['placeId']) {
  
  
  
    name = Optional.optional(nativeFromJson, nativeToJson);
    name.value = json['name'] == null ? null : nativeFromJson<String>(json['name']);
  
  
    description = Optional.optional(nativeFromJson, nativeToJson);
    description.value = json['description'] == null ? null : nativeFromJson<String>(json['description']);
  
  
    coordinates = Optional.optional(nativeFromJson, nativeToJson);
    coordinates.value = json['coordinates'] == null ? null : nativeFromJson<String>(json['coordinates']);
  
  
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

    final UpdatePlaceVariables otherTyped = other as UpdatePlaceVariables;
    return placeId == otherTyped.placeId && 
    name == otherTyped.name && 
    description == otherTyped.description && 
    coordinates == otherTyped.coordinates && 
    images == otherTyped.images;
    
  }
  @override
  int get hashCode => Object.hashAll([placeId.hashCode, name.hashCode, description.hashCode, coordinates.hashCode, images.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['placeId'] = nativeToJson<String>(placeId);
    if(name.state == OptionalState.set) {
      json['name'] = name.toJson();
    }
    if(description.state == OptionalState.set) {
      json['description'] = description.toJson();
    }
    if(coordinates.state == OptionalState.set) {
      json['coordinates'] = coordinates.toJson();
    }
    if(images.state == OptionalState.set) {
      json['images'] = images.toJson();
    }
    return json;
  }

  UpdatePlaceVariables({
    required this.placeId,
    required this.name,
    required this.description,
    required this.coordinates,
    required this.images,
  });
}

