// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAN90FYaniXYNrMrZvdOWQsjqqylvIkGkk',
    appId: '1:733631541706:web:f8d6598aa106657a579f33',
    messagingSenderId: '733631541706',
    projectId: 'e-waste-7b36e',
    authDomain: 'e-waste-7b36e.firebaseapp.com',
    storageBucket: 'e-waste-7b36e.appspot.com',
    measurementId: 'G-L4VFYBRXX4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKq388lUalUY4IGsUlAWxXCUJxSguJZdg',
    appId: '1:733631541706:android:32f55e460d6e51ef579f33',
    messagingSenderId: '733631541706',
    projectId: 'e-waste-7b36e',
    storageBucket: 'e-waste-7b36e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChJRT6oTFvLa6BjRrDZoDi8XycpbujaWA',
    appId: '1:733631541706:ios:db4c723bdb714bc9579f33',
    messagingSenderId: '733631541706',
    projectId: 'e-waste-7b36e',
    storageBucket: 'e-waste-7b36e.appspot.com',
    iosBundleId: 'com.example.waste0',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChJRT6oTFvLa6BjRrDZoDi8XycpbujaWA',
    appId: '1:733631541706:ios:d3ddfcf13af7b0bc579f33',
    messagingSenderId: '733631541706',
    projectId: 'e-waste-7b36e',
    storageBucket: 'e-waste-7b36e.appspot.com',
    iosBundleId: 'com.example.waste0.RunnerTests',
  );
}
