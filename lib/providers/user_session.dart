

import 'package:universal_html/html.dart' as html;
import 'package:uuid/uuid.dart';

// class SessionManager {
//   static const int _maxAgeSeconds = 172800; // 2 days
//   static const String _cookieName = 'sessionToken';
//   static const String _sessionToken = 'sessionTimestamp';

//   /// Set the session cookie in the browser
//   void setSessionCookie(String sessionToken) {
//     final _sessionToken = sessionToken;
//     final cookieValue = 
//         "$_cookieName=$_sessionToken; max-age=$_maxAgeSeconds; path=/; SameSite=Strict; Secure";
//     html.document.cookie = cookieValue;
//   }

//   /// Generate a secure random session token
//   String generateSessionToken() {
//     return const Uuid().v4();
//   }

//   /// Clear the session cookie
//   void clearSessionCookie() {
//     html.document.cookie = "$_cookieName=; max-age=0; path=/";
//   }
// }


class SessionManager {
  static const int _maxAgeSeconds = 172800; // 2 days
  static const String _cookieName = 'sessionToken';
  
  SessionManager() {
    _setSessionCookie();
  }
  /// Generate a random session token (NOT for authentication)
  String _generateSessionToken() {
    return const Uuid().v4();
  }

  /// Set the session cookie in the browser
  void _setSessionCookie() {
    // Note: 'Secure' is removed for local dev testing (HTTP).
    // Add it back ('...; Secure') for production (HTTPS).
    final cookieValue =
        '$_cookieName=${_generateSessionToken()}; '
        'max-age=$_maxAgeSeconds; '
        'path=/; '
        'SameSite=Lax'; 

    html.document.cookie = cookieValue;
  }

  /// Retrieve the session token from cookies
  String? getSessionToken() {
    final cookies = html.document.cookie?.split('; ') ?? [];

    for (final cookie in cookies) {
      final parts = cookie.split('=');
      if (parts.isNotEmpty && parts.first == _cookieName) {
        return parts.length > 1 ? parts[1] : null;
      }
    }
    return null;
  }

  /// Clear the session cookie
  void clearSessionCookie() {
    html.document.cookie =
        '$_cookieName=; '
        'max-age=0; '
        'path=/; '
        'SameSite=Lax';
  }
}
