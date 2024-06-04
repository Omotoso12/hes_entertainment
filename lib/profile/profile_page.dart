import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/profile/one_profile.dart';

import 'more_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final firebaseUser = FirebaseAuth.instance.currentUser!.email;
  final firebaseUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final List<String> name = firebaseUser.toString().split('@');

    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('HES_USER')
              .doc(firebaseUid)
              .snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/Background.png'))),
                    child: snapshot.data!.data()!['paid']
                        ? SingleChildScrollView(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.sizeOf(context).height *
                                        0.1),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Profile',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Row(
                                          children: <Widget>[
                                            const Text(
                                              'hello',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 162, 210, 24),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                '@${name[0]}',
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.08,
                                      ),
                                      const Text(
                                        'History',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.02,
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Row(
                                          children: <Widget>[
                                            const Text(
                                              'Spycity tickets',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                (snapshot.data!
                                                            .data()![
                                                                'client_val']
                                                            .toInt() ==
                                                        1)
                                                    ? '${snapshot.data!.data()!['client_val']} person'
                                                    : '${snapshot.data!.data()!['client_val']} people',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 162, 210, 24),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.02,
                                      ),
                                      if (snapshot.data!
                                              .data()!['client_val']
                                              .toInt() ==
                                          1)
                                        OneUser(
                                            name: snapshot.data!
                                                .data()!['name1']
                                                .toString(),
                                            url: snapshot.data!
                                                .data()!['third']
                                                .toString()),

                                      ///////////two users.... display

                                      if (snapshot.data!
                                              .data()!['client_val']
                                              .toInt() ==
                                          2)
                                        MoreUser(name: [
                                          snapshot.data!
                                              .data()!['name1']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name2']
                                              .toString()
                                        ], url: [
                                          snapshot.data!
                                              .data()!['first']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['second']
                                              .toString()
                                        ]),

                                      ///////////three users.... display

                                      if (snapshot.data!
                                              .data()!['client_val']
                                              .toInt() ==
                                          3)
                                        MoreUser(name: [
                                          snapshot.data!
                                              .data()!['name1']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name2']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name3']
                                              .toString(),
                                        ], url: [
                                          snapshot.data!
                                              .data()!['first']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['second']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['third']
                                              .toString(),
                                        ]),

                                      ///////////four users.... display

                                      if (snapshot.data!
                                              .data()!['client_val']
                                              .toInt() ==
                                          4)
                                        MoreUser(name: [
                                          snapshot.data!
                                              .data()!['name1']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name2']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name3']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name4']
                                              .toString(),
                                        ], url: [
                                          snapshot.data!
                                              .data()!['first']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['second']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['third']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['fouth']
                                              .toString(),
                                        ]),

                                      ///////////five users.... display

                                      if (snapshot.data!
                                              .data()!['client_val']
                                              .toInt() ==
                                          5)
                                        MoreUser(name: [
                                          snapshot.data!
                                              .data()!['name1']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name2']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name3']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name4']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['name5']
                                              .toString(),
                                        ], url: [
                                          snapshot.data!
                                              .data()!['first']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['second']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['third']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['fouth']
                                              .toString(),
                                          snapshot.data!
                                              .data()!['fifth']
                                              .toString(),
                                        ]),

                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Lost your spycity tickets?',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      ElevatedButton(
                                          onPressed: () {
                                            Beamer.of(context).beamToNamed(
                                                '/dashboard/profile/codegeneration');
                                          },
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(266, 48),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      51, 83, 113, 140),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Text(
                                            'Download again',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.sizeOf(context).height *
                                        0.1),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Profile',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Row(
                                          children: <Widget>[
                                            const Text(
                                              'hello',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 162, 210, 24),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                '@${name[0]}',
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.08,
                                      ),
                                      const Text(
                                        'No History',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.02,
                                      ),
                                      const SizedBox(
                                        width: 300,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Hello!',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 162, 210, 24),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              ' To access your complete profile you',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Text(
                                        'need to purchase on HES 2.5 \nentertainment ticket',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.02,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Beamer.of(context)
                                                .beamToNamed('/dashboard');
                                          },
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(266, 48),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      51, 83, 113, 140),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Text(
                                            'Purchase',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ))
                                    ]),
                              ),
                            ),
                          ))
                : Container(
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
                  );
          }),
    );
  }
}
