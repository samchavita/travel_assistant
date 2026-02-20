part of 'generated.dart';

class CreateAdminVariablesBuilder {
  String uid;
  String displayname;
  String email;

  final FirebaseDataConnect _dataConnect;
  CreateAdminVariablesBuilder(this._dataConnect, {required  this.uid,required  this.displayname,required  this.email,});
  Deserializer<CreateAdminData> dataDeserializer = (dynamic json)  => CreateAdminData.fromJson(jsonDecode(json));
  Serializer<CreateAdminVariables> varsSerializer = (CreateAdminVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateAdminData, CreateAdminVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateAdminData, CreateAdminVariables> ref() {
    CreateAdminVariables vars= CreateAdminVariables(uid: uid,displayname: displayname,email: email,);
    return _dataConnect.mutation("CreateAdmin", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateAdminUserInsert {
  final String userId;
  CreateAdminUserInsert.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateAdminUserInsert otherTyped = other as CreateAdminUserInsert;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  CreateAdminUserInsert({
    required this.userId,
  });
}

@immutable
class CreateAdminData {
  final CreateAdminUserInsert user_insert;
  CreateAdminData.fromJson(dynamic json):
  
  user_insert = CreateAdminUserInsert.fromJson(json['user_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateAdminData otherTyped = other as CreateAdminData;
    return user_insert == otherTyped.user_insert;
    
  }
  @override
  int get hashCode => user_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_insert'] = user_insert.toJson();
    return json;
  }

  CreateAdminData({
    required this.user_insert,
  });
}

@immutable
class CreateAdminVariables {
  final String uid;
  final String displayname;
  final String email;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateAdminVariables.fromJson(Map<String, dynamic> json):
  
  uid = nativeFromJson<String>(json['uid']),
  displayname = nativeFromJson<String>(json['displayname']),
  email = nativeFromJson<String>(json['email']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateAdminVariables otherTyped = other as CreateAdminVariables;
    return uid == otherTyped.uid && 
    displayname == otherTyped.displayname && 
    email == otherTyped.email;
    
  }
  @override
  int get hashCode => Object.hashAll([uid.hashCode, displayname.hashCode, email.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['uid'] = nativeToJson<String>(uid);
    json['displayname'] = nativeToJson<String>(displayname);
    json['email'] = nativeToJson<String>(email);
    return json;
  }

  CreateAdminVariables({
    required this.uid,
    required this.displayname,
    required this.email,
  });
}

