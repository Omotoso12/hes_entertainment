import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/dashbaord/controllers.dart';
import 'package:hes_entertainment/widgets/form_field.dart';

class CheckUp extends StatefulWidget {
  final double value;
  final double price;

  const CheckUp({super.key, required this.value, required this.price});

  @override
  State<CheckUp> createState() => _CheckUpState();
}

TextEditingController textEditingController = TextEditingController();
late List<AllControl> allControl;
late List<Uint8List?> imageFiles;
late List<String> nameOfImages;

bool visi = false;

class _CheckUpState extends State<CheckUp> {
  @override
  void initState() {
    allControl = <AllControl>[
      AllControl(
        numb: 1.0,
        visible: (widget.value == 1) ? visi : false,
        controller: TextEditingController(),
        formKey: GlobalKey<FormState>(),
      ),
      AllControl(
        numb: 2.0,
        visible: (widget.value == 2) ? visi : false,
        controller: TextEditingController(),
        formKey: GlobalKey<FormState>(),
      ),
      AllControl(
        numb: 3.0,
        visible: (widget.value == 3) ? visi : false,
        controller: TextEditingController(),
        formKey: GlobalKey<FormState>(),
      ),
      AllControl(
        numb: 4.0,
        visible: (widget.value == 4) ? visi : false,
        controller: TextEditingController(),
        formKey: GlobalKey<FormState>(),
      ),
      AllControl(
        numb: 5.0,
        visible: (widget.value == 5) ? visi : false,
        controller: TextEditingController(),
        formKey: GlobalKey<FormState>(),
      ),
    ];
    imageFiles = [
      null,
      null,
      null,
      null,
      null,
    ];
    nameOfImages = ['', '', '', '', ''];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.1),
              child: Column(
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                width: 330,
                                height:
                                    (widget.value == allControl[index].numb &&
                                            visi == true)
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
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.02,
                                        ),
                                        ///////////////////////////////////////////////////////////////////////////
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 57,
                                                    height: 57,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: nameOfImages[index]
                                                            .isEmpty
                                                        ? Image.asset(
                                                            'profile.png',
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Image.memory(
                                                            imageFiles[index]!,
                                                            fit: BoxFit.fill),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          _selectPicture(index),
                                                      child: Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color.fromARGB(
                                                              255,
                                                              83,
                                                              113,
                                                              140),
                                                        ),
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                            size: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.02,
                                        ),

                                        ////////////input name field....
                                        const Text('Name',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                            )),
                                        Form(
                                          key: allControl[index].formKey,
                                          child: CustomFormField(
                                            controller:
                                                allControl[index].controller,
                                            onChanged: (text) {
                                              // Custom logic when text changes.
                                              if (text.characters.length > 8 &&
                                                  (widget.value ==
                                                      allControl[index].numb)) {
                                                setState(() {
                                                  visi = true;
                                                });
                                              }

                                              if (text.characters.length < 8) {
                                                setState(() {
                                                  visi = false;
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                        Visibility(
                                          visible: (widget.value ==
                                                  allControl[index].numb)
                                              ? visi
                                              : false,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      const Size(180, 41),
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
                    ///
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  _selectPicture(int index) async {
    FilePickerResult? image = await FilePicker.platform.pickFiles();
    final navInt = index;

    if (image != null) {
      setState(() {
        nameOfImages[navInt] = image.files.first.name;
        imageFiles[navInt] = image.files.first.bytes;
      });
    }
    return null;
  }
}
