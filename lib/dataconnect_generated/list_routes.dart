part of 'generated.dart';

class ListRoutesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListRoutesVariablesBuilder(this._dataConnect, );
  Deserializer<ListRoutesData> dataDeserializer = (dynamic json)  => ListRoutesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListRoutesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListRoutesData, void> ref() {
    
    return _dataConnect.query("ListRoutes", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListRoutesRoutes {
  final String routeId;
  final String name;
  final String? description;
  final String userId;
  final Timestamp createdAt;
  ListRoutesRoutes.fromJson(dynamic json):
  
  routeId = nativeFromJson<String>(json['routeId']),
  name = nativeFromJson<String>(json['name']),
  description = json['description'] == null ? null : nativeFromJson<String>(json['description']),
  userId = nativeFromJson<String>(json['userId']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListRoutesRoutes otherTyped = other as ListRoutesRoutes;
    return routeId == otherTyped.routeId && 
    name == otherTyped.name && 
    description == otherTyped.description && 
    userId == otherTyped.userId && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([routeId.hashCode, name.hashCode, description.hashCode, userId.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['routeId'] = nativeToJson<String>(routeId);
    json['name'] = nativeToJson<String>(name);
    if (description != null) {
      json['description'] = nativeToJson<String?>(description);
    }
    json['userId'] = nativeToJson<String>(userId);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListRoutesRoutes({
    required this.routeId,
    required this.name,
    this.description,
    required this.userId,
    required this.createdAt,
  });
}

@immutable
class ListRoutesData {
  final List<ListRoutesRoutes> routes;
  ListRoutesData.fromJson(dynamic json):
  
  routes = (json['routes'] as List<dynamic>)
        .map((e) => ListRoutesRoutes.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListRoutesData otherTyped = other as ListRoutesData;
    return routes == otherTyped.routes;
    
  }
  @override
  int get hashCode => routes.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['routes'] = routes.map((e) => e.toJson()).toList();
    return json;
  }

  ListRoutesData({
    required this.routes,
  });
}

