part of 'generated.dart';

class UpdateUserPasswordVariablesBuilder {
  String email;
  String password;

  final FirebaseDataConnect _dataConnect;
  UpdateUserPasswordVariablesBuilder(this._dataConnect, {required  this.email,required  this.password,});
  Deserializer<UpdateUserPasswordData> dataDeserializer = (dynamic json)  => UpdateUserPasswordData.fromJson(jsonDecode(json));
  Serializer<UpdateUserPasswordVariables> varsSerializer = (UpdateUserPasswordVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateUserPasswordData, UpdateUserPasswordVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateUserPasswordData, UpdateUserPasswordVariables> ref() {
    UpdateUserPasswordVariables vars= UpdateUserPasswordVariables(email: email,password: password,);
    return _dataConnect.mutation("UpdateUserPassword", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateUserPasswordData {
  final int user_updateMany;
  UpdateUserPasswordData.fromJson(dynamic json):
  
  user_updateMany = nativeFromJson<int>(json['user_updateMany']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserPasswordData otherTyped = other as UpdateUserPasswordData;
    return user_updateMany == otherTyped.user_updateMany;
    
  }
  @override
  int get hashCode => user_updateMany.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_updateMany'] = nativeToJson<int>(user_updateMany);
    return json;
  }

  UpdateUserPasswordData({
    required this.user_updateMany,
  });
}

@immutable
class UpdateUserPasswordVariables {
  final String email;
  final String password;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateUserPasswordVariables.fromJson(Map<String, dynamic> json):
  
  email = nativeFromJson<String>(json['email']),
  password = nativeFromJson<String>(json['password']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateUserPasswordVariables otherTyped = other as UpdateUserPasswordVariables;
    return email == otherTyped.email && 
    password == otherTyped.password;
    
  }
  @override
  int get hashCode => Object.hashAll([email.hashCode, password.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    json['password'] = nativeToJson<String>(password);
    return json;
  }

  UpdateUserPasswordVariables({
    required this.email,
    required this.password,
  });
}

