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
    apiKey: 'AIzaSyCRheJNvEHF3JNHfb6kcWYELvFNy8LMs1Y',
    appId: '1:64058760025:web:081c4f2ca6b4249bda4a48',
    messagingSenderId: '64058760025',
    projectId: 'cefmorsi-d8ffc',
    authDomain: 'cefmorsi-d8ffc.firebaseapp.com',
    storageBucket: 'cefmorsi-d8ffc.appspot.com',
    measurementId: 'G-VXNFBGEM76',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMPwXnsn5IhqUBO1oCVRaA5CocZnbqEFQ',
    appId: '1:64058760025:android:0b4b63113b7e49a3da4a48',
    messagingSenderId: '64058760025',
    projectId: 'cefmorsi-d8ffc',
    storageBucket: 'cefmorsi-d8ffc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChgiCR5Ec9vxumrYpYgx-XbSqde3ZEKLs',
    appId: '1:64058760025:ios:6ee930f774a11aa8da4a48',
    messagingSenderId: '64058760025',
    projectId: 'cefmorsi-d8ffc',
    storageBucket: 'cefmorsi-d8ffc.appspot.com',
    androidClientId: '64058760025-re88f61i04pikfjf9ogjf2048qviaif4.apps.googleusercontent.com',
    iosClientId: '64058760025-ja7a6kbmjrk83jaipl82nmncr4qoq6ph.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppTesting',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChgiCR5Ec9vxumrYpYgx-XbSqde3ZEKLs',
    appId: '1:64058760025:ios:6ee930f774a11aa8da4a48',
    messagingSenderId: '64058760025',
    projectId: 'cefmorsi-d8ffc',
    storageBucket: 'cefmorsi-d8ffc.appspot.com',
    androidClientId: '64058760025-re88f61i04pikfjf9ogjf2048qviaif4.apps.googleusercontent.com',
    iosClientId: '64058760025-ja7a6kbmjrk83jaipl82nmncr4qoq6ph.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppTesting',
  );
}
