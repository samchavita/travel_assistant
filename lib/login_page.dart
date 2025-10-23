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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 100,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  // child: Image.asset('assets/images/Instagram.png'),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    borderSide: BorderSide(
                      width: 5.0,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    borderSide: BorderSide(
                      width: 5.0,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
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

            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                        Checkbox(
                          value: true, // The current state of the checkbox
                          onChanged: (bool? newValue) {
                            // Callback when the checkbox is tapped
                            // setState(() {
                            //   _isChecked = newValue ?? false; // Update the state
                            // });
                          },
                          activeColor: Colors.blue, // Color when checked
                          checkColor: Colors.white, // Color of the checkmark
                        ),
                        Text('Remember me')
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment:  MainAxisAlignment.end,
                      children: <Widget>[
                        Text('forgot password')
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),

            SizedBox(height: 50),
            Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 62),
                    child: Text('Forgot your login details? '),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: InkWell(
                      onTap: () {
                        print('hello');
                      },
                      child: Text(
                        'Get help logging in.',
                        style: TextStyle(fontSize: 14, color: Colors.teal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
