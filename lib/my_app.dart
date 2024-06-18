import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/dashbaord/check_up.dart';
import 'package:hes_entertainment/dashbaord/check_up1.dart';
import 'package:hes_entertainment/dashbaord/check_up2.dart';
import 'package:hes_entertainment/dashbaord/check_up3.dart';
import 'package:hes_entertainment/dashbaord/check_up4.dart';
import 'package:hes_entertainment/entry/auth_check.dart';
import 'package:hes_entertainment/entry/forget.dart';
import 'package:hes_entertainment/entry/sign_in.dart';
import 'package:hes_entertainment/entry/sign_up.dart';
import 'package:hes_entertainment/profile/profile_page.dart';
import 'package:hes_entertainment/qrs/gen_qr_page.dart';
//import 'package:hes_entertainment/router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of the application.
  final routerDelegate = BeamerDelegate(
      notFoundPage: BeamPage(
          title: '/page not found',
          name: '/not found',
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: SizedBox(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                        child: const Center(
                          child: Text(
                            '404',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 36),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Page Not Found',
                        style: TextStyle(
                            color: Colors.red[400],
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          )),
      initialPath: '/dashboard',
      transitionDelegate: const NoAnimationTransitionDelegate(),
      locationBuilder: RoutesLocationBuilder(routes: {
        '/dashboard': (context, state, data) => const AuthChecker(),
        '/login': (context, state, data) => const SignIn(),
        '/forgetpassword': (context, state, data) => const ForgetPasswordPage(),
        '/signup': (context, state, data) => const SignUp(),
        '/dashboard/checkup_1': (context, state, data) => const CheckUp(),
        '/dashboard/checkup_2': (context, state, data) => const CheckUp1(),
        '/dashboard/checkup_3': (context, state, data) => const CheckUp2(),
        '/dashboard/checkup_4': (context, state, data) => const CheckUp3(),
        '/dashboard/checkup_5': (context, state, data) => const CheckUp4(),
        '/dashboard/checkup_1/codegeneration': (context, state, data) =>
            const GenerateQr(),
        '/dashboard/checkup_2/codegeneration': (context, state, data) =>
            const GenerateQr(),
        '/dashboard/checkup_3/codegeneration': (context, state, data) =>
            const GenerateQr(),
        '/dashboard/checkup_4/codegeneration': (context, state, data) =>
            const GenerateQr(),
        '/dashboard/checkup_5/codegeneration': (context, state, data) =>
            const GenerateQr(),
        '/dashboard/profile': (context, state, data) => const UserProfile(),
        '/dashboard/profile/codegeneration': (context, state, data) =>
            const GenerateQr(),
      }).call,
      guards: <BeamGuard>[
        BeamGuard(
          pathPatterns: [
            '/dashboard/checkup_1',
            '/dashboard/checkup_2',
            '/dashboard/checkup_3',
            '/dashboard/checkup_4',
            '/dashboard/checkup_5',
            '/dashboard/profile',
            '/dashboard/profile/codegeneration',
            '/dashboard/checkup_1/codegeneration',
            '/dashboard/checkup_2/codegeneration',
            '/dashboard/checkup_3/codegeneration',
            '/dashboard/checkup_4/codegeneration',
            '/dashboard/checkup_5/codegeneration',
          ],
          check: (BuildContext context,
              BeamLocation<RouteInformationSerializable<dynamic>> location) {
            if (FirebaseAuth.instance.currentUser?.uid != null) {
              return true;
            } else {
              return false;
            }
          },
          beamToNamed: (origin, target) => '/login',
        ),
        BeamGuard(
          pathPatterns: ['/login', '/signup'],
          check: (BuildContext context,
              BeamLocation<RouteInformationSerializable<dynamic>> location) {
            if (FirebaseAuth.instance.currentUser?.uid == null) {
              return true;
            } else {
              return false;
            }
          },
          beamToNamed: (origin, target) => '/dashboard',
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 32),
          bodyMedium: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        useMaterial3: true,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}
