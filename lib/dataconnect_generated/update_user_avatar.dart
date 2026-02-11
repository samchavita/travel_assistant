part of 'generated.dart';

class UpdateUserAvatarVariablesBuilder {
  String email;
  String avatarKey;

  final FirebaseDataConnect _dataConnect;
  UpdateUserAvatarVariablesBuilder(this._dataConnect, {required  this.email,required  this.avatarKey,});
  Deserializer<UpdateUserAvatarData> dataDeserializer = (dynamic json)  => UpdateUserAvatarData.fromJson(jsonDecode(json));
  Serializer<UpdateUserAvatarVariables> varsSerializer = (UpdateUserAvatarVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateUserAvatarData, UpdateUserAvatarVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateUserAvatarData, UpdateUserAvatarVariables> ref() {
    UpdateUserAvatarVariables vars= UpdateUserAvatarVariables(email: email,avatarKey: avatarKey,);
    return _dataConnect.mutation("UpdateUserAvatar", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateUserAvatarData {
  final int user_updateMany;
  UpdateUserAvatarData.fromJson(dynamic json):
  
  user_updateMany = nativeFromJson<int>(json['user_updateMany']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserAvatarData otherTyped = other as UpdateUserAvatarData;
    return user_updateMany == otherTyped.user_updateMany;
    
  }
  @override
  int get hashCode => user_updateMany.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_updateMany'] = nativeToJson<int>(user_updateMany);
    return json;
  }

  UpdateUserAvatarData({
    required this.user_updateMany,
  });
}

@immutable
class UpdateUserAvatarVariables {
  final String email;
  final String avatarKey;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateUserAvatarVariables.fromJson(Map<String, dynamic> json):
  
  email = nativeFromJson<String>(json['email']),
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
    return email == otherTyped.email && 
    avatarKey == otherTyped.avatarKey;
    
  }
  @override
  int get hashCode => Object.hashAll([email.hashCode, avatarKey.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    json['avatarKey'] = nativeToJson<String>(avatarKey);
    return json;
  }

  UpdateUserAvatarVariables({
    required this.email,
    required this.avatarKey,
  });
}

