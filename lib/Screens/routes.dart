import 'package:flutter/material.dart';
import 'package:flutter_app_testing/Screens/apphome.dart';
import 'package:flutter_app_testing/src/features/authentication/screens/Reset_Password/reset_password.dart';
import 'package:flutter_app_testing/src/features/authentication/screens/register/register.dart';
import 'package:flutter_app_testing/src/features/authentication/screens/welcome/welcome_screen.dart';

import '../src/features/authentication/screens/login/login.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RegisterPage.id:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => LoginScreen(onTap: () {  }, callback: (bool) {  },));

      case ResetPasswordScreen.id:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

    // case VerifyAccountScreen.id:
    //   dynamic args = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (_) => VerifyAccountScreen(
    //             token: args['token'],
    //             uid: args['uid'],
    //           ));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text('Something went wrong')),
            ));
    }
  }
}