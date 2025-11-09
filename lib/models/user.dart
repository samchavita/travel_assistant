import 'package:hive_ce/hive.dart';
import 'package:meta/meta.dart';

// This is the new file the generator will create
part 'user.g.dart'; 

@immutable
// Use a unique typeId (0 is a good start)
@HiveType(typeId: 0) 
class User {
  const User({
    required this.username,
    required this.email,
  });

  // Use unique, sequential field indices
  @HiveField(0) 
  final String username;

  @HiveField(1)
  final String email;

  @override
  String toString() {
    return '$username: $email';
  }
}