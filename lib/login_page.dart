// import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';
// import 'package:travel_app/dashboard.dart';
import 'main_navigation.dart';
// import 'dataconnect_generated/generated.dart';
import 'signup.dart';
import 'dataconnect_generated/generated.dart';
import 'package:dbcrypt/dbcrypt.dart';
// import 'package:flutter/material.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:uuid/uuid.dart'; // for token generation
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/current_user.dart';
import 'package:travel_app/providers/user_session.dart';

// LOG IN PAGE
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => LoginState();
}

class LoginState extends ConsumerState<LoginPage> {
  bool _isChecked = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  bool _obscurePassword = true;

  //   // Set the cookie
  //   void _setSessionCookie(String sessionToken) {
  //     // Calculate 2 days in seconds (2 * 24 * 60 * 60 = 172800)
  //     const int maxAgeSeconds = 172800;

  //     // Create the cookie string
  //     // "Secure" ensures it's only sent over HTTPS (recommended)
  //     // "SameSite=Strict" prevents CSRF attacks
  //     final cookieValue =
  //         "sessionToken=$sessionToken; max-age=$maxAgeSeconds; path=/; SameSite=Strict; Secure";

  //     // Set the cookie in the browser
  //     html.document.cookie = cookieValue;
  //   }

  // // Helper to generate a secure random token
  //   String _generateSessionToken() {
  //     return const Uuid().v4(); // Generates a random UUID string
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(title: Text("Login")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Image.asset('assets/images/pheasant.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: Center(
                  child: Text(
                    'Enter your email and password to access your account securly.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,

                    // decoration: InputDecoration(
                    //   filled: true,
                    //   fillColor: Colors.white,
                    //   enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(60.0),
                    //     borderSide: BorderSide(color: Colors.white, width: 2.0),
                    //   ),
                    //   labelText: 'Email',
                    //   hintText: 'example@gmail.com',
                    // ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'email',
                    hintText: 'example@mail.com',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    // errorText: passwordError,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(top: 15, bottom: 0),
              //   child: TextField(
              //     controller: _passwordController,
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(60.0),
              //         borderSide: BorderSide(color: Colors.white, width: 2.0),
              //       ),
              //       labelText: 'Password',
              //       hintText: 'Enter secure password',
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value:
                                    _isChecked, // The current state of the checkbox
                                onChanged: (bool? newValue) {
                                  // Callback when the checkbox is tapped
                                  setState(() {
                                    _isChecked =
                                        newValue ?? false; // Update the state
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                fillColor: WidgetStateProperty.resolveWith((
                                  states,
                                ) {
                                  if (!states.contains(WidgetState.selected)) {
                                    return Colors.white;
                                  }
                                  return null;
                                }),
                                side: WidgetStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                    color: Colors.teal,
                                    width: 2.0,
                                  ),
                                ),
                                activeColor: Colors.teal, // Color when checked
                                checkColor:
                                    Colors.white, // Color of the checkmark
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgotPwdPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot password',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text('Log in ', style: TextStyle(fontSize: 20)),
                    onPressed: _isLoading
                        ? null
                        : () async {
                            await _handleLogin();
                          },
                  ),
                ),
              ),

              SizedBox(height: 40),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'or sign up instead',
                    style: TextStyle(fontSize: 14, color: Colors.teal),
                  ),
                ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<bool> _logIn() async {
  //   return true;
  // }

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Basic validation
    if (email.isEmpty || password.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields')),
        );
      }
      setState(() => _isLoading = false);
      return;
    }

    try {
      // 1. CALL DATA CONNECT
      // Uses the singleton 'ExampleConnector.instance' from your snippet.
      // We call .execute() because the method returns a VariablesBuilder.
      final response = await ExampleConnector.instance
          .getUserByEmail(email: email)
          .execute();

      // 2. CHECK RESULTS
      // The 'response.data' usually contains the typed results of the query.
      if (response.data.users.isEmpty) {
        print('No user found with that email.');
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('User not found')));
        }
        return;
      }

      final user = response.data.users.first;
      final bcrypt = DBCrypt();

      // 3. VERIFY PASSWORD
      // Note: In production, compare hashed passwords (e.g., BCrypt), not plain text.

      if (bcrypt.checkpw(password, user.password)) {
        print('Login Success: ${user.displayname}');
        if (mounted) {
          // ---- NEW SECURITY LOGIC STARTS HERE ----

          // A. Generate a new secure token
          final session = SessionManager();
          final sessionToken = session.getSessionToken();

          print("Generated session token: $sessionToken");

          // B. Calculate expiry (2 days from now)
          final timestamp = Timestamp(
            0,
            DateTime.now()
                    .add(const Duration(days: 2))
                    .millisecondsSinceEpoch ~/
                1000,
          );

          // C. Save the token to the DATABASE (Server-side)
          // This 'locks' the session to this user on the server
          if (sessionToken != null) {
            await ExampleConnector.instance
                .updateUserSession(
                  userId: user.userId,
                  token: sessionToken,
                  expiry: _isChecked ? timestamp : Timestamp(0, 0), // Ensure your schema accepts timestamp or String
                )
                .execute();
          }

          // D. Save the token to the BROWSER (Client-side Cookie)
          // Note: We are saving 'sessionToken', NOT 'user.id'
          // _setSessionCookie(sessionToken);

          // ---- NEW SECURITY LOGIC ENDS HERE ----

          // E. Populate Riverpod provider with user info for app-wide use
          ref.read(currentUserProvider.notifier).state = CurrentUser(
            id: user.userId,
            displayName: user.displayname,
            avatarKey: user.avatarKey,
            email: user.email,
            sessionToken: sessionToken,
          );

          if (mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainNavigation()),
              (Route<dynamic> route) =>
                  false, // This predicate ensures all previous routes are removed
            );
          }
        }
      } else {
        print('Incorrect password');
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Incorrect password')));
        }
      }
    } catch (e) {
      print('Login Error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          // SnackBar(content: Text('Error: $e')),
          SnackBar(content: Text('Something went wrong. Please try again.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}

// FORGOT PASSWORD PAGE
class ForgotPwdPage extends StatefulWidget {
  const ForgotPwdPage({super.key});

  @override
  ForgotPwdState createState() => ForgotPwdState();
}

class ForgotPwdState extends State<ForgotPwdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(title: Text("Forgot Password")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Image.asset('assets/images/pheasant.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: Center(
                  child: Text(
                    'Enter your email address associated to your account to receive a reset link and regain access to your account.',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,

                    // decoration: InputDecoration(
                    //   filled: true,
                    //   fillColor: Colors.white,
                    //   enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(60.0),
                    //     borderSide: BorderSide(color: Colors.white, width: 2.0),
                    //   ),
                    //   labelText: 'Email',
                    //   hintText: 'example@gmail.com',
                    // ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Email',
                    hintText: 'example@gmail.com',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                    ),
                    child: Text('Continue', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      print('Successfully log in ');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
