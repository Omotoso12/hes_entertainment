import 'package:flutter/material.dart';
import 'package:hes_entertainment/entry/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController textFieldController = TextEditingController();

class _SignUpState extends State<SignUp> {
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
          physics: const NeverScrollableScrollPhysics(),
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
                  const Text(
                    'HES 2.5 \nEntertainment:',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
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
                    width: 270,
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
                  ////////////////////////////////////////////////////////////////
                  const Text(
                    'Pay for your show tickets \nwith no hassle.',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  //////////////////////////////////////////////////////////////////////////////////////
                  ElevatedButton(
                      onPressed: () {
                        dialogPopUp();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(178, 48),
                          backgroundColor:
                              const Color.fromARGB(255, 83, 113, 140),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.04,
                  ),
                  //////////////////////////////////////////////////////////////////////////////
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),

                  /////////////////////////////////////////////////////////////////////////
                  TextButton(
                      onPressed: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const SignIn();
                          })),
                      child: const Text(
                        'Sign in here',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.italic,
                            fontSize: 14),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  dialogPopUp() {
    showDialog(
        context: context,
        builder: ((context) {
          return StatefulBuilder(builder: (context, setStateForDialog) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              scrollable: true,
              backgroundColor: const Color.fromARGB(255, 5, 19, 32),
              content: Column(children: <Widget>[
                /// email input field constainer...
                ///
                SizedBox(
                  height: 76,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Email',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          )),
                      TextField(
                        style: const TextStyle(fontSize: 12),
                        controller: textFieldController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 212, 226, 169),
                                  width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 162, 210, 24),
                                  width: 2)),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),

                /// password input field conatiner
                SizedBox(
                  height: 76,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          )),
                      TextField(
                        style: const TextStyle(fontSize: 12),
                        controller: textFieldController,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 212, 226, 169),
                                  width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 162, 210, 24),
                                  width: 2)),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),

                /// confirm password input textfield
                ///
                SizedBox(
                  height: 76,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Confirm password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          )),
                      TextField(
                        style: const TextStyle(fontSize: 12),
                        enableInteractiveSelection: false,
                        controller: textFieldController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 212, 226, 169),
                                  width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 162, 210, 24),
                                  width: 2)),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),

                /// sign up button
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(266, 48),
                        backgroundColor: const Color.fromARGB(51, 83, 113, 140),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ))
              ]),
            );
          });
        }));
  }
}
