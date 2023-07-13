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
    apiKey: 'AIzaSyCqV3fxcpWn8YnOgI5M_vyFGW3VFjVL5uM',
    appId: '1:778533524226:web:ba13fd19655f9485c9e81b',
    messagingSenderId: '778533524226',
    projectId: 'vinhome-ecommerence',
    authDomain: 'vinhome-ecommerence.firebaseapp.com',
    databaseURL: 'https://vinhome-ecommerence-default-rtdb.firebaseio.com',
    storageBucket: 'vinhome-ecommerence.appspot.com',
    measurementId: 'G-547W8929M1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ17nDgofiecX3-WqEiSp-45Qge9vm06w',
    appId: '1:778533524226:android:3ca3e3b7afb7a1a7c9e81b',
    messagingSenderId: '778533524226',
    projectId: 'vinhome-ecommerence',
    databaseURL: 'https://vinhome-ecommerence-default-rtdb.firebaseio.com',
    storageBucket: 'vinhome-ecommerence.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1e2vhG5MennfNUXWD_c6L4fxHyheqTAQ',
    appId: '1:778533524226:ios:803662bc311aa8edc9e81b',
    messagingSenderId: '778533524226',
    projectId: 'vinhome-ecommerence',
    databaseURL: 'https://vinhome-ecommerence-default-rtdb.firebaseio.com',
    storageBucket: 'vinhome-ecommerence.appspot.com',
    iosClientId: '778533524226-olffhpmeggck0hn8teln67b6l7essb7f.apps.googleusercontent.com',
    iosBundleId: 'com.example.vinhomesEcommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1e2vhG5MennfNUXWD_c6L4fxHyheqTAQ',
    appId: '1:778533524226:ios:a6c74e6f7c196e0dc9e81b',
    messagingSenderId: '778533524226',
    projectId: 'vinhome-ecommerence',
    databaseURL: 'https://vinhome-ecommerence-default-rtdb.firebaseio.com',
    storageBucket: 'vinhome-ecommerence.appspot.com',
    iosClientId: '778533524226-m0md7rmce4e194bb56e3bd3odilk57qt.apps.googleusercontent.com',
    iosBundleId: 'com.example.vinhomesEcommerce.RunnerTests',
  );
}
