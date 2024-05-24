import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/dashbaord/check_up.dart';
import 'package:hes_entertainment/dashbaord/check_up1.dart';
import 'package:hes_entertainment/dashbaord/check_up2.dart';
import 'package:hes_entertainment/dashbaord/check_up3.dart';
import 'package:hes_entertainment/dashbaord/check_up4.dart';
import 'package:hes_entertainment/entry/auth_manger.dart';

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

  @override
  Widget build(BuildContext context) {
    final List<String> name = firebaseUser.toString().split('@');
    final String email = firebaseUser.toString();
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
                            image: AssetImage('Background.png'))),
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
                            image: AssetImage('Background.png'))),
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
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              height: 42,
                                              width: 42,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: const Center(
                                                  child: Icon(Icons.person_2)),
                                            ),
                                          )
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
                                      height: 293,
                                      width: 156,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('paid.png'))),
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
                                              0.02,
                                    ),
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
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              height: 42,
                                              width: 42,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: const Center(
                                                  child: Icon(Icons.person_2)),
                                            ),
                                          )
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
                                      'Select one event',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    Container(
                                      height: 293,
                                      width: 156,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('card.png'))),
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
                                      height: 240,
                                      child: ListView(
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
                                                              3000;
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
                                                '$_price',
                                                //₦
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
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return CheckUp(
                                                    value: _result,
                                                    price: _price,
                                                    mail: email,
                                                  );
                                                }));
                                              }
                                              if (_result == 2) {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return CheckUp1(
                                                    value: _result,
                                                    price: _price,
                                                    mail: email,
                                                  );
                                                }));
                                              }
                                              if (_result == 3) {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return CheckUp2(
                                                    value: _result,
                                                    price: _price,
                                                    mail: email,
                                                  );
                                                }));
                                              }
                                              if (_result == 4) {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return CheckUp3(
                                                    value: _result,
                                                    price: _price,
                                                    mail: email,
                                                  );
                                                }));
                                              }
                                              if (_result == 5) {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return CheckUp4(
                                                    value: _result,
                                                    price: _price,
                                                    mail: email,
                                                  );
                                                }));
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                  );
          }),
    );
  }
}
