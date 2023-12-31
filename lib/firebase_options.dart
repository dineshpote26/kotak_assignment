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
    apiKey: 'AIzaSyCRQPzuwsPagWlE2iqV1TWyKHF2dwPuhig',
    appId: '1:947679623297:web:5b3f3abc2214c06e813580',
    messagingSenderId: '947679623297',
    projectId: 'kotat-assignment',
    authDomain: 'kotat-assignment.firebaseapp.com',
    storageBucket: 'kotat-assignment.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz9agqjvf-ds1iu4zPqTbD_ZkC1Htt0gQ',
    appId: '1:947679623297:android:a4a91dd51da60126813580',
    messagingSenderId: '947679623297',
    projectId: 'kotat-assignment',
    storageBucket: 'kotat-assignment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCGEI2I1sE6Lv4QDCpmJ53XMqANelS91g',
    appId: '1:947679623297:ios:68c4f30923187e4c813580',
    messagingSenderId: '947679623297',
    projectId: 'kotat-assignment',
    storageBucket: 'kotat-assignment.appspot.com',
    iosClientId: '947679623297-2s95fhlq9tn2mdg8783kk9pir1v2at89.apps.googleusercontent.com',
    iosBundleId: 'com.example.kotakAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCGEI2I1sE6Lv4QDCpmJ53XMqANelS91g',
    appId: '1:947679623297:ios:68c4f30923187e4c813580',
    messagingSenderId: '947679623297',
    projectId: 'kotat-assignment',
    storageBucket: 'kotat-assignment.appspot.com',
    iosClientId: '947679623297-2s95fhlq9tn2mdg8783kk9pir1v2at89.apps.googleusercontent.com',
    iosBundleId: 'com.example.kotakAssignment',
  );
}
