import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'services_type.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('troubleshooting.png'),
            //     scale: 1, // Replace with your image asset
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Container(
          // color: Color.fromARGB(77, 17, 17, 16),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 60,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (isPasswordStrong(_passwordController.text)) {
                        await _register();
                        print('Password is strong!');
                      } else {
                        Fluttertoast.showToast(
                            msg: "Password is not strong!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        print('Password is not strong!');
                      }
                      // await _register();
                    },
                    child: Text('Register'),
                  ),
                )
              ],
            ),
          ),
        )));
  }

  Future<void> _register() async {
    try {
      // Validate passwords match
      if (_passwordController.text != _confirmPasswordController.text) {
        throw Exception('Passwords do not match');
      }

      // Create user with email and password
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Save additional user information to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': _usernameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      });

      // Navigate to the home screen or another screen after registration
      // Replace the line below with your desired navigation logic.
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SelectService()));
    } catch (e) {
      // Handle registration errors (display a snackbar or dialog)
      print('Registration failed: $e');
    }
  }
}
