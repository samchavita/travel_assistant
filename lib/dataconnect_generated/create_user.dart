part of 'generated.dart';

class CreateUserVariablesBuilder {
  String displayname;
  String email;
  String password;

  final FirebaseDataConnect _dataConnect;
  CreateUserVariablesBuilder(this._dataConnect, {required  this.displayname,required  this.email,required  this.password,});
  Deserializer<CreateUserData> dataDeserializer = (dynamic json)  => CreateUserData.fromJson(jsonDecode(json));
  Serializer<CreateUserVariables> varsSerializer = (CreateUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateUserData, CreateUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateUserData, CreateUserVariables> ref() {
    CreateUserVariables vars= CreateUserVariables(displayname: displayname,email: email,password: password,);
    return _dataConnect.mutation("CreateUser", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateUserUserInsert {
  final String userId;
  CreateUserUserInsert.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateUserUserInsert otherTyped = other as CreateUserUserInsert;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  CreateUserUserInsert({
    required this.userId,
  });
}

@immutable
class CreateUserData {
  final CreateUserUserInsert user_insert;
  CreateUserData.fromJson(dynamic json):
  
  user_insert = CreateUserUserInsert.fromJson(json['user_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateUserData otherTyped = other as CreateUserData;
    return user_insert == otherTyped.user_insert;
    
  }
  @override
  int get hashCode => user_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_insert'] = user_insert.toJson();
    return json;
  }

  CreateUserData({
    required this.user_insert,
  });
}

@immutable
class CreateUserVariables {
  final String displayname;
  final String email;
  final String password;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateUserVariables.fromJson(Map<String, dynamic> json):
  
  displayname = nativeFromJson<String>(json['displayname']),
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

    final CreateUserVariables otherTyped = other as CreateUserVariables;
    return displayname == otherTyped.displayname && 
    email == otherTyped.email && 
    password == otherTyped.password;
    
  }
  @override
  int get hashCode => Object.hashAll([displayname.hashCode, email.hashCode, password.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['displayname'] = nativeToJson<String>(displayname);
    json['email'] = nativeToJson<String>(email);
    json['password'] = nativeToJson<String>(password);
    return json;
  }

  CreateUserVariables({
    required this.displayname,
    required this.email,
    required this.password,
  });
}

