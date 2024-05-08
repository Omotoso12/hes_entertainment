import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hes_entertainment/widgets/text_field.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QrPage extends StatefulWidget {
  final String data;
  const QrPage({super.key, required this.data});

  @override
  State<QrPage> createState() => _QrPageState();
}

final GlobalKey _qrkey = GlobalKey();
//dynamic externalDir = 'c:/Users/ooreoluwa/Downloads';
final ScreenshotController _screenshotController = ScreenshotController();
bool dirExist = false;

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Your QR Code for the event',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),

              const SizedBox(
                height: 20,
              ),

              //// qr code generated image.... ///////////////
              Center(
                child: RepaintBoundary(
                  key: _qrkey,
                  child: Screenshot(
                    controller: _screenshotController,
                    child: QrImageView(
                      data: widget.data,
                      size: 259,
                      version: QrVersions.auto,
                      errorStateBuilder: ((context, error) {
                        return const Center(
                          child: Text(
                            'Something went wrong!!!',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /////  Download Qr generated image button....................
              Center(
                child: ElevatedButton(
                  onPressed: _saveQrImage,
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(185, 48),
                      backgroundColor: const Color.fromARGB(255, 83, 113, 140),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Download',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              )
            ]),
      )),
    );
  }

  Future<void> _saveQrImage() async {
    try {
      final Meek meek = Meek();
      RenderRepaintBoundary boundary =
          _qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
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
      ByteData? bytedata =
          await qrImage.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = bytedata!.buffer.asUint8List();

      final Uint8List? pngByter = await _screenshotController.capture();

      String filename = 'your';

      meek.uploadFile(pngBytes, filename);

      // final Directory externalDir =
      //     await Directory('c:/Users/ooreoluwa/Downloads/qr')
      //         .create(recursive: false);

      // // check for duplicate file
      // int i = 1;
      // while (await File('${externalDir.path}/$filename.png').exists()) {
      //   filename = 'your_event_code_$i';
      //   i++;
      // }

      // // check if directory path exsist
      // dirExist = await File('$externalDir').exists();
      // // path create if path those not exsist
      // if (!dirExist) {
      //   await Directory('$externalDir').create(recursive: true);
      //   dirExist = true;
      // }

      // final file = await File('$externalDir/gjkhg.png').create();
      // await file.writeAsBytes(pngByter!);

      if (!mounted) return;
      const snackBar = SnackBar(
        content: Text(
          'QR code saved to Gallery',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      if (!mounted) return;
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
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
