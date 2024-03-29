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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDEFFV4VMjh9UlcRmxpbh2gwYx5hQFcBCc',
    appId: '1:429896697212:web:0ae8573bd817449df4d0f9',
    messagingSenderId: '429896697212',
    projectId: 'school-73ce9',
    authDomain: 'school-73ce9.firebaseapp.com',
    databaseURL: 'https://school-73ce9-default-rtdb.firebaseio.com',
    storageBucket: 'school-73ce9.appspot.com',
    measurementId: 'G-DL1X79XBR1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQilZyyT9vJaCHEJTrJttKD1HFvXplnaE',
    appId: '1:429896697212:android:973dbb75e80ebd54f4d0f9',
    messagingSenderId: '429896697212',
    projectId: 'school-73ce9',
    databaseURL: 'https://school-73ce9-default-rtdb.firebaseio.com',
    storageBucket: 'school-73ce9.appspot.com',
  );
}
