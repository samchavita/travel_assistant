part of 'generated.dart';

class GetRouteVariablesBuilder {
  String routeId;

  final FirebaseDataConnect _dataConnect;
  GetRouteVariablesBuilder(this._dataConnect, {required  this.routeId,});
  Deserializer<GetRouteData> dataDeserializer = (dynamic json)  => GetRouteData.fromJson(jsonDecode(json));
  Serializer<GetRouteVariables> varsSerializer = (GetRouteVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetRouteData, GetRouteVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetRouteData, GetRouteVariables> ref() {
    GetRouteVariables vars= GetRouteVariables(routeId: routeId,);
    return _dataConnect.query("GetRoute", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetRouteRoute {
  final String routeId;
  final String name;
  final String? description;
  final String userId;
  final Timestamp createdAt;
  GetRouteRoute.fromJson(dynamic json):
  
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

    final GetRouteRoute otherTyped = other as GetRouteRoute;
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

  GetRouteRoute({
    required this.routeId,
    required this.name,
    this.description,
    required this.userId,
    required this.createdAt,
  });
}

@immutable
class GetRouteData {
  final GetRouteRoute? route;
  GetRouteData.fromJson(dynamic json):
  
  route = json['route'] == null ? null : GetRouteRoute.fromJson(json['route']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetRouteData otherTyped = other as GetRouteData;
    return route == otherTyped.route;
    
  }
  @override
  int get hashCode => route.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (route != null) {
      json['route'] = route!.toJson();
    }
    return json;
  }

  GetRouteData({
    this.route,
  });
}

@immutable
class GetRouteVariables {
  final String routeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetRouteVariables.fromJson(Map<String, dynamic> json):
  
  routeId = nativeFromJson<String>(json['routeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetRouteVariables otherTyped = other as GetRouteVariables;
    return routeId == otherTyped.routeId;
    
  }
  @override
  int get hashCode => routeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['routeId'] = nativeToJson<String>(routeId);
    return json;
  }

  GetRouteVariables({
    required this.routeId,
  });
}

