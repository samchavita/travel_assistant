// dart run build_runner build

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'package:convert/convert.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'database.g.dart';

String _generateHexId([int length = 32]) {
  final random = Random.secure();
  final bytes = List<int>.generate(length ~/ 2, (_) => random.nextInt(256));
  return hex.encode(bytes);
}

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

// @DriftDatabase(tables: [TodoItems])
// class AppDatabase extends _$AppDatabase {
//   // After generating code, this class needs to define a `schemaVersion` getter
//   // and a constructor telling drift where the database should be stored.
//   // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
//   AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

//   @override
//   int get schemaVersion => 1;

//   static QueryExecutor _openConnection() {
//     return driftDatabase(
//       name: 'my_database',
//       native: const DriftNativeOptions(
//         // By default, `driftDatabase` from `package:drift_flutter` stores the
//         // database files in `getApplicationDocumentsDirectory()`.
//         databaseDirectory: getApplicationSupportDirectory,
//       ),
//       // If you need web support, see https://drift.simonbinder.eu/platforms/web/
//       web: DriftWebOptions(
//         sqlite3Wasm: Uri.parse('sqlite3.wasm'),
//         driftWorker: Uri.parse('drift_worker.dart.js'),
//       ),
//     );
//   }
// }

class Users extends Table {
  TextColumn get id => text()
      .withLength(min: 16, max: 64)
      .clientDefault(() => _generateHexId())(); // auto-generate ID
  // .nullable()
  // .customConstraint('PRIMARY KEY')();

  TextColumn get username => text()
      .withLength(min: 6, max: 20)
      .nullable()
      .customConstraint('UNIQUE')();

  TextColumn get email => text()
      .withLength(min: 5, max: 255)
      .nullable()
      .customConstraint('UNIQUE')();
  TextColumn get passwordHash => text()();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

@DriftDatabase(tables: [TodoItems, Users])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),

      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.dart.js'),
      ),
    );
  }

  Future<User?> authenticate(String username, String password) async {
    final user = await (select(
      users,
    )..where((u) => u.username.equals(username))).getSingleOrNull();
    if (user == null) return null;

    final ok = await FlutterBcrypt.verify(
      password: password,
      hash: user.passwordHash,
    );
    return ok ? user : null;
  }

  Future<void> clearAllData() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}
