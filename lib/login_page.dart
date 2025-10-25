import 'package:flutter/material.dart';

// LOG IN PAGE
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  bool _isChecked = false;

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
                    textAlign: TextAlign.center
                    
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
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: TextField(
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
                    onPressed: () {
                      print('Successfully log in ');
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
}


// SIGN UP PAGE
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUpPage> {

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
                    textAlign: TextAlign.center
                    
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
                    labelText: 'Name',
                    hintText: 'Lin',
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
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: TextField(
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
                    textAlign: TextAlign.center
                    
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