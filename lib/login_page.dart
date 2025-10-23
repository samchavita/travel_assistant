import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {

//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Next Page'),),
//       body: Center(
//         child: Text('GeeksForGeeks'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import 'HomePage.dart';
// import 'log_in.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginDemo(),
//     );
//   }
// }

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
                          borderRadius: BorderRadius.circular(50.0)),
                    child: Image.asset('assets/images/pheasant.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
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
                                value: _isChecked, // The current state of the checkbox
                                onChanged: (bool? newValue) {
                                  // Callback when the checkbox is tapped
                                  setState(() {
                                    _isChecked = newValue ?? false; // Update the state
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                side: WidgetStateBorderSide.resolveWith(
                                    (states) => BorderSide(color: Colors.grey, width: 0.5),
                                ),
                                activeColor: Colors.teal, // Color when checked
                                checkColor:
                                    Colors.white, // Color of the checkmark
                              ),
                              Text('Remember me',
                                  style: TextStyle(fontSize: 12)
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
                                  print('hello');
                                },
                                child: Text(
                                  'Forgot password',
                                  style: TextStyle(fontSize: 12, color: Colors.teal),
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
                padding: const EdgeInsets.only(top: 15, bottom: 0),
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
                child:
                    InkWell(
                      onTap: () {
                        print('hello');
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
