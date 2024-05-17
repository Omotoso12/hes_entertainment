import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/dashbaord/dashboard.dart';
import 'package:hes_entertainment/entry/sign_in.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Dashboard();
          } else {
            return const SignIn();
          }
        },
      ),
    );
  }
}
