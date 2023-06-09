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
    apiKey: 'AIzaSyCE7IUcrdgc2fbGh3nvrxmO6URly6_aDpA',
    appId: '1:894636443903:web:2667d007a54464c98ee4ca',
    messagingSenderId: '894636443903',
    projectId: 'se3802023spring',
    authDomain: 'se3802023spring.firebaseapp.com',
    storageBucket: 'se3802023spring.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhR9aJaFedzccS3M51mK32MGebesjpUgM',
    appId: '1:894636443903:android:84f972fa263c6a108ee4ca',
    messagingSenderId: '894636443903',
    projectId: 'se3802023spring',
    storageBucket: 'se3802023spring.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmaFPfcu8hCcuhllocSJCMmR-fWCUykSE',
    appId: '1:894636443903:ios:b12b85b5f6eb05548ee4ca',
    messagingSenderId: '894636443903',
    projectId: 'se3802023spring',
    storageBucket: 'se3802023spring.appspot.com',
    iosClientId: '894636443903-tmlo2d218tvdl2n057f6vq73l7a3ikbo.apps.googleusercontent.com',
    iosBundleId: 'com.example.se380Student',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmaFPfcu8hCcuhllocSJCMmR-fWCUykSE',
    appId: '1:894636443903:ios:b12b85b5f6eb05548ee4ca',
    messagingSenderId: '894636443903',
    projectId: 'se3802023spring',
    storageBucket: 'se3802023spring.appspot.com',
    iosClientId: '894636443903-tmlo2d218tvdl2n057f6vq73l7a3ikbo.apps.googleusercontent.com',
    iosBundleId: 'com.example.se380Student',
  );
}
