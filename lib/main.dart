import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAnSAK_PflP1JDqDgQ6O10rtlXfg3Vpqmw",
      projectId: "hesentertainment-fbbcb",
      storageBucket: "hesentertainment-fbbcb.appspot.com",
      messagingSenderId: "1026820399623",
      appId: "1:1026820399623:web:c9bec1dfba9260e8c2c0a2",
      measurementId: "G-VXHS4BVGEF",
    ),
  );
  runApp(const MyApp());
}
