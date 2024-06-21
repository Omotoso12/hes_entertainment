import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'qr_page.dart';

class GenerateQr extends StatefulWidget {
  const GenerateQr({super.key});

  @override
  State<GenerateQr> createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  final firebaseUid = FirebaseAuth.instance.currentUser!.uid;
  final firebaseUser = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    final List<String> name = firebaseUser.toString().split('@');
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('HES_USER')
                .doc(firebaseUid)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/Background.png'))),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/Background.png'))),
                      child: SingleChildScrollView(
                        //physics: const NeverScrollableScrollPhysics(),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height * 0.1),
                            child: Column(
                              // Column is also a layout widget. It takes a list of children and
                              // arranges them vertically. By default, it sizes itself to fit its
                              // children horizontally, and tries to be as tall as its parent.

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'HES 2.5 \nEntertainment:',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                ),
                                //////////////////////////////////////////////////////////////////////////////////////////
                                Text(
                                  'Making Ticket',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),

                                SizedBox(
                                  width: 310,
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Payments',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                          child: DefaultTextStyle(
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 162, 210, 24),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
                                        child: AnimatedTextKit(
                                          repeatForever: true,
                                          pause: const Duration(
                                              milliseconds: 3000),
                                          animatedTexts: [
                                            RotateAnimatedText('Safer',
                                                duration: Durations.short4,
                                                rotateOut: false),
                                            RotateAnimatedText('Secure',
                                                duration: Durations.short4,
                                                rotateOut: false),
                                            RotateAnimatedText('Efficient',
                                                duration: Durations.short4,
                                                rotateOut: false),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.02,
                                ),

                                /// welcome  message..
                                /// .. section
                                const Text(
                                  'Dashboard',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  width: 310,
                                  child: Row(
                                    children: <Widget>[
                                      const Text(
                                        'Welcome',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 162, 210, 24),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '@${name[0]}',
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.02,
                                ),

                                /////////// card sectitan....
                                /// detailing
                                const Text(
                                  'Select one event',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Container(
                                  height: 110,
                                  width: 310,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/paid.png'))),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.02,
                                ),

                                /// Number of tickets buyers selection section
                                /// using radio button and text
                                ///

                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return QrPage(
                                          data: snapshot.data!
                                              .data()!['imageQr']
                                              .toString());
                                    }));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(185, 48),
                                      backgroundColor: const Color.fromARGB(
                                          255, 83, 113, 140),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: const Text(
                                    'Generate QR Code',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.02,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
