# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### ListUsers
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listUsers().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListUsersData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listUsers();
ListUsersData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listUsers().ref();
ref.execute();

ref.subscribe(...);
```


### GetUser
#### Required Arguments
```dart
String userId = ...;
ExampleConnector.instance.getUser(
  userId: userId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUserData, GetUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getUser(
  userId: userId,
);
GetUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;

final ref = ExampleConnector.instance.getUser(
  userId: userId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetUserByEmail
#### Required Arguments
```dart
String email = ...;
ExampleConnector.instance.getUserByEmail(
  email: email,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUserByEmailData, GetUserByEmailVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getUserByEmail(
  email: email,
);
GetUserByEmailData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String email = ...;

final ref = ExampleConnector.instance.getUserByEmail(
  email: email,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetUserByDisplayname
#### Required Arguments
```dart
String displayname = ...;
ExampleConnector.instance.getUserByDisplayname(
  displayname: displayname,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUserByDisplaynameData, GetUserByDisplaynameVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getUserByDisplayname(
  displayname: displayname,
);
GetUserByDisplaynameData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String displayname = ...;

final ref = ExampleConnector.instance.getUserByDisplayname(
  displayname: displayname,
).ref();
ref.execute();

ref.subscribe(...);
```


### ListPlaces
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listPlaces().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListPlacesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listPlaces();
ListPlacesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listPlaces().ref();
ref.execute();

ref.subscribe(...);
```


### GetPlace
#### Required Arguments
```dart
String placeId = ...;
ExampleConnector.instance.getPlace(
  placeId: placeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetPlaceData, GetPlaceVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getPlace(
  placeId: placeId,
);
GetPlaceData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String placeId = ...;

final ref = ExampleConnector.instance.getPlace(
  placeId: placeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### ListRoutes
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listRoutes().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListRoutesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listRoutes();
ListRoutesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listRoutes().ref();
ref.execute();

ref.subscribe(...);
```


### GetRoute
#### Required Arguments
```dart
String routeId = ...;
ExampleConnector.instance.getRoute(
  routeId: routeId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetRouteData, GetRouteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getRoute(
  routeId: routeId,
);
GetRouteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String routeId = ...;

final ref = ExampleConnector.instance.getRoute(
  routeId: routeId,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetUserByToken
#### Required Arguments
```dart
String token = ...;
ExampleConnector.instance.getUserByToken(
  token: token,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUserByTokenData, GetUserByTokenVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getUserByToken(
  token: token,
);
GetUserByTokenData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String token = ...;

final ref = ExampleConnector.instance.getUserByToken(
  token: token,
).ref();
ref.execute();

ref.subscribe(...);
```


### GetUserAvatarKey
#### Required Arguments
```dart
String userId = ...;
ExampleConnector.instance.getUserAvatarKey(
  userId: userId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUserAvatarKeyData, GetUserAvatarKeyVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getUserAvatarKey(
  userId: userId,
);
GetUserAvatarKeyData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;

final ref = ExampleConnector.instance.getUserAvatarKey(
  userId: userId,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateUser
#### Required Arguments
```dart
String displayname = ...;
String email = ...;
String password = ...;
ExampleConnector.instance.createUser(
  displayname: displayname,
  email: email,
  password: password,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateUserData, CreateUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createUser(
  displayname: displayname,
  email: email,
  password: password,
);
CreateUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String displayname = ...;
String email = ...;
String password = ...;

final ref = ExampleConnector.instance.createUser(
  displayname: displayname,
  email: email,
  password: password,
).ref();
ref.execute();
```


### UpdateUser
#### Required Arguments
```dart
String userId = ...;
ExampleConnector.instance.updateUser(
  userId: userId,
).execute();
```

#### Optional Arguments
We return a builder for each query. For UpdateUser, we created `UpdateUserBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpdateUserVariablesBuilder {
  ...
   UpdateUserVariablesBuilder displayname(String? t) {
   _displayname.value = t;
   return this;
  }
  UpdateUserVariablesBuilder email(String? t) {
   _email.value = t;
   return this;
  }
  UpdateUserVariablesBuilder password(String? t) {
   _password.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.updateUser(
  userId: userId,
)
.displayname(displayname)
.email(email)
.password(password)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<UpdateUserData, UpdateUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateUser(
  userId: userId,
);
UpdateUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;

final ref = ExampleConnector.instance.updateUser(
  userId: userId,
).ref();
ref.execute();
```


### DeleteUser
#### Required Arguments
```dart
String userId = ...;
ExampleConnector.instance.deleteUser(
  userId: userId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<DeleteUserData, DeleteUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.deleteUser(
  userId: userId,
);
DeleteUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;

final ref = ExampleConnector.instance.deleteUser(
  userId: userId,
).ref();
ref.execute();
```


### CreatePlace
#### Required Arguments
```dart
String name = ...;
String coordinates = ...;
ExampleConnector.instance.createPlace(
  name: name,
  coordinates: coordinates,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreatePlace, we created `CreatePlaceBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreatePlaceVariablesBuilder {
  ...
   CreatePlaceVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }
  CreatePlaceVariablesBuilder images(List<String>? t) {
   _images.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.createPlace(
  name: name,
  coordinates: coordinates,
)
.description(description)
.images(images)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreatePlaceData, CreatePlaceVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createPlace(
  name: name,
  coordinates: coordinates,
);
CreatePlaceData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String name = ...;
String coordinates = ...;

final ref = ExampleConnector.instance.createPlace(
  name: name,
  coordinates: coordinates,
).ref();
ref.execute();
```


### CreateRoute
#### Required Arguments
```dart
String userId = ...;
String name = ...;
ExampleConnector.instance.createRoute(
  userId: userId,
  name: name,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateRoute, we created `CreateRouteBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateRouteVariablesBuilder {
  ...
   CreateRouteVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.createRoute(
  userId: userId,
  name: name,
)
.description(description)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreateRouteData, CreateRouteVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createRoute(
  userId: userId,
  name: name,
);
CreateRouteData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;
String name = ...;

final ref = ExampleConnector.instance.createRoute(
  userId: userId,
  name: name,
).ref();
ref.execute();
```


### UpdateUserSession
#### Required Arguments
```dart
String userId = ...;
String token = ...;
Timestamp expiry = ...;
ExampleConnector.instance.updateUserSession(
  userId: userId,
  token: token,
  expiry: expiry,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateUserSessionData, UpdateUserSessionVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateUserSession(
  userId: userId,
  token: token,
  expiry: expiry,
);
UpdateUserSessionData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;
String token = ...;
Timestamp expiry = ...;

final ref = ExampleConnector.instance.updateUserSession(
  userId: userId,
  token: token,
  expiry: expiry,
).ref();
ref.execute();
```


### UpdateUserPassword
#### Required Arguments
```dart
String email = ...;
String password = ...;
ExampleConnector.instance.updateUserPassword(
  email: email,
  password: password,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateUserPasswordData, UpdateUserPasswordVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateUserPassword(
  email: email,
  password: password,
);
UpdateUserPasswordData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String email = ...;
String password = ...;

final ref = ExampleConnector.instance.updateUserPassword(
  email: email,
  password: password,
).ref();
ref.execute();
```


### UpdateUserAvatar
#### Required Arguments
```dart
String email = ...;
String avatarKey = ...;
ExampleConnector.instance.updateUserAvatar(
  email: email,
  avatarKey: avatarKey,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateUserAvatarData, UpdateUserAvatarVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateUserAvatar(
  email: email,
  avatarKey: avatarKey,
);
UpdateUserAvatarData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String email = ...;
String avatarKey = ...;

final ref = ExampleConnector.instance.updateUserAvatar(
  email: email,
  avatarKey: avatarKey,
).ref();
ref.execute();
```

