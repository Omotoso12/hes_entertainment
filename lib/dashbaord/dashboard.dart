import 'package:flutter/material.dart';

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

  final _radioOptions = [
    TimeValue(1, "1 person"),
    TimeValue(2, "2 people"),
    TimeValue(3, "3 people"),
    TimeValue(4, "4 people"),
    TimeValue(5, "5 people"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('Background.png'))),
        child: SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.1),
              child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 330,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Center(child: Icon(Icons.person_2)),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  //////////////////////////////////////////////////////////////////////////////////////////
                  Text(
                    'Making Ticket',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  SizedBox(
                    width: 265,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Payments',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Text(
                          'Safer',
                          style: TextStyle(
                              color: Color.fromARGB(255, 162, 210, 24),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
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
                  const SizedBox(
                    width: 210,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Color.fromARGB(255, 162, 210, 24),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            '@ajaorichard30',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
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
                        image: DecorationImage(image: AssetImage('card.png'))),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
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
                          .map((buyerValue) => RadioListTile<double>(
                                contentPadding: const EdgeInsets.all(0.0),
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.white),
                                activeColor: Colors.white,
                                groupValue: _result,
                                title: Text(
                                  buyerValue._value,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                value: buyerValue._key,
                                onChanged: (value) {
                                  setState(() {
                                    _result = value!.toDouble();
                                  });
                                },
                              ))
                          .toList(),
                    ),
                  ),

                  Text('$_result'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
