import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HandleAuth {
  Future createAccount(
      String email, String password, BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // add user details
      addUserDetails(
        email,
      );

      // ignore: use_build_context_synchronously
      popPage(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: Text(
          '$e',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future signIn(String email, String password, BuildContext context) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      // sign in user
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      popPage(context);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      const snackBar = SnackBar(
        content: Text(
          'Invalid mail or password',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future forgotPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        const snackBar = SnackBar(
          content: Text(
            'email sent, check on mail',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } on FirebaseAuthException catch (err) {
      throw Exception(err.message.toString());
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future addUserDetails(
    String email,
  ) async {
    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('HES_USER')
        .doc(firebaseUser)
        .set({
      'email': email,
      'paid': false,
    });
  }

  void popPage(BuildContext context) {
    Beamer.of(context).beamToNamed('/dashboard');
  }
}
