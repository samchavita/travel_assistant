part of 'generated.dart';

class GetPlaceVariablesBuilder {
  String placeId;

  final FirebaseDataConnect _dataConnect;
  GetPlaceVariablesBuilder(this._dataConnect, {required  this.placeId,});
  Deserializer<GetPlaceData> dataDeserializer = (dynamic json)  => GetPlaceData.fromJson(jsonDecode(json));
  Serializer<GetPlaceVariables> varsSerializer = (GetPlaceVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetPlaceData, GetPlaceVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetPlaceData, GetPlaceVariables> ref() {
    GetPlaceVariables vars= GetPlaceVariables(placeId: placeId,);
    return _dataConnect.query("GetPlace", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetPlacePlace {
  final String placeId;
  final String name;
  final String? description;
  final String coordinates;
  final List<String>? images;
  final Timestamp createdAt;
  GetPlacePlace.fromJson(dynamic json):
  
  placeId = nativeFromJson<String>(json['placeId']),
  name = nativeFromJson<String>(json['name']),
  description = json['description'] == null ? null : nativeFromJson<String>(json['description']),
  coordinates = nativeFromJson<String>(json['coordinates']),
  images = json['images'] == null ? null : (json['images'] as List<dynamic>)
        .map((e) => nativeFromJson<String>(e))
        .toList(),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetPlacePlace otherTyped = other as GetPlacePlace;
    return placeId == otherTyped.placeId && 
    name == otherTyped.name && 
    description == otherTyped.description && 
    coordinates == otherTyped.coordinates && 
    images == otherTyped.images && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([placeId.hashCode, name.hashCode, description.hashCode, coordinates.hashCode, images.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['placeId'] = nativeToJson<String>(placeId);
    json['name'] = nativeToJson<String>(name);
    if (description != null) {
      json['description'] = nativeToJson<String?>(description);
    }
    json['coordinates'] = nativeToJson<String>(coordinates);
    if (images != null) {
      json['images'] = images?.map((e) => nativeToJson<String>(e)).toList();
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  GetPlacePlace({
    required this.placeId,
    required this.name,
    this.description,
    required this.coordinates,
    this.images,
    required this.createdAt,
  });
}

@immutable
class GetPlaceData {
  final GetPlacePlace? place;
  GetPlaceData.fromJson(dynamic json):
  
  place = json['place'] == null ? null : GetPlacePlace.fromJson(json['place']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetPlaceData otherTyped = other as GetPlaceData;
    return place == otherTyped.place;
    
  }
  @override
  int get hashCode => place.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (place != null) {
      json['place'] = place!.toJson();
    }
    return json;
  }

  GetPlaceData({
    this.place,
  });
}

@immutable
class GetPlaceVariables {
  final String placeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetPlaceVariables.fromJson(Map<String, dynamic> json):
  
  placeId = nativeFromJson<String>(json['placeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetPlaceVariables otherTyped = other as GetPlaceVariables;
    return placeId == otherTyped.placeId;
    
  }
  @override
  int get hashCode => placeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['placeId'] = nativeToJson<String>(placeId);
    return json;
  }

  GetPlaceVariables({
    required this.placeId,
  });
}

