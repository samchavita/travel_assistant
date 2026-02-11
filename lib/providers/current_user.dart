import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentUser {
  final String id;
  final String? displayName;
  String? avatarKey;
  final String? email;
  final String? sessionToken;

  CurrentUser({required this.id, this.displayName, this.avatarKey, this.email, this.sessionToken});
}

final currentUserProvider = StateProvider<CurrentUser?>((ref) => null);
