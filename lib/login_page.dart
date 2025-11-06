import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/dashboard.dart';
import 'package:travel_app/database.dart';
import 'package:drift/src/runtime/data_class.dart';

// LOG IN PAGE
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  bool _isChecked = false;

  final _unameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  controller: _unameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'username',
                    hintText: 'Lin',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                  ),
                ),
              ),

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
                    child: Text('Log in ', style: TextStyle(fontSize: 20)),
                    onPressed: () async {
                      print('Attempting to log in');

                      final success = await _logIn();
                      if (success) {

                        print('Successs');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      }
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

  Future<bool> _logIn() async {
    final username = _unameController.text.trim();
    final password = _passwordController.text;

    // Basic validation
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return false;
    }

    try {
      final db = AppDatabase(); // make sure you have an instance
      db.authenticate(username, password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication success!')),
      );

      // Clear form fields
      _unameController.clear();
      _passwordController.clear();

      return true;
    } catch (e) {
      // Error handling
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('❌ Username or password does not exist: $e')));
    }

    return true;
  }
}

// SIGN UP PAGE
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // import 'package:travel_app/database.dart';
  // import 'package:drift/src/runtime/data_class.dart';
  // import 'package:dbcrypt/dbcrypt.dart';

  //   WidgetsFlutterBinding.ensureInitialized();

  //   final database = AppDatabase();

  //   final bcrypt = DBCrypt();
  //   final hashedPassword = bcrypt.hashpw('something', bcrypt.gensalt());
  //   await database
  //       .into(database.users)
  //       .insert(
  //         UsersCompanion.insert(
  //           username: Value('samuel'),
  //           email: Value('me@ndhu.com'),
  //           passwordHash: hashedPassword,
  //         ),
  //       );
  //   List<User> allItems = await database.select(database.users).get();

  //   print('items in database: $allItems');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(title: Text("Sign up")),
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
                    'Create a new account to get started and use our features!',
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
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Username',
                    hintText: 'Lin',
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
                    labelText: 'Email',
                    hintText: 'example@gmail.com',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    labelText: 'Confirm Password',
                    hintText: 'Enter secure password',
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
                    child: Text('Sign up', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      print('Successfully log in ');
                      _registerUser;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Center(
              //   child:
              //       InkWell(
              //         onTap: () {
              //           print('hello');
              //         },
              //         child: Text(
              //           'or sign up instead',
              //           style: TextStyle(fontSize: 14, color: Colors.teal),
              //         ),
              //       ),
              //       // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // Basic validation
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    try {
      // 1️⃣ Hash the password using DBCrypt (synchronous)
      final dcrypt = DBCrypt();
      final hashedPassword = dcrypt.hashpw(password, dcrypt.gensalt());

      // 2️⃣ Insert the user into the Drift database
      final db = AppDatabase(); // make sure you have an instance
      await db
          .into(db.users)
          .insert(
            UsersCompanion.insert(
              username: Value(username),
              email: Value(email),
              passwordHash: hashedPassword,
            ),
          );

      // 3️⃣ Success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ User registered successfully!')),
      );

      // 4️⃣ Clear form fields
      _usernameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    } catch (e) {
      // Error handling
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('❌ Error registering user: $e')));
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
