library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'create_user.dart';

part 'update_user.dart';

part 'delete_user.dart';

part 'create_place.dart';

part 'create_route.dart';

part 'update_user_session.dart';

part 'update_user_password.dart';

part 'update_user_avatar.dart';

part 'list_users.dart';

part 'get_user.dart';

part 'get_user_by_email.dart';

part 'get_user_by_displayname.dart';

part 'list_places.dart';

part 'get_place.dart';

part 'list_routes.dart';

part 'get_route.dart';

part 'get_user_by_token.dart';

part 'get_user_avatar_key.dart';







class ExampleConnector {
  
  
  CreateUserVariablesBuilder createUser ({required String displayname, required String email, required String password, }) {
    return CreateUserVariablesBuilder(dataConnect, displayname: displayname,email: email,password: password,);
  }
  
  
  UpdateUserVariablesBuilder updateUser ({required String userId, }) {
    return UpdateUserVariablesBuilder(dataConnect, userId: userId,);
  }
  
  
  DeleteUserVariablesBuilder deleteUser ({required String userId, }) {
    return DeleteUserVariablesBuilder(dataConnect, userId: userId,);
  }
  
  
  CreatePlaceVariablesBuilder createPlace ({required String name, required String coordinates, }) {
    return CreatePlaceVariablesBuilder(dataConnect, name: name,coordinates: coordinates,);
  }
  
  
  CreateRouteVariablesBuilder createRoute ({required String userId, required String name, }) {
    return CreateRouteVariablesBuilder(dataConnect, userId: userId,name: name,);
  }
  
  
  UpdateUserSessionVariablesBuilder updateUserSession ({required String userId, required String token, required Timestamp expiry, }) {
    return UpdateUserSessionVariablesBuilder(dataConnect, userId: userId,token: token,expiry: expiry,);
  }
  
  
  UpdateUserPasswordVariablesBuilder updateUserPassword ({required String email, required String password, }) {
    return UpdateUserPasswordVariablesBuilder(dataConnect, email: email,password: password,);
  }
  
  
  UpdateUserAvatarVariablesBuilder updateUserAvatar ({required String email, required String avatarKey, }) {
    return UpdateUserAvatarVariablesBuilder(dataConnect, email: email,avatarKey: avatarKey,);
  }
  
  
  ListUsersVariablesBuilder listUsers () {
    return ListUsersVariablesBuilder(dataConnect, );
  }
  
  
  GetUserVariablesBuilder getUser ({required String userId, }) {
    return GetUserVariablesBuilder(dataConnect, userId: userId,);
  }
  
  
  GetUserByEmailVariablesBuilder getUserByEmail ({required String email, }) {
    return GetUserByEmailVariablesBuilder(dataConnect, email: email,);
  }
  
  
  GetUserByDisplaynameVariablesBuilder getUserByDisplayname ({required String displayname, }) {
    return GetUserByDisplaynameVariablesBuilder(dataConnect, displayname: displayname,);
  }
  
  
  ListPlacesVariablesBuilder listPlaces () {
    return ListPlacesVariablesBuilder(dataConnect, );
  }
  
  
  GetPlaceVariablesBuilder getPlace ({required String placeId, }) {
    return GetPlaceVariablesBuilder(dataConnect, placeId: placeId,);
  }
  
  
  ListRoutesVariablesBuilder listRoutes () {
    return ListRoutesVariablesBuilder(dataConnect, );
  }
  
  
  GetRouteVariablesBuilder getRoute ({required String routeId, }) {
    return GetRouteVariablesBuilder(dataConnect, routeId: routeId,);
  }
  
  
  GetUserByTokenVariablesBuilder getUserByToken ({required String token, }) {
    return GetUserByTokenVariablesBuilder(dataConnect, token: token,);
  }
  
  
  GetUserAvatarKeyVariablesBuilder getUserAvatarKey ({required String userId, }) {
    return GetUserAvatarKeyVariablesBuilder(dataConnect, userId: userId,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'asia-east1',
    'example',
    'travelassistant',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    return ExampleConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
