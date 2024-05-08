import 'package:flutter/material.dart';
import 'package:hes_entertainment/dashbaord/controllers.dart';

class CheckUp extends StatefulWidget {
  final double value;
  final double price;

  const CheckUp({super.key, required this.value, required this.price});

  @override
  State<CheckUp> createState() => _CheckUpState();
}

TextEditingController textEditingController = TextEditingController();
late List<AllControl> allControl;

class _CheckUpState extends State<CheckUp> {
  @override
  void initState() {
    allControl = [
      AllControl(
        visible: (widget.value == 1) ? true : false,
        controller: TextEditingController(),
        // focus: FocusScope.of(context).focusedChild,
      ),
      AllControl(
        visible: (widget.value == 2) ? true : false,
        controller: TextEditingController(),
        // focus: FocusScope.of(context).focusedChild,
      ),
      AllControl(
        visible: (widget.value == 3) ? true : false,
        controller: TextEditingController(),
        // focus: FocusScope.of(context).focusedChild,
      ),
      AllControl(
        visible: (widget.value == 4) ? true : false,
        controller: TextEditingController(),
        // focus: FocusScope.of(context).focusedChild,
      ),
      AllControl(
        visible: (widget.value == 5) ? true : false,
        controller: TextEditingController(),
        // focus: FocusScope.of(context).focusedChild,
      ),
    ];
    super.initState();
  }

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
                    'Security Check',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 24),
                  ),
                  const Text(
                    'Please enter name and upload images of the\nparty attendants.',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),

                  SizedBox(
                    width: 330,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: (widget.value.toInt()),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              width: 330,
                              height: (allControl[index]
                                          .controller
                                          .text
                                          .isNotEmpty &&
                                      allControl[index].visible)
                                  ? 260
                                  : 210,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 7, 16, 26),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'Image',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.02,
                                      ),
                                      ///////////////////////////////////////////////////////////////////////////
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            height: 57,
                                            width: 57,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.02,
                                          ),
                                          const Text(
                                            'Upload image \nMax 5mb',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontStyle: FontStyle.italic,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.02,
                                      ),

                                      ////////////input name field....
                                      const Text('Name',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          )),
                                      TextField(
                                        // focusNode: allControl[index].focus!,
                                        style: const TextStyle(fontSize: 12),
                                        controller:
                                            allControl[index].controller,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 83, 113, 140),
                                                  width: 2)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 162, 210, 24),
                                                  width: 2)),
                                        ),
                                      ),

                                      Visibility(
                                        visible: (allControl[index].visible),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(180, 41),
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            child: const Text(
                                              'Pay with Paystack',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 83, 113, 140),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),

                  ////// payment button.................
                  ///
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
