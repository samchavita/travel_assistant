part of 'generated.dart';

class UpdateUserVariablesBuilder {
  String userId;
  Optional<String> _displayname = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _email = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _password = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  UpdateUserVariablesBuilder displayname(String? t) {
   _displayname.value = t;
   return this;
  }
  UpdateUserVariablesBuilder email(String? t) {
   _email.value = t;
   return this;
  }
  UpdateUserVariablesBuilder password(String? t) {
   _password.value = t;
   return this;
  }

  UpdateUserVariablesBuilder(this._dataConnect, {required  this.userId,});
  Deserializer<UpdateUserData> dataDeserializer = (dynamic json)  => UpdateUserData.fromJson(jsonDecode(json));
  Serializer<UpdateUserVariables> varsSerializer = (UpdateUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateUserData, UpdateUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateUserData, UpdateUserVariables> ref() {
    UpdateUserVariables vars= UpdateUserVariables(userId: userId,displayname: _displayname,email: _email,password: _password,);
    return _dataConnect.mutation("UpdateUser", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateUserUserUpdate {
  final String userId;
  UpdateUserUserUpdate.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserUserUpdate otherTyped = other as UpdateUserUserUpdate;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  UpdateUserUserUpdate({
    required this.userId,
  });
}

@immutable
class UpdateUserData {
  final UpdateUserUserUpdate? user_update;
  UpdateUserData.fromJson(dynamic json):
  
  user_update = json['user_update'] == null ? null : UpdateUserUserUpdate.fromJson(json['user_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserData otherTyped = other as UpdateUserData;
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

  UpdateUserData({
    this.user_update,
  });
}

@immutable
class UpdateUserVariables {
  final String userId;
  late final Optional<String>displayname;
  late final Optional<String>email;
  late final Optional<String>password;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateUserVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']) {
  
  
  
    displayname = Optional.optional(nativeFromJson, nativeToJson);
    displayname.value = json['displayname'] == null ? null : nativeFromJson<String>(json['displayname']);
  
  
    email = Optional.optional(nativeFromJson, nativeToJson);
    email.value = json['email'] == null ? null : nativeFromJson<String>(json['email']);
  
  
    password = Optional.optional(nativeFromJson, nativeToJson);
    password.value = json['password'] == null ? null : nativeFromJson<String>(json['password']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserVariables otherTyped = other as UpdateUserVariables;
    return userId == otherTyped.userId && 
    displayname == otherTyped.displayname && 
    email == otherTyped.email && 
    password == otherTyped.password;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, displayname.hashCode, email.hashCode, password.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    if(displayname.state == OptionalState.set) {
      json['displayname'] = displayname.toJson();
    }
    if(email.state == OptionalState.set) {
      json['email'] = email.toJson();
    }
    if(password.state == OptionalState.set) {
      json['password'] = password.toJson();
    }
    return json;
  }

  UpdateUserVariables({
    required this.userId,
    required this.displayname,
    required this.email,
    required this.password,
  });
}

