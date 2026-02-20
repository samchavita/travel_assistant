part of 'generated.dart';

class UpdateUserAvatarVariablesBuilder {
  String userId;
  String avatarKey;

  final FirebaseDataConnect _dataConnect;
  UpdateUserAvatarVariablesBuilder(this._dataConnect, {required  this.userId,required  this.avatarKey,});
  Deserializer<UpdateUserAvatarData> dataDeserializer = (dynamic json)  => UpdateUserAvatarData.fromJson(jsonDecode(json));
  Serializer<UpdateUserAvatarVariables> varsSerializer = (UpdateUserAvatarVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateUserAvatarData, UpdateUserAvatarVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateUserAvatarData, UpdateUserAvatarVariables> ref() {
    UpdateUserAvatarVariables vars= UpdateUserAvatarVariables(userId: userId,avatarKey: avatarKey,);
    return _dataConnect.mutation("UpdateUserAvatar", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateUserAvatarUserUpdate {
  final String userId;
  UpdateUserAvatarUserUpdate.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserAvatarUserUpdate otherTyped = other as UpdateUserAvatarUserUpdate;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  UpdateUserAvatarUserUpdate({
    required this.userId,
  });
}

@immutable
class UpdateUserAvatarData {
  final UpdateUserAvatarUserUpdate? user_update;
  UpdateUserAvatarData.fromJson(dynamic json):
  
  user_update = json['user_update'] == null ? null : UpdateUserAvatarUserUpdate.fromJson(json['user_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserAvatarData otherTyped = other as UpdateUserAvatarData;
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

  UpdateUserAvatarData({
    this.user_update,
  });
}

@immutable
class UpdateUserAvatarVariables {
  final String userId;
  final String avatarKey;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateUserAvatarVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']),
  avatarKey = nativeFromJson<String>(json['avatarKey']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserAvatarVariables otherTyped = other as UpdateUserAvatarVariables;
    return userId == otherTyped.userId && 
    avatarKey == otherTyped.avatarKey;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, avatarKey.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['avatarKey'] = nativeToJson<String>(avatarKey);
    return json;
  }

  UpdateUserAvatarVariables({
    required this.userId,
    required this.avatarKey,
  });
}

