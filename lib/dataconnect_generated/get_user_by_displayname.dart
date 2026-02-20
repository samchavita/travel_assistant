part of 'generated.dart';

class GetUserByDisplaynameVariablesBuilder {
  String displayname;

  final FirebaseDataConnect _dataConnect;
  GetUserByDisplaynameVariablesBuilder(this._dataConnect, {required  this.displayname,});
  Deserializer<GetUserByDisplaynameData> dataDeserializer = (dynamic json)  => GetUserByDisplaynameData.fromJson(jsonDecode(json));
  Serializer<GetUserByDisplaynameVariables> varsSerializer = (GetUserByDisplaynameVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserByDisplaynameData, GetUserByDisplaynameVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetUserByDisplaynameData, GetUserByDisplaynameVariables> ref() {
    GetUserByDisplaynameVariables vars= GetUserByDisplaynameVariables(displayname: displayname,);
    return _dataConnect.query("GetUserByDisplayname", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetUserByDisplaynameUsers {
  final String userId;
  final String email;
  final String displayname;
  final Timestamp createdAt;
  GetUserByDisplaynameUsers.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']),
  email = nativeFromJson<String>(json['email']),
  displayname = nativeFromJson<String>(json['displayname']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByDisplaynameUsers otherTyped = other as GetUserByDisplaynameUsers;
    return userId == otherTyped.userId && 
    email == otherTyped.email && 
    displayname == otherTyped.displayname && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, email.hashCode, displayname.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['email'] = nativeToJson<String>(email);
    json['displayname'] = nativeToJson<String>(displayname);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  GetUserByDisplaynameUsers({
    required this.userId,
    required this.email,
    required this.displayname,
    required this.createdAt,
  });
}

@immutable
class GetUserByDisplaynameData {
  final List<GetUserByDisplaynameUsers> users;
  GetUserByDisplaynameData.fromJson(dynamic json):
  
  users = (json['users'] as List<dynamic>)
        .map((e) => GetUserByDisplaynameUsers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByDisplaynameData otherTyped = other as GetUserByDisplaynameData;
    return users == otherTyped.users;
    
  }
  @override
  int get hashCode => users.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['users'] = users.map((e) => e.toJson()).toList();
    return json;
  }

  GetUserByDisplaynameData({
    required this.users,
  });
}

@immutable
class GetUserByDisplaynameVariables {
  final String displayname;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetUserByDisplaynameVariables.fromJson(Map<String, dynamic> json):
  
  displayname = nativeFromJson<String>(json['displayname']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByDisplaynameVariables otherTyped = other as GetUserByDisplaynameVariables;
    return displayname == otherTyped.displayname;
    
  }
  @override
  int get hashCode => displayname.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['displayname'] = nativeToJson<String>(displayname);
    return json;
  }

  GetUserByDisplaynameVariables({
    required this.displayname,
  });
}

