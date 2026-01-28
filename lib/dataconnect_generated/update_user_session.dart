part of 'generated.dart';

class UpdateUserSessionVariablesBuilder {
  String userId;
  String token;
  Timestamp expiry;

  final FirebaseDataConnect _dataConnect;
  UpdateUserSessionVariablesBuilder(this._dataConnect, {required  this.userId,required  this.token,required  this.expiry,});
  Deserializer<UpdateUserSessionData> dataDeserializer = (dynamic json)  => UpdateUserSessionData.fromJson(jsonDecode(json));
  Serializer<UpdateUserSessionVariables> varsSerializer = (UpdateUserSessionVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateUserSessionData, UpdateUserSessionVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateUserSessionData, UpdateUserSessionVariables> ref() {
    UpdateUserSessionVariables vars= UpdateUserSessionVariables(userId: userId,token: token,expiry: expiry,);
    return _dataConnect.mutation("UpdateUserSession", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateUserSessionUserUpdate {
  final String userId;
  UpdateUserSessionUserUpdate.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserSessionUserUpdate otherTyped = other as UpdateUserSessionUserUpdate;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  UpdateUserSessionUserUpdate({
    required this.userId,
  });
}

@immutable
class UpdateUserSessionData {
  final UpdateUserSessionUserUpdate? user_update;
  UpdateUserSessionData.fromJson(dynamic json):
  
  user_update = json['user_update'] == null ? null : UpdateUserSessionUserUpdate.fromJson(json['user_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserSessionData otherTyped = other as UpdateUserSessionData;
    return user_update == otherTyped.user_update;
    
  }
  @override
  int get hashCode => user_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (user_update != null) {
      json['user_update'] = user_update!.toJson();
    }
    return json;
  }

  UpdateUserSessionData({
    this.user_update,
  });
}

@immutable
class UpdateUserSessionVariables {
  final String userId;
  final String token;
  final Timestamp expiry;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateUserSessionVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']),
  token = nativeFromJson<String>(json['token']),
  expiry = Timestamp.fromJson(json['expiry']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserSessionVariables otherTyped = other as UpdateUserSessionVariables;
    return userId == otherTyped.userId && 
    token == otherTyped.token && 
    expiry == otherTyped.expiry;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, token.hashCode, expiry.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['token'] = nativeToJson<String>(token);
    json['expiry'] = expiry.toJson();
    return json;
  }

  UpdateUserSessionVariables({
    required this.userId,
    required this.token,
    required this.expiry,
  });
}

