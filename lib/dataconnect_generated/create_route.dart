part of 'generated.dart';

class CreateRouteVariablesBuilder {
  String userId;
  String name;
  Optional<String> _description = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  CreateRouteVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }

  CreateRouteVariablesBuilder(this._dataConnect, {required  this.userId,required  this.name,});
  Deserializer<CreateRouteData> dataDeserializer = (dynamic json)  => CreateRouteData.fromJson(jsonDecode(json));
  Serializer<CreateRouteVariables> varsSerializer = (CreateRouteVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateRouteData, CreateRouteVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateRouteData, CreateRouteVariables> ref() {
    CreateRouteVariables vars= CreateRouteVariables(userId: userId,name: name,description: _description,);
    return _dataConnect.mutation("CreateRoute", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateRouteRouteInsert {
  final String routeId;
  CreateRouteRouteInsert.fromJson(dynamic json):
  
  routeId = nativeFromJson<String>(json['routeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateRouteRouteInsert otherTyped = other as CreateRouteRouteInsert;
    return routeId == otherTyped.routeId;
    
  }
  @override
  int get hashCode => routeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['routeId'] = nativeToJson<String>(routeId);
    return json;
  }

  CreateRouteRouteInsert({
    required this.routeId,
  });
}

@immutable
class CreateRouteData {
  final CreateRouteRouteInsert route_insert;
  CreateRouteData.fromJson(dynamic json):
  
  route_insert = CreateRouteRouteInsert.fromJson(json['route_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateRouteData otherTyped = other as CreateRouteData;
    return route_insert == otherTyped.route_insert;
    
  }
  @override
  int get hashCode => route_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['route_insert'] = route_insert.toJson();
    return json;
  }

  CreateRouteData({
    required this.route_insert,
  });
}

@immutable
class CreateRouteVariables {
  final String userId;
  final String name;
  late final Optional<String>description;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateRouteVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']),
  name = nativeFromJson<String>(json['name']) {
  
  
  
  
    description = Optional.optional(nativeFromJson, nativeToJson);
    description.value = json['description'] == null ? null : nativeFromJson<String>(json['description']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateRouteVariables otherTyped = other as CreateRouteVariables;
    return userId == otherTyped.userId && 
    name == otherTyped.name && 
    description == otherTyped.description;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, name.hashCode, description.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['name'] = nativeToJson<String>(name);
    if(description.state == OptionalState.set) {
      json['description'] = description.toJson();
    }
    return json;
  }

  CreateRouteVariables({
    required this.userId,
    required this.name,
    required this.description,
  });
}

