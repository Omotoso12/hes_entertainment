import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/entry/auth_manger.dart';
import 'package:url_launcher/url_launcher.dart';

class TimeValue {
  final double _key;
  final String _value;
  TimeValue(this._key, this._value);
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _result = 0.0;
  double _price = 0.0;
  bool _visible = false;
  final HandleAuth authHandler = HandleAuth();

  final _radioOptions = [
    TimeValue(1, "1 person"),
    TimeValue(2, "2 people"),
    TimeValue(3, "3 people"),
    TimeValue(4, "4 people"),
    TimeValue(5, "5 people"),
  ];

  final firebaseUser = FirebaseAuth.instance.currentUser!.email;
  final firebaseUid = FirebaseAuth.instance.currentUser!.uid;

  final Uri instagramUrl =
      Uri.parse('https://www.instagram.com/hes2.5entmt?igsh=bmpmbHR1MmxtODU1');

  static const String whatsapp = "+2349035258990";
  final Uri whatsAppUrl =
      Uri.parse("https://wa.me/$whatsapp?text=${Uri.parse("")}");

  final Uri gmailUrl = Uri(
    scheme: 'mailto',
    path: 'hes2.5entertainment@gmail.com',
    query: 'subject=Explain your needs&body=${Uri.parse("")}',
  );

  @override
  Widget build(BuildContext context) {
    final List<String> name = firebaseUser.toString().split('@');
    final url = gmailUrl.toString();
    final urlPath = Uri.parse(url);
    return Scaffold(
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
                    child: snapshot.data!.data()!['paid']
                        ? SingleChildScrollView(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.sizeOf(context).height *
                                        0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 330,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'HES 2.5 \nEntertainment:',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),

                                          // profile && logout button manager...////////////////////////////////
                                          PopupMenuButton(
                                            color: const Color.fromARGB(
                                                255, 83, 113, 140),
                                            child: Container(
                                              height: 42,
                                              width: 42,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: const Center(
                                                  child: Icon(Icons.person_2)),
                                            ),
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                child: TextButton(
                                                  child: const Text(
                                                    'profile',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                  onPressed: () {
                                                    Beamer.of(context)
                                                        .beamToNamed(
                                                            '/dashboard/profile');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              PopupMenuItem(
                                                child: TextButton(
                                                    child: const Text(
                                                      'log out',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14),
                                                    ),
                                                    onPressed: () {
                                                      authHandler.logOut();
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                            ],
                                          ),
                                          ///////////////////////////////////
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////
                                    Text(
                                      'Making Ticket',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),

                                    SizedBox(
                                      width: 265,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Payments',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          const Text(
                                            'Safer',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 162, 210, 24),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 32),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
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
                                      width: 250,
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
                                              0.02,
                                    ),

                                    /////////// card sectitan....
                                    /// detailing
                                    Container(
                                      height: 110,
                                      width: 310,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/paid.png'))),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
                                    ),
                                    const Text(
                                      'Thank you for using this ticket payment \nplatform! Please follow our socials for more \nupcoming updates.',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                    ),

                                    const SizedBox(
                                      width: 320,
                                      height: 24,
                                      child: Center(
                                        child: Text(
                                          'Contact us for support',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 5,
                                    ),

                                    SizedBox(
                                      width: 320,
                                      height: 24,
                                      child: Center(
                                        child: SizedBox(
                                          width: 112,
                                          height: 24,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              GestureDetector(
                                                  onTap: () => _launchWhatsapp(
                                                      whatsAppUrl),
                                                  child: Image.asset(
                                                      height: 24,
                                                      width: 24,
                                                      'assets/whatsapp.png')),
                                              GestureDetector(
                                                  onTap: () => _launchInsta(
                                                      instagramUrl),
                                                  child: Image.asset(
                                                      height: 24,
                                                      width: 24,
                                                      'assets/instagram.png')),
                                              GestureDetector(
                                                  onTap: () =>
                                                      _launchGmail(urlPath),
                                                  child: Image.asset(
                                                      height: 24,
                                                      width: 24,
                                                      'assets/gmail.png')),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 310,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'HES 2.5 \nEntertainment:',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),

                                          // profile && logout button manager...////////////////////////////////
                                          PopupMenuButton(
                                            color: const Color.fromARGB(
                                                255, 83, 113, 140),
                                            child: Container(
                                              height: 42,
                                              width: 42,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: const Center(
                                                  child: Icon(Icons.person_2)),
                                            ),
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                child: TextButton(
                                                  child: const Text(
                                                    'profile',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14),
                                                  ),
                                                  onPressed: () {
                                                    Beamer.of(context)
                                                        .beamToNamed(
                                                            '/dashboard/profile');
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              PopupMenuItem(
                                                child: TextButton(
                                                    child: const Text(
                                                      'log out',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14),
                                                    ),
                                                    onPressed: () {
                                                      authHandler.logOut();
                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                            ],
                                          ),
                                          ///////////////////////////////////
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                    ),
                                    //////////////////////////////////////////////////////////////////////////////////////////
                                    Text(
                                      'Making Ticket',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),

                                    SizedBox(
                                      width: 265,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Payments',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          const Text(
                                            'Safer',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 162, 210, 24),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 32),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
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
                                      width: 250,
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
                                              0.02,
                                    ),

                                    /////////// card sectitan....
                                    /// detailing
                                    const Text(
                                      'Spycity Night Life Party',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        'August 24th by 4:00PM - 4:00AM',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 310,
                                      child: Row(
                                        children: [
                                          Text(
                                            '₦',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            '4000',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 110,
                                      width: 310,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/card.png'))),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
                                    ),

                                    /// Number of tickets buyers selection section
                                    /// using radio button and text
                                    ///

                                    const Text(
                                      'Ticket for?',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),

                                    SizedBox(
                                      width: 180,
                                      height: 280,
                                      child: ListView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: _radioOptions
                                            .map((buyerValue) =>
                                                RadioListTile<double>(
                                                  contentPadding:
                                                      const EdgeInsets.all(0.0),
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              (states) =>
                                                                  Colors.white),
                                                  activeColor: Colors.white,
                                                  groupValue: _result,
                                                  title: Text(
                                                    buyerValue._value,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  ),
                                                  value: buyerValue._key,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _result =
                                                          value!.toDouble();
                                                      _price =
                                                          value.toDouble() *
                                                              4000;
                                                      _visible = true;
                                                    });
                                                  },
                                                ))
                                            .toList(),
                                      ),
                                    ),

                                    Visibility(
                                      visible: _visible,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 38,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 162, 210, 24),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                'N$_price',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                      255,
                                                      1,
                                                      88,
                                                      168,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.02,
                                          ),
                                        ],
                                      ),
                                    ),

                                    ElevatedButton(
                                      onPressed: _visible
                                          ? () {
                                              if (_result == 1) {
                                                Beamer.of(context).beamToNamed(
                                                    '/dashboard/checkup_1');
                                              }
                                              if (_result == 2) {
                                                Beamer.of(context).beamToNamed(
                                                    '/dashboard/checkup_2');
                                              }
                                              if (_result == 3) {
                                                Beamer.of(context).beamToNamed(
                                                    '/dashboard/checkup_3');
                                              }
                                              if (_result == 4) {
                                                Beamer.of(context).beamToNamed(
                                                    '/dashboard/checkup_4');
                                              }
                                              if (_result == 5) {
                                                Beamer.of(context).beamToNamed(
                                                    '/dashboard/checkup_5');
                                              }
                                            }
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(120, 38),
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: const Text(
                                        'Proceed',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                    ),

                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
                                    ),

                                    const SizedBox(
                                      width: 320,
                                      height: 24,
                                      child: Center(
                                        child: Text(
                                          'Contact us for support',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 5,
                                    ),

                                    SizedBox(
                                        width: 320,
                                        height: 24,
                                        child: Center(
                                            child: SizedBox(
                                                width: 112,
                                                height: 24,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                          onTap: () =>
                                                              _launchWhatsapp(
                                                                  whatsAppUrl),
                                                          child: Image.asset(
                                                              height: 24,
                                                              width: 24,
                                                              'assets/whatsapp.png')),
                                                      GestureDetector(
                                                          onTap: () =>
                                                              _launchInsta(
                                                                  instagramUrl),
                                                          child: Image.asset(
                                                              height: 24,
                                                              width: 24,
                                                              'assets/instagram.png')),
                                                      GestureDetector(
                                                          onTap: () =>
                                                              _launchGmail(
                                                                  urlPath),
                                                          child: Image.asset(
                                                              height: 24,
                                                              width: 24,
                                                              'assets/gmail.png')),
                                                    ])))),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  );
          }),
    );
  }

  Future<void> _launchWhatsapp(Uri url) async {
    if (!await launchUrl(url, webOnlyWindowName: "_self")) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchGmail(Uri url) async {
    if (!await launchUrl(url, webOnlyWindowName: "_self")) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchInsta(Uri url) async {
    if (!await launchUrl(url, webOnlyWindowName: "_self")) {
      throw Exception('Could not launch $url');
    }
  }
}
