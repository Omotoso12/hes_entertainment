import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/dashbaord/dashboard.dart';

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

  Future addUserDetails(
    String email,
  ) async {
    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('HES_USER')
        .doc(firebaseUser)
        .set({
      'email': email,
    });
  }

  void popPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return const Dashboard();
    }), (Route<dynamic> route) => false);
  }
}

//  Map<String, dynamic>? userData;

//   Future<Map<String, dynamic>?> userDetails() async {
//     final firebaseUser = FirebaseAuth.instance.currentUser!.uid;
//     FirebaseFirestore.instance
//         .collection('HES_USER')
//         .doc(firebaseUser)
//         .get()
//         .then((userDoc) {
//       userData = userDoc.data();
//     });
//     return userData;
//   }


// String _userName = '';
// Future<void> _getUserName() async {
//   FirebaseFirestore.instance
//       .collection('Users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .get()
//       .then((value) {
//     setState(() {
//       _userName = value.data['UserName'].toString();
//     });
//   });
// }
