import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hes_entertainment/entry/auth_check.dart';
import 'package:hes_entertainment/entry/sign_in.dart';
import 'package:hes_entertainment/entry/sign_up.dart';
import 'package:hes_entertainment/profile/profile_page.dart';
import 'package:hes_entertainment/qrs/gen_qr_page.dart';
//import 'package:hes_entertainment/router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of the application.
  final routerDelegate = BeamerDelegate(
      initialPath: '/dashboard',
      transitionDelegate: const NoAnimationTransitionDelegate(),
      locationBuilder: RoutesLocationBuilder(routes: {
        '/dashboard': (context, state, data) => const AuthChecker(),
        '/login': (context, state, data) => const SignIn(),
        '/signup': (context, state, data) => const SignUp(),
        '/dashboard/profile': (context, state, data) => const UserProfile(),
        '/dashboard/profile/codegeneration': (context, state, data) =>
            const GenerateQr(),
      }).call,
      guards: <BeamGuard>[
        BeamGuard(
          pathPatterns: [
            '/dashboard/profile',
            '/dashboard/profile/codegeneration'
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
