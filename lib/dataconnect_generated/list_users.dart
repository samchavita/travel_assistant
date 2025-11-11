part of 'generated.dart';

class ListUsersVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListUsersVariablesBuilder(this._dataConnect, );
  Deserializer<ListUsersData> dataDeserializer = (dynamic json)  => ListUsersData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListUsersData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListUsersData, void> ref() {
    
    return _dataConnect.query("ListUsers", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListUsersUsers {
  final String userId;
  final String displayname;
  final String email;
  final Timestamp createdAt;
  ListUsersUsers.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']),
  displayname = nativeFromJson<String>(json['displayname']),
  email = nativeFromJson<String>(json['email']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListUsersUsers otherTyped = other as ListUsersUsers;
    return userId == otherTyped.userId && 
    displayname == otherTyped.displayname && 
    email == otherTyped.email && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, displayname.hashCode, email.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['displayname'] = nativeToJson<String>(displayname);
    json['email'] = nativeToJson<String>(email);
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  ListUsersUsers({
    required this.userId,
    required this.displayname,
    required this.email,
    required this.createdAt,
  });
}

@immutable
class ListUsersData {
  final List<ListUsersUsers> users;
  ListUsersData.fromJson(dynamic json):
  
  users = (json['users'] as List<dynamic>)
        .map((e) => ListUsersUsers.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListUsersData otherTyped = other as ListUsersData;
    return users == otherTyped.users;
    
  }
  @override
  int get hashCode => users.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['users'] = users.map((e) => e.toJson()).toList();
    return json;
  }

  ListUsersData({
    required this.users,
  });
}

