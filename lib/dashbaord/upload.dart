import 'dart:typed_data';
import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UploadPage extends StatefulWidget {
  final List<Uint8List?> imageFiles;
  final List<String> nameOfImages;
  final List<String> storageName;
  final List<String> clientName;
  const UploadPage(
      {required this.imageFiles,
      required this.nameOfImages,
      required this.storageName,
      required this.clientName,
      super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

double val = 1;
bool uploading = false;
final GlobalKey _newKey = GlobalKey();
late final Uint8List? imgQr;

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              !uploading
                  ? Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/Background.png'))),
                      child: SingleChildScrollView(
                          child: Center(
                              child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.1),
                        child: SizedBox(
                          width: 330,
                          child: Column(
                            children: [
                              RepaintBoundary(
                                key: _newKey,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: (widget.imageFiles.length),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Container(
                                          width: 310,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 7, 16, 26),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  const SizedBox(width: 10),
                                                  ///////////////////////////////////////////////////////////////////////////
                                                  Center(
                                                    child: Container(
                                                      width: 150,
                                                      height: 120,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Image.memory(
                                                          widget.imageFiles[
                                                              index]!,
                                                          fit: BoxFit.fill),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),

                                                  ////////////name field....
                                                  Center(
                                                    child: Text(
                                                        widget
                                                            .clientName[index],
                                                        style: const TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                        )),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      uploading = true;
                                    });
                                    ////////////////////////
                                    ///uploading single image...
                                    if (widget.imageFiles.length == 1) {
                                      uploadQrData();
                                      uploadImage(widget.imageFiles.length)
                                          .whenComplete(
                                        () => Beamer.of(context).beamToNamed(
                                            '/dashboard/profile/codegeneration'),
                                      );
                                      upload1Data(widget.clientName[0]);
                                    }
                                    ////////////////////////
                                    ///uploading double image...
                                    if (widget.imageFiles.length == 2) {
                                      uploadQrData();
                                      uploadImage(widget.imageFiles.length)
                                          .whenComplete(
                                        () => Beamer.of(context).beamToNamed(
                                            '/dashboard/profile/codegeneration'),
                                      );
                                      upload2Data(
                                        widget.clientName[0],
                                        widget.clientName[1],
                                      );
                                    }
                                    ////////////////////////
                                    ///uploading triple image...
                                    if (widget.imageFiles.length == 3) {
                                      uploadQrData();
                                      uploadImage(widget.imageFiles.length)
                                          .whenComplete(
                                        () => Beamer.of(context).beamToNamed(
                                            '/dashboard/profile/codegeneration'),
                                      );
                                      upload3Data(
                                        widget.clientName[0],
                                        widget.clientName[1],
                                        widget.clientName[2],
                                      );
                                    }
                                    ////////////////////////
                                    ///uploading four images...
                                    if (widget.imageFiles.length == 4) {
                                      uploadQrData();
                                      uploadImage(widget.imageFiles.length)
                                          .whenComplete(
                                        () => Beamer.of(context).beamToNamed(
                                            '/dashboard/profile/codegeneration'),
                                      );
                                      upload4Data(
                                        widget.clientName[0],
                                        widget.clientName[1],
                                        widget.clientName[2],
                                        widget.clientName[3],
                                      );
                                    }

                                    ////////////////////////
                                    ///uploading five images
                                    if (widget.imageFiles.length == 5) {
                                      uploadQrData();
                                      uploadImage(widget.imageFiles.length)
                                          .whenComplete(
                                        () => Beamer.of(context).beamToNamed(
                                            '/dashboard/profile/codegeneration'),
                                      );
                                      upload5Data(
                                        widget.clientName[0],
                                        widget.clientName[1],
                                        widget.clientName[2],
                                        widget.clientName[3],
                                        widget.clientName[4],
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(180, 41),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 83, 113, 140),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
                    )
                  : Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/Background.png'))),
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 5, 19, 32),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Text(
                                  'uploading...',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future uploadQrData() async {
    RenderRepaintBoundary boundary =
        _newKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage(pixelRatio: 3.0);

    // creating qrimage background color........
    final qrBackgroundColor = Paint()..color = Colors.white;
    final qrImageRecorder = PictureRecorder();
    final qrImageCanvas = Canvas(qrImageRecorder,
        Rect.fromLTRB(0, 0, image.width.toDouble(), image.height.toDouble()));
    qrImageCanvas.drawRect(
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        qrBackgroundColor);
    qrImageCanvas.drawImage(image, Offset.zero, Paint());
    final qrPicture = qrImageRecorder.endRecording();
    final qrImage = await qrPicture.toImage(image.width, image.height);
    ByteData? bytedata = await qrImage.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = bytedata!.buffer.asUint8List();

    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    Reference storageRef =
        FirebaseStorage.instance.ref().child('$firebaseUser/qrImage');
    await storageRef
        .putBlob(pngBytes, SettableMetadata(contentType: 'png'))
        .whenComplete(() async {
      await storageRef.getDownloadURL().then((value) async {
        await FirebaseFirestore.instance
            .collection('HES_USER')
            .doc(firebaseUser)
            .set(
                {'imageQr': value},
                SetOptions(
                  merge: true,
                ));
      });
    });
  }

/////upoading data seperate functions
  Future upload1Data(
    String name,
  ) async {
    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('HES_USER')
        .doc(firebaseUser)
        .set(
            {
          'name1': name,
          'paid': true,
          'client_val': 1,
        },
            SetOptions(
              merge: true,
            ));
  }

  Future upload2Data(
    String name,
    String name2,
  ) async {
    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('HES_USER')
        .doc(firebaseUser)
        .set(
            {
          'name1': name,
          'name2': name2,
          'paid': true,
          'client_val': 2,
        },
            SetOptions(
              merge: true,
            ));
  }

  Future upload3Data(String name, String name2, String name3) async {
    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('HES_USER')
        .doc(firebaseUser)
        .set(
            {
          'name1': name,
          'name2': name2,
          'name3': name3,
          'paid': true,
          'client_val': 3,
        },
            SetOptions(
              merge: true,
            ));
  }

  Future upload4Data(
      String name, String name2, String name3, String name4) async {
    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('HES_USER')
        .doc(firebaseUser)
        .set(
            {
          'name1': name,
          'name2': name2,
          'name3': name3,
          'name4': name4,
          'paid': true,
          'client_val': 4,
        },
            SetOptions(
              merge: true,
            ));
  }

  Future upload5Data(
    String name,
    String name2,
    String name3,
    String name4,
    String name5,
  ) async {
    String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('HES_USER')
        .doc(firebaseUser)
        .set(
            {
          'name1': name,
          'name2': name2,
          'name3': name3,
          'name4': name4,
          'name5': name5,
          'paid': true,
          'client_val': 5,
        },
            SetOptions(
              merge: true,
            ));
  }

  ///////upload image fuction, managing all instance of image upload...////////////
  ///

  Future uploadImage(int newValue) async {
    int i = 1;
    for (var img in widget.imageFiles) {
      setState(() {
        val = i / newValue;
      });
      String firebaseUser = FirebaseAuth.instance.currentUser!.uid;
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('$firebaseUser/${widget.nameOfImages[i - 1]}');
      await storageRef
          .putBlob(img, SettableMetadata(contentType: 'png'))
          .whenComplete(() async {
        await storageRef.getDownloadURL().then((value) async {
          await FirebaseFirestore.instance
              .collection('HES_USER')
              .doc(firebaseUser)
              .set(
                  {widget.storageName[i - 1]: value},
                  SetOptions(
                    merge: true,
                  ));
        });
        i++;
      });
    }
  }
}
