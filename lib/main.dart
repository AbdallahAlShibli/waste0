import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:waste0/new_request.dart';
import 'package:waste0/register.dart';
import 'package:waste0/services_type.dart';
import 'package:waste0/view_products.dart';

import 'firebase_options.dart';
import 'login.dart';
import 'reset_password.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }

  // Future<void> _register() async {
  //   try {
  //     // Validate passwords match
  //     if (_passwordController.text != _confirmPasswordController.text) {
  //       throw Exception('Passwords do not match');
  //     }

  //     // Create user with email and password
  //     final UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );

  //     // Save additional user information to Firestore
  //     await _firestore.collection('users').doc(userCredential.user!.uid).set({
  //       'username': _usernameController.text,
  //       'email': _emailController.text,
  //       'phone': _phoneController.text,
  //     });

  //     // Navigate to the home screen or another screen after registration
  //     // Replace the line below with your desired navigation logic.
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } catch (e) {
  //     // Handle registration errors (display a snackbar or dialog)
  //     print('Registration failed: $e');
  //   }
  // }
}
