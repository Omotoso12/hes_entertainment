import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class Meek {
  Future<void> uploadFile(Uint8List uint8list, String filename) async {
    try {
      await FirebaseStorage.instance.ref().child(filename).putData(uint8list);
    } catch (e) {
      print(e);
    }
  }
}
