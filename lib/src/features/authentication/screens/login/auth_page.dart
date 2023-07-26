import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:CMI/src/features/authentication/screens/login/login_or_register.dart';

import '../../../../../../Screens/apphome.dart';

class AuthPage extends StatelessWidget {
  static const String id = 'auth_screen';
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is loggedin
        if(snapshot.hasData) {
          return HomePage();
        }

        //user is not loggedin
        else {
          return LoginOrRegister();
    }
      },
      ),
    );
  }
}
