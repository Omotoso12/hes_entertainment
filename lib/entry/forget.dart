import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/entry/auth_manger.dart';
import 'package:hes_entertainment/widgets/form_field.dart';
import 'package:hes_entertainment/widgets/string_ext.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

TextEditingController _emailController = TextEditingController();
bool sent = false;
final _formKeys = GlobalKey<FormState>();

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final HandleAuth authHandler = HandleAuth();
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/Background.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKeys,
              child: SizedBox(
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
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || !value.isValidEmail) {
                            return 'Please enter a valid email address';
                          }
                          return null; // Return null if validation
                        }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: !sent
                    ? () async {
                        if (_formKeys.currentState!.validate()) {
                          await authHandler
                              .forgotPassword(
                                  _emailController.text.trim(), context)
                              .whenComplete(() {
                            setState(() {
                              sent = true;
                            });
                          });
                        } else {
                          return;
                        }
                      }
                    : () {
                        setState(() {
                          sent = false;
                        });
                        _emailController.clear();
                        Beamer.of(context).beamToNamed('/login');
                      },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(266, 48),
                    backgroundColor: const Color.fromARGB(51, 83, 113, 140),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: !sent
                    ? Text(
                        'Send',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : Text(
                        'return',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ))
          ],
        ),
      )),
    );
  }
}
