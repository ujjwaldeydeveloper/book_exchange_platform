import 'package:book_exchange_platform/app.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(
                  clientId:
                      '1007351467446-8s6qnlmqgg43rppneoc5vdpu4ksttboi.apps.googleusercontent.com'),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('assets/images/ic_book_store.png')),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text(
                        'Welcome to Book Exchange Point, Please sign in!')
                    : const Text(
                        'Welcome to Book Exchange Point, Please sign up'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'By signing in, you agree to our Terms and Consition',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Transform.scale(
                  scale: 6,
                  child: AspectRatio(
                      aspectRatio: 10,
                      child: Image.asset('assets/images/logo_large.png')),
                ),
              );
            },
          );
        }
        return const MyApp();
      },
    );
  }
}
