import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/services/screen_extension.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  final String data;
  const QrPage({super.key, required this.data});

  @override
  State<QrPage> createState() => _QrPageState();
}

final GlobalKey _qrcanvas = GlobalKey();
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
                          fit: BoxFit.fill,
                          image: AssetImage('assets/grad1.png'))),
                ),

                const SizedBox(
                  height: 20,
                ),

                //// qr code generated image.... ///////////////
                Center(
                  child: RepaintBoundary(
                    key: _qrcanvas, //.globalPaintBounds,
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
                          embeddedImage: const AssetImage('assets/logo.png'),
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
                          onPressed: shotShoot,
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
                            setState(() {
                              done = !done;
                            });
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
                          fit: BoxFit.fill,
                          image: AssetImage('assets/grad2.png'))),
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

  void shotShoot() async {
    try {
      await js.context.callMethod('InjectHtml2canvas');
      Rect rect = _qrcanvas.globalPaintBounds;
      await js.context.callMethod(
          'capture', [rect.left, rect.top, rect.right, rect.bottom]);

      if (!mounted) return;
      setState(() {
        done = true;
      });
      const snackBar = SnackBar(
        backgroundColor: Colors.black26,
        duration: Durations.short1,
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
        backgroundColor: Colors.black26,
        duration: Durations.short1,
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
