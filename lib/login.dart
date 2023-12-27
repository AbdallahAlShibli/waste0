import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:waste0/register.dart';
import 'package:waste0/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';
import 'services_type.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String encryptPassword(String password) {
      // Simple encryption using SHA-256 hashing
      var bytes = utf8.encode(password);
      var digest = sha256.convert(bytes);
      return digest.toString();
    }

    bool isPasswordStrong(String password) {
      // Check if the password is at least 6 characters long
      if (password.length < 6) {
        return false;
      }

      // Check if the password contains at least one uppercase letter
      if (!password.contains(RegExp(r'[A-Z]'))) {
        return false;
      }

      // Check if the password contains at least one lowercase letter
      if (!password.contains(RegExp(r'[a-z]'))) {
        return false;
      }

      // Encrypt the password
      String encryptedPassword = encryptPassword(password);

      // You can print the encrypted password for demonstration purposes
      print('Encrypted Password: $encryptedPassword');

      // Return true if the password meets all criteria
      return true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen()),
                  );
                  // Action to perform when the button is pressed
                  print('TextButton Pressed!');
                },
                child: Text(
                  "Forget Password!",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // if (isPasswordStrong(_passwordController.text)) {
                //   await _login();
                //   print('Password is strong!');
                // } else {
                //   Fluttertoast.showToast(
                //       msg: "Password is not strong!",
                //       toastLength: Toast.LENGTH_SHORT,
                //       gravity: ToastGravity.CENTER,
                //       timeInSecForIosWeb: 1,
                //       backgroundColor: Colors.red,
                //       textColor: Colors.white,
                //       fontSize: 16.0);
                //   print('Password is not strong!');
                // }
                await _login();
              },
              child: Text('Login'),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextButton(
                onPressed: () {
                  // Action to perform when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  "You don't have an account? Click here to register.",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    try {
      // Sign in with email and password
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Navigate to the home screen or another screen after login
      // Replace the line below with your desired navigation logic.
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SelectService()));
    } catch (e) {
      // Handle login errors (display a snackbar or dialog)
      print('Login failed: $e');
    }
  }
}
