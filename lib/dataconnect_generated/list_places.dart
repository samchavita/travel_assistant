part of 'generated.dart';

class ListPlacesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListPlacesVariablesBuilder(this._dataConnect, );
  Deserializer<ListPlacesData> dataDeserializer = (dynamic json)  => ListPlacesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListPlacesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListPlacesData, void> ref() {
    
    return _dataConnect.query("ListPlaces", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListPlacesPlaces {
  final String placeId;
  final String name;
  final String? description;
  final String coordinates;
  final List<String>? images;
  final Timestamp createdAt;
  ListPlacesPlaces.fromJson(dynamic json):
  
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

    final ListPlacesPlaces otherTyped = other as ListPlacesPlaces;
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

  ListPlacesPlaces({
    required this.placeId,
    required this.name,
    this.description,
    required this.coordinates,
    this.images,
    required this.createdAt,
  });
}

@immutable
class ListPlacesData {
  final List<ListPlacesPlaces> places;
  ListPlacesData.fromJson(dynamic json):
  
  places = (json['places'] as List<dynamic>)
        .map((e) => ListPlacesPlaces.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListPlacesData otherTyped = other as ListPlacesData;
    return places == otherTyped.places;
    
  }
  @override
  int get hashCode => places.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['places'] = places.map((e) => e.toJson()).toList();
    return json;
  }

  ListPlacesData({
    required this.places,
  });
}

