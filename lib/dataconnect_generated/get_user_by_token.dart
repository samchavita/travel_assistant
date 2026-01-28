part of 'generated.dart';

class GetUserByTokenVariablesBuilder {
  String token;

  final FirebaseDataConnect _dataConnect;
  GetUserByTokenVariablesBuilder(this._dataConnect, {required  this.token,});
  Deserializer<GetUserByTokenData> dataDeserializer = (dynamic json)  => GetUserByTokenData.fromJson(jsonDecode(json));
  Serializer<GetUserByTokenVariables> varsSerializer = (GetUserByTokenVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUserByTokenData, GetUserByTokenVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetUserByTokenData, GetUserByTokenVariables> ref() {
    GetUserByTokenVariables vars= GetUserByTokenVariables(token: token,);
    return _dataConnect.query("GetUserByToken", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetUserByTokenUsers {
  final String userId;
  final String displayname;
  final Timestamp? sessionExpiry;
  GetUserByTokenUsers.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']),
  displayname = nativeFromJson<String>(json['displayname']),
  sessionExpiry = json['sessionExpiry'] == null ? null : Timestamp.fromJson(json['sessionExpiry']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByTokenUsers otherTyped = other as GetUserByTokenUsers;
    return userId == otherTyped.userId && 
    displayname == otherTyped.displayname && 
    sessionExpiry == otherTyped.sessionExpiry;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, displayname.hashCode, sessionExpiry.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['displayname'] = nativeToJson<String>(displayname);
    if (sessionExpiry != null) {
      json['sessionExpiry'] = sessionExpiry!.toJson();
    }
    return json;
  }

  GetUserByTokenUsers({
    required this.userId,
    required this.displayname,
    this.sessionExpiry,
  });
}

@immutable
class GetUserByTokenData {
  final List<GetUserByTokenUsers> users;
  GetUserByTokenData.fromJson(dynamic json):
  
  users = (json['users'] as List<dynamic>)
        .map((e) => GetUserByTokenUsers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByTokenData otherTyped = other as GetUserByTokenData;
    return users == otherTyped.users;
    
  }
  @override
  int get hashCode => users.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['users'] = users.map((e) => e.toJson()).toList();
    return json;
  }

  GetUserByTokenData({
    required this.users,
  });
}

@immutable
class GetUserByTokenVariables {
  final String token;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetUserByTokenVariables.fromJson(Map<String, dynamic> json):
  
  token = nativeFromJson<String>(json['token']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUserByTokenVariables otherTyped = other as GetUserByTokenVariables;
    return token == otherTyped.token;
    
  }
  @override
  int get hashCode => token.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['token'] = nativeToJson<String>(token);
    return json;
  }

  GetUserByTokenVariables({
    required this.token,
  });
}

