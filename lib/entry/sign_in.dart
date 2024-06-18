import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/widgets/form_field.dart';
import 'package:hes_entertainment/widgets/string_ext.dart';
import 'package:hes_entertainment/entry/auth_manger.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController _emailFieldController = TextEditingController();
TextEditingController _passwordFieldController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {
  @override
  void dispose() {
    // textfield dispose control
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
                fit: BoxFit.fill, image: AssetImage('assets/Background.png'))),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.1),
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
                        _emailFieldController.clear();
                        _passwordFieldController.clear();
                        _popUpNew();
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(178, 48),
                          backgroundColor:
                              const Color.fromARGB(255, 83, 113, 140),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Sign In',
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
                      onPressed: () {
                        Beamer.of(context).beamToNamed('/signup');
                      },
                      child: const Text(
                        'Sign up here',
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

  _popUpNew() {
    final HandleAuth authHandler = HandleAuth();
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 600),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionBuilder: (context, Animation<double> animation1,
          Animation<double> animation2, Widget widget) {
        final curvedValue =
            Curves.easeInOutBack.transform(animation1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, -curvedValue * 500, 0.0),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            scrollable: true,
            backgroundColor: const Color.fromARGB(255, 5, 19, 32),
            content: Column(children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Email',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                )),
                            CustomFormField(
                                controller: _emailFieldController,
                                validator: (value) {
                                  if (value == null || !value.isValidEmail) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null; // Return null if validation
                                }),
                          ],
                        ),
                      ),
                      // password form field
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Password',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                )),
                            CustomPassFormField(
                              controller: _passwordFieldController,
                              validator: (value) {
                                if (value == null || !value.isValidPassword) {
                                  return 'password must contain character,\nuppercase,lowercase,number.';
                                }
                                if (value.characters.length <= 6) {
                                  return 'password must be more than six';
                                }
                                return null; // Return null if validation
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 300,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: GestureDetector(
                      onTap: () =>
                          Beamer.of(context).beamToNamed('/forgetpassword'),
                      child: const Text(
                        'forget password?',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),

              /// sign up button
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authHandler.signIn(_emailFieldController.text.trim(),
                          _passwordFieldController.text.trim(), context);
                    } else {
                      return;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(266, 48),
                      backgroundColor: const Color.fromARGB(51, 83, 113, 140),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
            ]),
          ),
        );
      },
    );
  }
}
