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
    apiKey: 'AIzaSyAJda9Cpzu4zgRPZTXSJxHCAxpL8ZdUjHE',
    appId: '1:459343735367:web:3a4e380ec854b83a471f62',
    messagingSenderId: '459343735367',
    projectId: 'foodly-clean-arch',
    authDomain: 'foodly-clean-arch.firebaseapp.com',
    storageBucket: 'foodly-clean-arch.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBabncmjRM7jXTATiWqZr6MxpqIGmRwtYs',
    appId: '1:459343735367:android:b4821b8d828cc49e471f62',
    messagingSenderId: '459343735367',
    projectId: 'foodly-clean-arch',
    storageBucket: 'foodly-clean-arch.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPmrJqKq9sqtTu2Y2GxqOlGsTc77__XfY',
    appId: '1:459343735367:ios:ad5d4f8331f34b03471f62',
    messagingSenderId: '459343735367',
    projectId: 'foodly-clean-arch',
    storageBucket: 'foodly-clean-arch.appspot.com',
    iosClientId: '459343735367-p2u9llf180g83ecpfcgp848j0oe9c29e.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodlyCleanArc',
  );
}