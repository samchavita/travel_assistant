// import 'dart:io';

// import 'package:hive/hive_registrar.g.dart';
// import 'package:hive_ce/hive.dart';
// import 'package:meta/meta.dart';

// @immutable
// class User {
//   const User({
//     required this.username,
//     required this.email,
//   });

//   final String username;
//   final String email;

//   @override
//   String toString() {
//     return '$username: $email';
//   }
// }

// void main() async {
//   final path = Directory.current.path;
//   Hive
//     ..init(path)
//     ..registerAdapters();

//   final box = await Hive.openBox('testBox');

//   final user = User(
//     username: 'u',
//     email: 'u@gmail.com',
//   );


//   await box.put('dave', user);

//   print(box.get('dave')); // Dave: 22
// }