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
    apiKey: 'AIzaSyD9MB8PElYMyJzCuMrXhdaIqRXwWIeRGWY',
    appId: '1:949399884320:web:e7ef1fc7680b1e9d51a245',
    messagingSenderId: '949399884320',
    projectId: 'pets-app-df5ae',
    authDomain: 'pets-app-df5ae.firebaseapp.com',
    storageBucket: 'pets-app-df5ae.appspot.com',
    measurementId: 'G-27PWLK61MS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjnUybZqDAa0-_MI1Wfmdrzg0dwpagtxE',
    appId: '1:949399884320:android:ef0786018e21d65251a245',
    messagingSenderId: '949399884320',
    projectId: 'pets-app-df5ae',
    storageBucket: 'pets-app-df5ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDg6G1zX_r4duZg-Knv6q2VCb-kCmdPT_E',
    appId: '1:949399884320:ios:734bbf676389fa6051a245',
    messagingSenderId: '949399884320',
    projectId: 'pets-app-df5ae',
    storageBucket: 'pets-app-df5ae.appspot.com',
    iosBundleId: 'com.example.petsApp',
  );
}
