part of 'generated.dart';

class IsAdminVariablesBuilder {
  String userId;

  final FirebaseDataConnect _dataConnect;
  IsAdminVariablesBuilder(this._dataConnect, {required  this.userId,});
  Deserializer<IsAdminData> dataDeserializer = (dynamic json)  => IsAdminData.fromJson(jsonDecode(json));
  Serializer<IsAdminVariables> varsSerializer = (IsAdminVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<IsAdminData, IsAdminVariables>> execute() {
    return ref().execute();
  }

  QueryRef<IsAdminData, IsAdminVariables> ref() {
    IsAdminVariables vars= IsAdminVariables(userId: userId,);
    return _dataConnect.query("IsAdmin", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class IsAdminUser {
  final String type;
  IsAdminUser.fromJson(dynamic json):
  
  type = nativeFromJson<String>(json['type']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final IsAdminUser otherTyped = other as IsAdminUser;
    return type == otherTyped.type;
    
  }
  @override
  int get hashCode => type.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['type'] = nativeToJson<String>(type);
    return json;
  }

  IsAdminUser({
    required this.type,
  });
}

@immutable
class IsAdminData {
  final IsAdminUser? user;
  IsAdminData.fromJson(dynamic json):
  
  user = json['user'] == null ? null : IsAdminUser.fromJson(json['user']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final IsAdminData otherTyped = other as IsAdminData;
    return user == otherTyped.user;
    
  }
  @override
  int get hashCode => user.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (user != null) {
      json['user'] = user!.toJson();
    }
    return json;
  }

  IsAdminData({
    this.user,
  });
}

@immutable
class IsAdminVariables {
  final String userId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  IsAdminVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final IsAdminVariables otherTyped = other as IsAdminVariables;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  IsAdminVariables({
    required this.userId,
  });
}

