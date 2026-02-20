part of 'generated.dart';

class GetUserByEmailVariablesBuilder {
  String email;

  final FirebaseDataConnect _dataConnect;
  GetUserByEmailVariablesBuilder(this._dataConnect, {required  this.email,});
  Deserializer<GetUserByEmailData> dataDeserializer = (dynamic json)  => GetUserByEmailData.fromJson(jsonDecode(json));
  Serializer<GetUserByEmailVariables> varsSerializer = (GetUserByEmailVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserByEmailData, GetUserByEmailVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetUserByEmailData, GetUserByEmailVariables> ref() {
    GetUserByEmailVariables vars= GetUserByEmailVariables(email: email,);
    return _dataConnect.query("GetUserByEmail", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetUserByEmailUsers {
  final String userId;
  final String email;
  final String displayname;
  final Timestamp createdAt;
  final String avatarKey;
  final String type;
  GetUserByEmailUsers.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']),
  email = nativeFromJson<String>(json['email']),
  displayname = nativeFromJson<String>(json['displayname']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  avatarKey = nativeFromJson<String>(json['avatarKey']),
  type = nativeFromJson<String>(json['type']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByEmailUsers otherTyped = other as GetUserByEmailUsers;
    return userId == otherTyped.userId && 
    email == otherTyped.email && 
    displayname == otherTyped.displayname && 
    createdAt == otherTyped.createdAt && 
    avatarKey == otherTyped.avatarKey && 
    type == otherTyped.type;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, email.hashCode, displayname.hashCode, createdAt.hashCode, avatarKey.hashCode, type.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['email'] = nativeToJson<String>(email);
    json['displayname'] = nativeToJson<String>(displayname);
    json['createdAt'] = createdAt.toJson();
    json['avatarKey'] = nativeToJson<String>(avatarKey);
    json['type'] = nativeToJson<String>(type);
    return json;
  }

  GetUserByEmailUsers({
    required this.userId,
    required this.email,
    required this.displayname,
    required this.createdAt,
    required this.avatarKey,
    required this.type,
  });
}

@immutable
class GetUserByEmailData {
  final List<GetUserByEmailUsers> users;
  GetUserByEmailData.fromJson(dynamic json):
  
  users = (json['users'] as List<dynamic>)
        .map((e) => GetUserByEmailUsers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByEmailData otherTyped = other as GetUserByEmailData;
    return users == otherTyped.users;
    
  }
  @override
  int get hashCode => users.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['users'] = users.map((e) => e.toJson()).toList();
    return json;
  }

  GetUserByEmailData({
    required this.users,
  });
}

@immutable
class GetUserByEmailVariables {
  final String email;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetUserByEmailVariables.fromJson(Map<String, dynamic> json):
  
  email = nativeFromJson<String>(json['email']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByEmailVariables otherTyped = other as GetUserByEmailVariables;
    return email == otherTyped.email;
    
  }
  @override
  int get hashCode => email.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    return json;
  }

  GetUserByEmailVariables({
    required this.email,
  });
}

