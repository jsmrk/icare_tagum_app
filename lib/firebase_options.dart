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
    apiKey: 'AIzaSyA7pYNpL2Oihb6eh_9973iYVeuqi_dOkE0',
    appId: '1:95542719265:web:918519c3677eade7ad4460',
    messagingSenderId: '95542719265',
    projectId: 'i-care-tagum-app',
    authDomain: 'i-care-tagum-app.firebaseapp.com',
    databaseURL:
        'https://i-care-tagum-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'i-care-tagum-app.appspot.com',
    measurementId: 'G-WVRDDRMSNX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-pZ2QAR-IsAvfFurAs8o4dP-sUsJI6DE',
    appId: '1:95542719265:android:8d53a940b1c71c48ad4460',
    messagingSenderId: '95542719265',
    projectId: 'i-care-tagum-app',
    databaseURL:
        'https://i-care-tagum-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'i-care-tagum-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZqAQf-pUKh0Vn4CUYTVl7WurD1P5U89o',
    appId: '1:95542719265:ios:109529cd45e66584ad4460',
    messagingSenderId: '95542719265',
    projectId: 'i-care-tagum-app',
    databaseURL:
        'https://i-care-tagum-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'i-care-tagum-app.appspot.com',
    iosBundleId: 'com.example.icareTagumApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZqAQf-pUKh0Vn4CUYTVl7WurD1P5U89o',
    appId: '1:95542719265:ios:34d5b911e4b71e89ad4460',
    messagingSenderId: '95542719265',
    projectId: 'i-care-tagum-app',
    databaseURL:
        'https://i-care-tagum-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'i-care-tagum-app.appspot.com',
    iosBundleId: 'com.example.icareTagumApp.RunnerTests',
  );
}
