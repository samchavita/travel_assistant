import 'package:flutter/material.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:travel_app/providers/user_session.dart';
import 'package:travel_app/providers/current_user.dart';
import 'dataconnect_generated/generated.dart';
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'main_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'your_database_connector.dart'; // Uncomment when integrating

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   SignUpState createState() => SignUpState();
// }

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? usernameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool loading = false;

  //  Username validation
  String? validateUsername(String value) {
    final regex = RegExp(r'^[a-zA-Z]+$');
    if (value.isEmpty) return 'Username is required';
    if (!regex.hasMatch(value)) return 'Only English letters allowed';
    if (value.length < 6 || value.length > 12) {
      return 'Username must be 6–12 characters';
    }
    return null;
  }

  // ✅ Email validation
  String? validateEmail(String value) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value.isEmpty) return 'Email is required';
    if (!regex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  // ✅ Password validation
  String? validatePassword(String value) {
    if (value.isEmpty) return 'Password is required';
    if (value.length < 8 || value.length > 20) {
      return 'Password must be 8–20 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value) &&
        !RegExp(r'[a-z]').hasMatch(value)) {
      return 'Must contain at least one letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Must contain a special character';
    }
    if (!RegExp(r'^[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]+$').hasMatch(value)) {
      return 'Only English characters allowed';
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  void _validateAll() {
    setState(() {
      usernameError = validateUsername(_usernameController.text);
      emailError = validateEmail(_emailController.text);
      passwordError = validatePassword(_passwordController.text);
      confirmPasswordError = validateConfirmPassword(
        _confirmPasswordController.text,
      );
    });
  }

  bool validFields() {
    return (validateUsername(_usernameController.text) == null &&
        validateEmail(_emailController.text) == null &&
        validateConfirmPassword(_confirmPasswordController.text) == null);
  }

  Future<void> createUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    final bcrypt = DBCrypt();
    // final hashedPassword = bcrypt.hashpw(
    //   _passwordController.text.trim(),
    //   bcrypt.gensalt(),
    // );

    try {
      // Example connector call:
      // final connector = ExampleConnector.instance;
      // final result = await connector.createUser(
      //   displayname: _usernameController.text.trim(),
      //   email: _emailController.text.trim(),
      //   password: hashedPassword,
      // ).execute();

      final result = await ExampleConnector.instance
          .createUser(
            displayname: _usernameController.text.trim(),
            email: _emailController.text.trim().toLowerCase(),
            password: bcrypt.hashpw(
              _passwordController.text.trim(),
              bcrypt.gensalt(),
            ),
          )
          .execute();


        final getResponse = await ExampleConnector.instance
          .getUserByEmail(email: _emailController.text.trim().toLowerCase())
          .execute();
      // Access the returned data
      print('Created user: ${result.data}');


      await Future.delayed(const Duration(seconds: 1)); // simulate delay

      // print('Created user: ${_usernameController.text}');
      setState(() => loading = false);

      if (context.mounted) {
          final user = getResponse.data.users.first;
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
                  expiry:
                      timestamp, // Ensure your schema accepts timestamp or String
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
        

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MainNavigation(),
            ),
            (Route<dynamic> route) => false, // This predicate ensures all previous routes are removed
          );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created!')),
        );
      }
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(title: const Text("Sign up")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 110.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Image.asset('assets/images/pheasant.png'),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 0),
                  child: Center(
                    child: Text(
                      'Create a new account to get started and use our features!',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // USERNAME FIELD
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: _usernameController,
                    onChanged: (_) => _validateAll(),
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
                      labelText: 'Username',
                      hintText: 'Lin',
                      errorText: usernameError,
                    ),
                  ),
                ),

                // EMAIL FIELD
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: _emailController,
                    onChanged: (_) => _validateAll(),
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
                      labelText: 'Email',
                      hintText: 'example@gmail.com',
                      errorText: emailError,
                    ),
                  ),
                ),

                // PASSWORD FIELD
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    onChanged: (_) => _validateAll(),
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
                      errorText: passwordError,
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


                // CONFIRM PASSWORD FIELD
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    onChanged: (_) => _validateAll(),
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
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter Password',
                      errorText: confirmPasswordError, // Was passwordError in original copy
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),


                // // CONFIRM PASSWORD FIELD
                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: TextFormField(
                //     controller: _confirmPasswordController,
                //     obscureText: true,
                //     onChanged: (_) => _validateAll(),
                //     decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Colors.white,
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(60.0),
                //         borderSide: const BorderSide(
                //           color: Colors.white,
                //           width: 2.0,
                //         ),
                //       ),
                //       labelText: 'Confirm Password',
                //       hintText: 'Re-enter password',
                //       errorText: confirmPasswordError,
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: loading || !validFields() ? null : createUser,
                      child: loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Sign up',
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
