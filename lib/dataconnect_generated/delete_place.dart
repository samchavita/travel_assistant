part of 'generated.dart';

class DeletePlaceVariablesBuilder {
  String placeId;

  final FirebaseDataConnect _dataConnect;
  DeletePlaceVariablesBuilder(this._dataConnect, {required  this.placeId,});
  Deserializer<DeletePlaceData> dataDeserializer = (dynamic json)  => DeletePlaceData.fromJson(jsonDecode(json));
  Serializer<DeletePlaceVariables> varsSerializer = (DeletePlaceVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeletePlaceData, DeletePlaceVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeletePlaceData, DeletePlaceVariables> ref() {
    DeletePlaceVariables vars= DeletePlaceVariables(placeId: placeId,);
    return _dataConnect.mutation("DeletePlace", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class DeletePlacePlaceDelete {
  final String placeId;
  DeletePlacePlaceDelete.fromJson(dynamic json):
  
  placeId = nativeFromJson<String>(json['placeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeletePlacePlaceDelete otherTyped = other as DeletePlacePlaceDelete;
    return placeId == otherTyped.placeId;
    
  }
  @override
  int get hashCode => placeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['placeId'] = nativeToJson<String>(placeId);
    return json;
  }

  DeletePlacePlaceDelete({
    required this.placeId,
  });
}

@immutable
class DeletePlaceData {
  final DeletePlacePlaceDelete? place_delete;
  DeletePlaceData.fromJson(dynamic json):
  
  place_delete = json['place_delete'] == null ? null : DeletePlacePlaceDelete.fromJson(json['place_delete']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeletePlaceData otherTyped = other as DeletePlaceData;
    return place_delete == otherTyped.place_delete;
    
  }
  @override
  int get hashCode => place_delete.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (place_delete != null) {
      json['place_delete'] = place_delete!.toJson();
    }
    return json;
  }

  DeletePlaceData({
    this.place_delete,
  });
}

@immutable
class DeletePlaceVariables {
  final String placeId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeletePlaceVariables.fromJson(Map<String, dynamic> json):
  
  placeId = nativeFromJson<String>(json['placeId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final DeletePlaceVariables otherTyped = other as DeletePlaceVariables;
    return placeId == otherTyped.placeId;
    
  }
  @override
  int get hashCode => placeId.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['placeId'] = nativeToJson<String>(placeId);
    return json;
  }

  DeletePlaceVariables({
    required this.placeId,
  });
}

