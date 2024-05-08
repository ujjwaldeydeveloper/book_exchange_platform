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
   // ignore: missing_enum_constant_in_switch
   if (defaultTargetPlatform case TargetPlatform.android) {
     return android;
   } else if (defaultTargetPlatform case TargetPlatform.iOS) {
     return ios;
   } else if (defaultTargetPlatform case TargetPlatform.macOS) {
     return macos;
   } else if (defaultTargetPlatform case TargetPlatform.fuchsia || TargetPlatform.linux || TargetPlatform.windows) {
   }

   throw UnsupportedError(
     'DefaultFirebaseOptions are not supported for this platform.',
   );
 }

 static const FirebaseOptions web = FirebaseOptions(
   apiKey: 'AIzaSyCqFjCV_9CZmYeIvcK9FVy4drmKUlSaIWY',
   appId: '1:963656261848:web:7219f7fca5fc70afb237ad',
   messagingSenderId: '963656261848',
   projectId: 'flutterfire-ui-codelab',
   authDomain: 'flutterfire-ui-codelab.firebaseapp.com',
   storageBucket: 'flutterfire-ui-codelab.appspot.com',
   measurementId: 'G-DGF0CP099H',
 );

 static const FirebaseOptions android = FirebaseOptions(
  apiKey: "AIzaSyDpDlNJ-DX-JZoahupdN5p-dva6_4LUtXs",
  authDomain: "bookexchangeplatform-25bb8.firebaseapp.com",
  projectId: "bookexchangeplatform-25bb8",
  storageBucket: "bookexchangeplatform-25bb8.appspot.com",
  messagingSenderId: "1007351467446",
  appId: "1:1007351467446:web:414b83da905b47e04d0517",
  measurementId: "G-K6L8FT855Q",
 );

 static const FirebaseOptions ios = FirebaseOptions(
  apiKey: "AIzaSyDpDlNJ-DX-JZoahupdN5p-dva6_4LUtXs",
  authDomain: "bookexchangeplatform-25bb8.firebaseapp.com",
  projectId: "bookexchangeplatform-25bb8",
  storageBucket: "bookexchangeplatform-25bb8.appspot.com",
  messagingSenderId: "1007351467446",
  appId: "1:1007351467446:web:414b83da905b47e04d0517",
  measurementId: "G-K6L8FT855Q",
 );

 static const FirebaseOptions macos = FirebaseOptions(
   apiKey: "AIzaSyDpDlNJ-DX-JZoahupdN5p-dva6_4LUtXs",
  authDomain: "bookexchangeplatform-25bb8.firebaseapp.com",
  projectId: "bookexchangeplatform-25bb8",
  storageBucket: "bookexchangeplatform-25bb8.appspot.com",
  messagingSenderId: "1007351467446",
  appId: "1:1007351467446:web:414b83da905b47e04d0517",
  measurementId: "G-K6L8FT855Q",
 );
}
