import 'package:flutter/material.dart';
import 'dashboard.dart'; // Import the dashboard file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JailTrack Admin Access',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginSignUpScreen(), // Set the home to your login/sign up screen
    );
  }
}

class LoginSignUpScreen extends StatefulWidget {
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isLogin = true;
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 14, 29),
      appBar: AppBar(
        automaticallyImplyLeading: false, // This line removes the back icon
        title: Row(
          children: [
            Image.asset(
              'icons/JailTrackLogo.png', // Path to your JailTrack logo
              width: 60, // Adjust width as needed
              height: 60, // Adjust height as needed
            ),
            SizedBox(width: 8),
            Text(
              'JailTrack',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 500,
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Admin Login Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              'icons/email.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              'icons/password.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          final form = _formKey.currentState;
                          if (form!.validate()) {
                            form.save();
                            // Implement login or sign up functionality
                            if (_isLogin) {
                              // Simulate successful login
                              _showSuccessMessage(context);
                            } else {
                              // Simulate successful sign up
                              _showSuccessMessage(context);
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlue),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text(_isLogin ? 'Login' : 'Sign Up'),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              _forgotPassword(context);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      if (_isSuccess)
                        Center(
                          child: Text(
                            'Login/Sign Up Successful!',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessMessage(BuildContext context) {
    setState(() {
      _isSuccess = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isSuccess = false;
      });
      // Navigate to dashboard on successful login/signup
      _navigateToDashboard(context);
    });
  }

  void _navigateToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  void _forgotPassword(BuildContext context) {
    // Implement your forgot password logic here
    // For example, you can navigate to a password reset page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 4, 14, 29),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            width: 300,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement forgot password functionality
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
