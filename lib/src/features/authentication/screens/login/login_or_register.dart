import 'package:flutter/material.dart';
import 'package:CMI/src/features/authentication/screens/login/login.dart';
import 'package:CMI/src/features/authentication/screens/register/register.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({Key? key}) : super(key: key);

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show login page
  bool showLoginScreen = true;

  //toggle between register and login page

  void togglePages() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }
  @override
  Widget build(BuildContext context) {
   if (showLoginScreen) {
     return LoginScreen(
       onTap: togglePages, callback: (bool ) {  },
     );
   }else{
     return RegisterPage(
       onTap:togglePages,
     );
   }
  }
}
