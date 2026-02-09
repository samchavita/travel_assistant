part of 'generated.dart';

class GetUserAvatarKeyVariablesBuilder {
  String userId;

  final FirebaseDataConnect _dataConnect;
  GetUserAvatarKeyVariablesBuilder(this._dataConnect, {required  this.userId,});
  Deserializer<GetUserAvatarKeyData> dataDeserializer = (dynamic json)  => GetUserAvatarKeyData.fromJson(jsonDecode(json));
  Serializer<GetUserAvatarKeyVariables> varsSerializer = (GetUserAvatarKeyVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserAvatarKeyData, GetUserAvatarKeyVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetUserAvatarKeyData, GetUserAvatarKeyVariables> ref() {
    GetUserAvatarKeyVariables vars= GetUserAvatarKeyVariables(userId: userId,);
    return _dataConnect.query("GetUserAvatarKey", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetUserAvatarKeyUser {
  final String avatarKey;
  GetUserAvatarKeyUser.fromJson(dynamic json):
  
  avatarKey = nativeFromJson<String>(json['avatarKey']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserAvatarKeyUser otherTyped = other as GetUserAvatarKeyUser;
    return avatarKey == otherTyped.avatarKey;
    
  }
  @override
  int get hashCode => avatarKey.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['avatarKey'] = nativeToJson<String>(avatarKey);
    return json;
  }

  GetUserAvatarKeyUser({
    required this.avatarKey,
  });
}

@immutable
class GetUserAvatarKeyData {
  final GetUserAvatarKeyUser? user;
  GetUserAvatarKeyData.fromJson(dynamic json):
  
  user = json['user'] == null ? null : GetUserAvatarKeyUser.fromJson(json['user']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserAvatarKeyData otherTyped = other as GetUserAvatarKeyData;
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

  GetUserAvatarKeyData({
    this.user,
  });
}

@immutable
class GetUserAvatarKeyVariables {
  final String userId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetUserAvatarKeyVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserAvatarKeyVariables otherTyped = other as GetUserAvatarKeyVariables;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  GetUserAvatarKeyVariables({
    required this.userId,
  });
}

