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
    apiKey: 'AIzaSyDjKdLvuM4I8xt7C05hTu3xc0NYD8XqwcU',
    appId: '1:381473489868:web:d8a31e82057cb35b685369',
    messagingSenderId: '381473489868',
    projectId: 'my-chats-apps-7c30c',
    authDomain: 'my-chats-apps-7c30c.firebaseapp.com',
    storageBucket: 'my-chats-apps-7c30c.appspot.com',
    measurementId: 'G-WWRH8DR26R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYi6TBTj-gN7IJFG2vmyzQD4ks26FvOrI',
    appId: '1:381473489868:android:3e04fa53da45d03e685369',
    messagingSenderId: '381473489868',
    projectId: 'my-chats-apps-7c30c',
    storageBucket: 'my-chats-apps-7c30c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmPZZ7iydWEJSG01Wi6n2gc0XrWNIbR5s',
    appId: '1:381473489868:ios:7bcf6204af8fa710685369',
    messagingSenderId: '381473489868',
    projectId: 'my-chats-apps-7c30c',
    storageBucket: 'my-chats-apps-7c30c.appspot.com',
    iosClientId: '381473489868-9vi8e01pbqdjbqjtght90iej78p12gsq.apps.googleusercontent.com',
    iosBundleId: 'com.example.myChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmPZZ7iydWEJSG01Wi6n2gc0XrWNIbR5s',
    appId: '1:381473489868:ios:7bcf6204af8fa710685369',
    messagingSenderId: '381473489868',
    projectId: 'my-chats-apps-7c30c',
    storageBucket: 'my-chats-apps-7c30c.appspot.com',
    iosClientId: '381473489868-9vi8e01pbqdjbqjtght90iej78p12gsq.apps.googleusercontent.com',
    iosBundleId: 'com.example.myChatApp',
  );
}
