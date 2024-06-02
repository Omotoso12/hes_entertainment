import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/dashbaord/check_up.dart';
import 'package:hes_entertainment/dashbaord/controllers.dart';
import 'package:hes_entertainment/dashbaord/upload.dart';
import 'package:hes_entertainment/widgets/form_field.dart';

import '../services/paystack_interop.dart';

class CheckUp4 extends StatefulWidget {
  final double value;
  final double price;
  final String mail;

  const CheckUp4(
      {super.key,
      required this.value,
      required this.price,
      required this.mail});

  @override
  State<CheckUp4> createState() => _CheckUp4State();
}

late List<AllControl> allControl;
late List<Uint8List?> imageFiles;
late List<String> nameOfImages;
List<String> storageName = ['first', 'second', 'third', 'fouth', 'fifth'];

bool visi = false;
bool uploading = false;
double val = 1;

class _CheckUp4State extends State<CheckUp4> {
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
    return PopScope(
      canPop: !uploading,
      child: Scaffold(
        body: Stack(
          children: [
            !uploading
                ? Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('Background.png'))),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.1),
                          child: Column(
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
                                      MediaQuery.sizeOf(context).height * 0.02,
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
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.02,
                                ),

                                SizedBox(
                                  width: 330,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: (widget.value.toInt()),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Container(
                                            width: 330,
                                            height: (widget.value ==
                                                        allControl[index]
                                                            .numb &&
                                                    visi == true &&
                                                    imageFiles.every(
                                                        (element) =>
                                                            element != null))
                                                ? 260
                                                : 210,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 7, 16, 26),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    const Text(
                                                      'Image',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.02,
                                                    ),
                                                    ///////////////////////////////////////////////////////////////////////////
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Center(
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                width: 57,
                                                                height: 57,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: nameOfImages[
                                                                            index]
                                                                        .isEmpty
                                                                    ? Image
                                                                        .asset(
                                                                        'profile.png',
                                                                        fit: BoxFit
                                                                            .fill,
                                                                      )
                                                                    : Image.memory(
                                                                        imageFiles[
                                                                            index]!,
                                                                        fit: BoxFit
                                                                            .fill),
                                                              ),
                                                              Positioned(
                                                                bottom: 0,
                                                                right: 0,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () =>
                                                                      _selectPicture(
                                                                          index),
                                                                  child:
                                                                      Container(
                                                                    height: 20,
                                                                    width: 20,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          83,
                                                                          113,
                                                                          140),
                                                                    ),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            15,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.02,
                                                        ),
                                                        const Text(
                                                          'Upload image \nMax 5mb',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
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
                                                      key: allControl[index]
                                                          .formKey,
                                                      child: CustomFormField(
                                                        controller:
                                                            allControl[index]
                                                                .controller,
                                                        onChanged: (text) {
                                                          // Custom logic when text changes.
                                                          if (text.characters
                                                                      .length >
                                                                  8 &&
                                                              (widget.value ==
                                                                  allControl[
                                                                          index]
                                                                      .numb)) {
                                                            setState(() {
                                                              visi = true;
                                                            });
                                                          }

                                                          if (text.characters
                                                                  .length <
                                                              8) {
                                                            setState(() {
                                                              visi = false;
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: (widget.value ==
                                                                  allControl[
                                                                          index]
                                                                      .numb &&
                                                              imageFiles.every(
                                                                  (element) =>
                                                                      element !=
                                                                      null))
                                                          ? visi
                                                          : false,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 10.0),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            paystackPop();
                                                          },

                                                          ///
                                                          style: ElevatedButton.styleFrom(
                                                              fixedSize:
                                                                  const Size(
                                                                      180, 41),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                          child: const Text(
                                                            'Pay with Paystack',
                                                            style: TextStyle(
                                                                color:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        83,
                                                                        113,
                                                                        140),
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.02,
                                ),

                                ////// payment button.................
                                ///
                                ///
                              ]),
                        ),
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
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 5, 19, 32),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return UploadPage(
                                    imageFiles: imageFiles,
                                    nameOfImages: nameOfImages,
                                    storageName: storageName,
                                    clientName: [
                                      allControl[0].controller.text.trim(),
                                      allControl[1].controller.text.trim(),
                                      allControl[2].controller.text.trim(),
                                      allControl[3].controller.text.trim(),
                                      allControl[4].controller.text.trim()
                                    ],
                                  );
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(180, 41),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                'Proceed',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 83, 113, 140),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
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

  //////////////////////////////////////////////////////////////////////////////////////

  final paystackPopUp = PaystackPopUp();
  final ref = generateRef();

  void paystackPop() {
    paystackPopUp.openPayWithPaystack(
      email: widget.mail,
      amount: (widget.price * 100).toString(),
      ref: ref,
      whenClose: () {
        const snackBar = SnackBar(
          content: Text(
            'Could\'nt finish payment',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      whenSucess: () {
        setState(() {
          uploading = true;
        });
      },
    );
  }
}
