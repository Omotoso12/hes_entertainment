// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  final String data;
  const QrPage({super.key, required this.data});

  @override
  State<QrPage> createState() => _QrPageState();
}

final GlobalKey _qrkey = GlobalKey();
bool dirExist = false;
bool done = false;

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),

                Container(
                  height: 60,
                  width: 148,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage('grad1.png'))),
                ),

                const SizedBox(
                  height: 20,
                ),

                //// qr code generated image.... ///////////////
                Center(
                  child: RepaintBoundary(
                    key: _qrkey,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(spreadRadius: 1.0, blurRadius: 6.0)
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: const Color.fromARGB(255, 83, 113, 140),
                              width: 6)),
                      child: Center(
                        child: QrImageView(
                          embeddedImage: const AssetImage('logo.png'),
                          data: widget.data,
                          size: 200,
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
                ),

                const SizedBox(
                  height: 20,
                ),

                /////  Download Qr generated image button....................
                !done
                    ? Center(
                        child: ElevatedButton(
                          onPressed: _saveQrImage,
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(185, 48),
                              backgroundColor:
                                  const Color.fromARGB(255, 83, 113, 140),
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
                    : Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Beamer.of(context).beamToNamed('/dashboard');
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(185, 48),
                              backgroundColor:
                                  const Color.fromARGB(255, 83, 113, 140),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            'Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ),

                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 15,
                  width: 90,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage('grad2.png'))),
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  '1. This QR code will be scanned at the \nvenue before you are gained access\nto the event. \n\n2. If in case you lose your QR code, you \ncan always come back to download\nit again at your profile menu.',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ]),
        )),
      ),
    );
  }

  Future<void> _saveQrImage() async {
    try {
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
      Uint8List pngBytes =
          bytedata!.buffer.asUint8List(); // image generated in Unit8List type

      // download generated file on web

      String filename = 'genetated_event_qr.png';

      final blob = html.Blob(<dynamic>[pngBytes], 'application/octet-stream');
      html.AnchorElement(href: html.Url.createObjectUrlFromBlob(blob))
        ..setAttribute('download', filename)
        ..click();

      if (!mounted) return;
      setState(() {
        done = true;
      });
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
