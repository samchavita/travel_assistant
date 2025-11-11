part of 'generated.dart';

class DeleteUserVariablesBuilder {
  String userId;

  final FirebaseDataConnect _dataConnect;
  DeleteUserVariablesBuilder(this._dataConnect, {required  this.userId,});
  Deserializer<DeleteUserData> dataDeserializer = (dynamic json)  => DeleteUserData.fromJson(jsonDecode(json));
  Serializer<DeleteUserVariables> varsSerializer = (DeleteUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteUserData, DeleteUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteUserData, DeleteUserVariables> ref() {
    DeleteUserVariables vars= DeleteUserVariables(userId: userId,);
    return _dataConnect.mutation("DeleteUser", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class DeleteUserUserDelete {
  final String userId;
  DeleteUserUserDelete.fromJson(dynamic json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteUserUserDelete otherTyped = other as DeleteUserUserDelete;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  DeleteUserUserDelete({
    required this.userId,
  });
}

@immutable
class DeleteUserData {
  final DeleteUserUserDelete? user_delete;
  DeleteUserData.fromJson(dynamic json):
  
  user_delete = json['user_delete'] == null ? null : DeleteUserUserDelete.fromJson(json['user_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteUserData otherTyped = other as DeleteUserData;
    return user_delete == otherTyped.user_delete;
    
  }
  @override
  int get hashCode => user_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (user_delete != null) {
      json['user_delete'] = user_delete!.toJson();
    }
    return json;
  }

  DeleteUserData({
    this.user_delete,
  });
}

@immutable
class DeleteUserVariables {
  final String userId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteUserVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeleteUserVariables otherTyped = other as DeleteUserVariables;
    return userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => userId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  DeleteUserVariables({
    required this.userId,
  });
}

